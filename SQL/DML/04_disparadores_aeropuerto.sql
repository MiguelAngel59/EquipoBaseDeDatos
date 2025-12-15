-----------------------------------------------DISPARADOR 1----------------------------------------------------------------------------------------
-- Este disparador se encarga de avalar las reglas de negocio a la hora de crear un vuelo
-- Para ello describimos las siguientes funciones de validación las cuales se usarán dentro del trigger
-- Finalmente usamos una transacción pues un Vuelo se compone de un registro en la tabla vuelo y un registro en la tabla programacion_vuelo


-- ...........................................VALIDACIONES.................................................

-- Aux: Determinar solapamiento de intervalos.
   -- devuelve true si existe solapamiento entre el intervalo a y b.
CREATE OR REPLACE FUNCTION existe_solapamiento_temporal(a_inicio TIMESTAMP, a_final TIMESTAMP, b_inicio TIMESTAMP, b_final TIMESTAMP)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN NOT (a_final <= b_inicio OR b_final <= a_inicio);
END;
$$ LANGUAGE plpgsql IMMUTABLE;

COMMENT ON FUNCTION existe_solapamiento_temporal(TIMESTAMP, TIMESTAMP, TIMESTAMP, TIMESTAMP)
IS 'Devuelve true si los intervalos (a_inicio,a_final) y (b_inicio,b_final) se solapan.';


-- 1: Validar disponibilidad de un PILOTO en un intervalo de tiempo.
   -- Retorna 1 = disponible, 0 = no disponible.
CREATE OR REPLACE FUNCTION chk_piloto_disponibilidad_temporal(id_piloto_input INT, inicio_intervalo TIMESTAMP, final_intervalo TIMESTAMP)
RETURNS INTEGER AS $$
DECLARE
    cnt INT;
BEGIN
    SELECT COUNT(*) INTO cnt
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_piloto = id_piloto_input
      AND v.estado <> 'CANCELADO'
      AND existe_solapamiento_temporal(pv.etd, pv.eta, inicio_intervalo, final_intervalo);

    IF cnt = 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION chk_piloto_disponibilidad_temporal(INT, TIMESTAMP, TIMESTAMP)
IS 'Valida disponibilidad de un PILOTO en un intervalo de tiempo. 1 si el piloto no tiene vuelos que se solapen con el intervalo dado; 0 si hay conflicto.';


-- 2: Validar disponibilidad de un AVIOn en un intervalo de tiempo.
   -- Retorna 1 = disponible, 0 = no disponible.
CREATE OR REPLACE FUNCTION chk_avion_disponibilidad_temporal(id_avion_input INT, inicio_intervalo TIMESTAMP, final_intervalo TIMESTAMP)
RETURNS INTEGER AS $$
DECLARE
    cnt INT;
BEGIN
    SELECT COUNT(*) INTO cnt
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_avion = id_avion_input
      AND v.estado <> 'CANCELADO'
      AND existe_solapamiento_temporal(pv.etd, pv.eta, inicio_intervalo, final_intervalo);

    IF cnt = 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION chk_avion_disponibilidad_temporal(INT, TIMESTAMP, TIMESTAMP)
IS 'Valida disponibilidad de un AVION en un intervalo de tiempo. 1 si el avión no tiene programaciones que se solapen; 0 si hay conflicto.';


-- 3: Validar licencia válida para PILOTO para un tipo de vuelo en una fecha determinada.
   --  reglas:
     -- Debe tener vigencia en fecha del ETD.
     -- PRIVADO -> PPL.
     -- COMERCIAL/CARGA -> CPL o ATPL.
   --  Retorna 1 = valida, 0 = invalida
CREATE OR REPLACE FUNCTION chk_piloto_licencia_valida(id_piloto_input INT, tipo_vuelo_input VARCHAR, ref_date TIMESTAMP)
RETURNS INTEGER AS $$
DECLARE
    cnt INT;
    ref_d DATE := ref_date::date;
BEGIN
    SELECT COUNT(*) INTO cnt
    FROM licencia_piloto lp
    WHERE lp.id_piloto = id_piloto_input
      AND lp.fecha_emision <= ref_d
      AND lp.fecha_vencimiento >= ref_d
      AND (
           (tipo_vuelo_input = 'PRIVADO' AND lp.tipo_licencia = 'PPL')
        OR (tipo_vuelo_input IN ('COMERCIAL','CARGA') AND lp.tipo_licencia IN ('CPL','ATPL'))
      );

    IF cnt > 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION chk_piloto_licencia_valida(INT, VARCHAR, TIMESTAMP)
IS 'Valida que el piloto tenga al menos una licencia vigente en la fecha de referencia (ref_date) y que sea compatible con el tipo de vuelo.';


-- 4: Validar estado operativo del avión
   -- Retorna 1 = OPERATIVO, 0 = no operativo o inexistente
CREATE OR REPLACE FUNCTION chk_avion_estado_operativo(id_avion_input INT)
RETURNS INTEGER AS $$
DECLARE
    estado VARCHAR;
BEGIN
    SELECT estado_avion INTO estado FROM avion WHERE id_avion = id_avion_input;
    IF estado IS NULL THEN
        RETURN 0;
    END IF;
    IF estado = 'OPERATIVO' THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION chk_avion_estado_operativo(INT)
IS 'Verifica que el avión exista y tenga estado_avion = OPERATIVO.';


-- 5: Validar disponibilidad por UBICACIÓN del PILOTO
   -- Se busca establecer una secuencia estricta de desplazamientos, de modo que solo podemos agregar vuelos que no rompan la secuencia de desplazamiento existente del piloto
   -- Lo anterior es que, después del tiempo deseado no deben haber más vuelos por realizar, ya que rompería la secuencia una inserción intermedia.
   -- Si el piloto se encuentra en el aeropuerto deseado y no tiene vuelos por realizar, está disponible
   -- Caso contrario, se busca la última programación (de vuelo no cancelado) para obtener la posición final del piloto (por la primera condición se sabe que es antes del tiempo deseado).
   -- Si la posición final del vuelo es la ubicación deseada (origen del vuelo), entonces el piloto estará disponible, en caso contrario no estará disponible.
   -- Retorna 1 = Disponible   0 = No Disponible
CREATE OR REPLACE FUNCTION chk_piloto_disponible_en_ubicacion(
    id_piloto_input INT,
    aeropuerto_deseado INT,
    tiempo_deseado TIMESTAMP
)
RETURNS INTEGER AS $$
DECLARE
    ultimo_prog_id INT;
    ultimo_vuelo_destino INT;
    ubicacion_actual INT;
    vuelos_futuros INT;
BEGIN

    -- 0) Asegurar secuencia estricta: asegurarnos que NO existan vuelos con estado PROGRAMADO después de tiempo_deseado
      --  de este modo los vuelos se insertan en forma de pila en base a la secuencia de desplazamiento de los pilotos
    SELECT COUNT(*) INTO vuelos_futuros
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_piloto = id_piloto_input
      AND v.estado = 'PROGRAMADO'
      AND pv.eta > tiempo_deseado;  -- programaciones que ocurren después del tiempo que queremos

    IF vuelos_futuros > 0 THEN
        RETURN 0; -- existen vuelos programados después, no permitimos insertar (rompería la secuencia)
    END IF;

    -- 1) Ubicación actual: si el empleado (piloto) tiene id_aeropuerto igual al origen y no tiene vuelos por realizar
    SELECT id_aeropuerto INTO ubicacion_actual
    FROM empleado
    WHERE id_empleado = id_piloto_input;

    IF ubicacion_actual IS NOT NULL AND ubicacion_actual = aeropuerto_deseado THEN
        -- Si está en el aeropuerto y NO tiene vuelos tiene más vuelo en estado PROGRAMADO, osea por realizar
        SELECT COUNT(*) INTO vuelos_futuros
        FROM programacion_vuelo pv
        JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
        WHERE pv.id_piloto = id_piloto_input
          AND v.estado = 'PROGRAMADO';

        IF vuelos_futuros = 0 THEN
            RETURN 1; -- disponible, piloto en ubicacion deseada y sin vuelos por realizar
        END IF; -- si tiene vuelos programados, entonces debemos determinar en qué aeropuerto se encontrará antes del tiempo deseado
    END IF;
   

    -- 2) Tiene vuelos por realizar : buscar el último vuelo (no cancelado) y ver el destino, es la posición final del piloto en la secuencia
    SELECT pv.id_programacion INTO ultimo_prog_id
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_piloto = id_piloto_input
      AND v.estado <> 'CANCELADO'
    ORDER BY pv.eta DESC
    LIMIT 1;


    IF ultimo_prog_id IS NULL THEN
        -- No hay vuelos por realizar o en proceso antes de tiempo_deseado y el piloto no se encuentra en el aeropuerto deseado
        RETURN 0;
    END IF;

    -- Obtener destino del último vuelo
    SELECT v.destino INTO ultimo_vuelo_destino
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_programacion = ultimo_prog_id;

    IF ultimo_vuelo_destino IS NULL OR ultimo_vuelo_destino <> aeropuerto_deseado THEN
        RETURN 0; -- el último destino no es el aeropuerto de origen pedido
    END IF;

    RETURN 1; -- se encontrará en el aeropuerto deseado antes del tiempo deseado y no tiene más vuelos programados despúes
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION chk_piloto_disponible_en_ubicacion(INT, INT, TIMESTAMP)
IS 'Determina si el piloto estará en el aeropuerto de origen en tiempo_deseado. 1=disponible, 0=no disponible';


-- 6: Validar disponibilidad por UBICACIÓN del AVIÓN (sin CANCELADOS)
   -- Igual lógica que para piloto, usando avion.id_aeropuerto
--Retorna 1 = Disponible, 0 = No disponible
CREATE OR REPLACE FUNCTION chk_avion_disponible_en_ubicacion(
    id_avion_input INT,
    aeropuerto_deseado INT,
    tiempo_deseado TIMESTAMP
)
RETURNS INTEGER AS $$
DECLARE
    ultimo_prog_id INT;
    ultimo_vuelo_destino INT;
    ubicacion_actual INT;
    vuelos_futuros INT;
BEGIN
    SELECT COUNT(*) INTO vuelos_futuros
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_avion = id_avion_input
      AND v.estado = 'PROGRAMADO'
      AND pv.eta > tiempo_deseado;

    IF vuelos_futuros > 0 THEN
        RETURN 0;
    END IF;

   
    SELECT id_aeropuerto INTO ubicacion_actual
    FROM avion
    WHERE id_avion = id_avion_input;

    IF ubicacion_actual IS NOT NULL AND ubicacion_actual = aeropuerto_deseado THEN
        SELECT COUNT(*) INTO vuelos_futuros
        FROM programacion_vuelo pv
        JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
        WHERE pv.id_avion = id_avion_input
          AND v.estado = 'PROGRAMADO';

        IF vuelos_futuros = 0 THEN
            RETURN 1;
        END IF;
    END IF;

    SELECT pv.id_programacion INTO ultimo_prog_id
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_avion = id_avion_input
      AND v.estado <> 'CANCELADO'
    ORDER BY pv.eta DESC
    LIMIT 1;

    IF ultimo_prog_id IS NULL THEN
        RETURN 0;
    END IF;

    RETURN 1;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION chk_avion_disponible_en_ubicacion(INT, INT, TIMESTAMP)
IS 'Determina si el avión estará en el aeropuerto_deseado en tiempo_deseado. 1=disponible, 0=no';


-- 7: Validar capacidad disponible de la terminal
   -- Se obtiene id_terminal via puerta -> terminal
   -- Cuenta programaciones solapadas
   -- Retorna 1 = hay capacidad, 0 = no hay
CREATE OR REPLACE FUNCTION chk_terminal_capacidad_por_puerta(id_puerta_input INT, inicio_intervalo TIMESTAMP, final_intervalo TIMESTAMP)
RETURNS INTEGER AS $$
DECLARE
    id_terminal_local INT;
    capacidad INT;
    concurrentes INT;
BEGIN
    SELECT id_terminal INTO id_terminal_local 
    FROM puerta 
    WHERE id_puerta = id_puerta_input;

    IF id_terminal_local IS NULL THEN
        RETURN 0;
    END IF;

    SELECT capacidad_aviones INTO capacidad 
    FROM terminal 
    WHERE id_terminal = id_terminal_local;
    
    IF capacidad IS NULL THEN
        RETURN 0;
    END IF;

    SELECT COUNT(*) INTO concurrentes
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    JOIN puerta p ON pv.id_puerta = p.id_puerta
    WHERE p.id_terminal = id_terminal_local
      AND v.estado <> 'CANCELADO'
      AND existe_solapamiento_temporal(pv.etd, pv.eta, inicio_intervalo, final_intervalo);

    IF concurrentes < capacidad THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION chk_terminal_capacidad_por_puerta(INT, TIMESTAMP, TIMESTAMP)
IS 'Verifica que la terminal tenga capacidad libre para el el avion en un intervalo de tiempo';


-- 8: Validar existencia de pista operativa en el AEROPUERTO
   -- Retorna 1 = al menos una pista OPERATIVA, 0 = no
CREATE OR REPLACE FUNCTION chk_aeropuerto_tiene_pista_operativa(id_aeropuerto_input INT)
RETURNS INTEGER AS $$
DECLARE
    cnt INT;
BEGIN
    SELECT COUNT(*) INTO cnt
    FROM pista
    WHERE id_aeropuerto = id_aeropuerto_input
      AND estado = 'OPERATIVA';

    IF cnt > 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION chk_aeropuerto_tiene_pista_operativa(INT)
IS 'Verifica que exista al menos una pista en estado OPERATIVA en el aeropuerto dado.';




--   FUNCION TRIGGER: 
   -- Para validar que la programacion_vuelo y su vuelo asociado cumplan con las reglas de negocio antes de INSERT/UPDATE en programacion_vuelo
   -- Obtiene info del vuelo (tipo_vuelo, origen) para verificaciones
   -- Ejecuta todas las funciones de verificacion necesarias
   -- Si falla algo => RAISE EXCEPTION, la programación de vuelo es invalida
CREATE OR REPLACE FUNCTION trg_validar_programacion_vuelo()
RETURNS TRIGGER AS $$
DECLARE
    vuelo_tipo VARCHAR;
    vuelo_origen INT;
BEGIN
    -- obtener datos del vuelo asociado (debe existir)
    SELECT tipo_vuelo, origen INTO vuelo_tipo, vuelo_origen
    FROM vuelo
    WHERE id_vuelo = NEW.id_vuelo;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Validación: no existe vuelo con id_vuelo=%', NEW.id_vuelo;
    END IF;

    -- 1 = valido, 0 = invalido

    -- 1) capacidad terminal (cuando se asigne)
    -- 4 horas de tolerancia para que el avion despegue
    IF NEW.id_puerta IS NOT NULL THEN
        IF chk_terminal_capacidad_por_puerta(NEW.id_puerta, NEW.etd, NEW.etd + interval '4 hours') = 0 THEN
            RAISE EXCEPTION 'Validación: la terminal de la puerta % no tiene capacidad disponible entre % y %.', NEW.id_puerta, NEW.etd, NEW.eta;
        END IF;
    END IF;

    -- 2) existe pista operativa en aeropuerto origen
    IF chk_aeropuerto_tiene_pista_operativa(vuelo_origen) = 0 THEN
        RAISE EXCEPTION 'Validación: el aeropuerto origen % no tiene pistas en estado OPERATIVA.', vuelo_origen;
    END IF;

    -- 3) estado de avión operativo
    IF chk_avion_estado_operativo(NEW.id_avion) = 0 THEN
        RAISE EXCEPTION 'Validación: el avión % no está en estado OPERATIVO.', NEW.id_avion;
    END IF;

    -- 4) licencia vigente y tipo (usamos NEW.etd como referencia)
    IF chk_piloto_licencia_valida(NEW.id_piloto, vuelo_tipo, NEW.etd) = 0 THEN
        RAISE EXCEPTION 'Validación: el piloto % no tiene licencia vigente y compatible con el tipo de vuelo (% ) para la fecha %.', NEW.id_piloto, vuelo_tipo, NEW.etd::date;
    END IF;

    -- 5) comprobación temporal piloto
    -- se agrega 1 hora a cada extremo del intervalo como tolerancia de demora del vuelo anterior o del mismo vuelo
    IF chk_piloto_disponibilidad_temporal(NEW.id_piloto, NEW.etd - interval '2 hours', NEW.eta + interval '2 hours') = 0 THEN
        RAISE EXCEPTION 'Validación: piloto % tiene programación que se solapa con (etd=% , eta=%).', NEW.id_piloto, NEW.etd, NEW.eta;
    END IF;

    -- 6) comprobación temporal avión
    -- se agregan 3 horas de tolerancia, 2 de demora 1 de reacondicionamiento
    IF chk_avion_disponibilidad_temporal(NEW.id_avion, NEW.etd - interval '3 hours', NEW.eta + interval '3 hours') = 0 THEN
        RAISE EXCEPTION 'Validación: avión % tiene programación que se solapa con (etd=% , eta=%).', NEW.id_avion, NEW.etd, NEW.eta;
    END IF;

    -- 7) disponibilidad ubicación piloto
    IF chk_piloto_disponible_en_ubicacion(NEW.id_piloto, vuelo_origen, NEW.etd) = 0 THEN
        RAISE EXCEPTION 'Validación: el piloto % no estará en aeropuerto origen % en la fecha/hora de salida %.', NEW.id_piloto, vuelo_origen, NEW.etd;
    END IF;

    -- 8) disponibilidad ubicación avión
    IF chk_avion_disponible_en_ubicacion(NEW.id_avion, vuelo_origen, NEW.etd) = 0 THEN
        RAISE EXCEPTION 'Validación: el avión % no estará en aeropuerto origen % en la fecha/hora de salida %.', NEW.id_avion, vuelo_origen, NEW.etd;
    END IF;

    -- Todo OK, se permite la operación
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- TRIGGER
-- Creación del trigger al momento de crear o actualizar programación_vuelo
CREATE TRIGGER trg_programacion_vuelo_before_ins_upd
BEFORE INSERT OR UPDATE ON programacion_vuelo
FOR EACH ROW EXECUTE FUNCTION trg_validar_programacion_vuelo();

COMMENT ON FUNCTION trg_validar_programacion_vuelo()
IS 'Trigger que valida reglas de negocio antes de insertar/actualizar en programacion_vuelo (disponibilidades, licencias, estado de avión, capacidad terminal, pistas).';



-- TRANSACCION
-- Procedimiento transaccional: Inserta vuelo -> programacion_vuelo
   -- La verificación se realiza en el trigger de programacion_vuelo, se requiere una transacción para primero crear el vuelo y posterior su programacion_vuelo asociada
   -- Al crear la programacion_vuelo la validación es en conjunto tanto en datos como en creación en ambas tablas;
   -- Si la validación no pasa la transacción se cancela y el vuelo tampoco será creado.
CREATE OR REPLACE PROCEDURE registrar_vuelo_completo(
    v_id_vuelo INT,
    v_origen INT,
    v_destino INT,
    v_tipo_vuelo VARCHAR,
    v_codigo_vuelo VARCHAR,
    p_id_programacion INT,
    p_id_avion INT,
    p_id_piloto INT,
    p_id_puerta INT,
    p_etd TIMESTAMP,
    p_eta TIMESTAMP
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Insert del vuelo
    INSERT INTO vuelo (id_vuelo, origen, destino, estado, tipo_vuelo, codigo_vuelo, tiempo_salida, tiempo_llegada)
    VALUES (v_id_vuelo, v_origen, v_destino, 'PROGRAMADO', v_tipo_vuelo, v_codigo_vuelo, NULL, NULL);

    -- Insert de la programación: el trigger trg_validar_programacion_vuelo se ejecutará y validará.
    INSERT INTO programacion_vuelo (id_programacion, id_vuelo, id_avion, id_piloto, id_puerta, etd, eta)
    VALUES (p_id_programacion, v_id_vuelo, p_id_avion, p_id_piloto, p_id_puerta, p_etd, p_eta);
END;
$$;

COMMENT ON PROCEDURE registrar_vuelo_completo(INT, INT, INT, VARCHAR, VARCHAR, INT, INT, INT, INT, TIMESTAMP, TIMESTAMP)
IS 'Inserta vuelo y su programación en una sola operación transaccional. Si el trigger de programacion_vuelo falla, la transacción completa se revierte y se devuelve el error.';




-----------------------------------------------DISPARADOR 2----------------------------------------------------------------------------------------
--  Para corroborar las reglas de negocio a la hora de insertar o actualizar un boleto de un vuelo

-- FUNCION TRIGGER: 
-- Validar que solo se generen boletos válidos para vuelos COMERCIALES
-- Verificar que no se exceda la capacidad del avión asociado
-- Verificar que solo se puedan generar o actualizar boletos para vuelos con estado PROGRAMADO

CREATE OR REPLACE FUNCTION trg_boleto_validaciones()
RETURNS TRIGGER AS $$
DECLARE
    tipo_v         VARCHAR(20);
    estado_v       VARCHAR(20);
    capacidad_max  INT;
    boletos_actuales INT;
BEGIN
    -- Obtener datos del vuelo y del avión
    SELECT v.tipo_vuelo, v.estado, a.capacidad_pasajeros
    INTO tipo_v, estado_v, capacidad_max
    FROM programacion_vuelo pv
        JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
        JOIN avion a ON pv.id_avion = a.id_avion
    WHERE pv.id_programacion = NEW.id_programacion_vuelo;

    -- Validar solo vuelos COMERCIALES
    IF tipo_v <> 'COMERCIAL' THEN
        RAISE EXCEPTION
            'No se pueden emitir boletos para vuelos de tipo %, solo COMERCIAL.',
            tipo_v;
    END IF;

    -- Validar estado del vuelo
    IF estado_v <> 'PROGRAMADO' THEN
        RAISE EXCEPTION
            'No se pueden emitir boletos. El vuelo está en estado: % (solo PROGRAMADO permite ventas).',
            estado_v;
    END IF;

    -- Contar boletos ya vendidos
    SELECT COUNT(*) INTO boletos_actuales
    FROM boleto
    WHERE id_programacion_vuelo = NEW.id_programacion_vuelo;

    -- Validar capacidad disponible
    IF boletos_actuales >= capacidad_max THEN
        RAISE EXCEPTION
            'No se pueden emitir más boletos: capacidad % alcanzada (% boletos vendidos).',
            capacidad_max, boletos_actuales;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- TRIGGER

CREATE TRIGGER tg_boleto_validaciones
BEFORE INSERT ON boleto
FOR EACH ROW
EXECUTE FUNCTION trg_boleto_validaciones();




-----------------------------------------------DISPARADOR 3----------------------------------------------------------------------------------------
-- Trigger para manejar las implicaciones de cambio de estado de un vuelo


-- FUNCION TRIGGER
-- Trigger para actualizar tiempos de registro del vuelo y cambio en la ubicación de avión y piloto en base al cambio de estado de un vuelo
-- En específico para cambios cuando el vuelo despega o aterriza

CREATE OR REPLACE FUNCTION trg_update_tiempos_y_ubicacion_vuelo()
RETURNS TRIGGER AS $$
DECLARE
    destino_aeropuerto INT;
    piloto_id INT;
    avion_id INT;
BEGIN
    -- Obtener recursos asignados (piloto y avión)
    SELECT pv.id_piloto, pv.id_avion
    INTO piloto_id, avion_id
    FROM programacion_vuelo pv
    WHERE pv.id_vuelo = NEW.id_vuelo
    LIMIT 1;

    -- Obtener aeropuerto destino
    SELECT destino INTO destino_aeropuerto
    FROM vuelo
    WHERE id_vuelo = NEW.id_vuelo;

    -- Cambio PROGRAMADO → EN_VUELO (despegó)
    IF OLD.estado = 'PROGRAMADO' AND NEW.estado = 'EN_VUELO' THEN
        
        -- Registrar hora de salida
        NEW.tiempo_salida := NOW();

        -- Quitar ubicación actual (ya no están en aeropuerto)
        UPDATE empleado
        SET id_aeropuerto = NULL
        WHERE id_empleado = piloto_id;

        UPDATE avion
        SET id_aeropuerto = NULL
        WHERE id_avion = avion_id;

    END IF;


    -- Cambio EN_VUELO → FINALIZADO (aterrizó)
    IF OLD.estado = 'EN_VUELO' AND NEW.estado = 'FINALIZADO' THEN
        
        -- Registrar hora de llegada
        NEW.tiempo_llegada := NOW();

        -- Asignar ubicación final en el aeropuerto destino
        UPDATE empleado
        SET id_aeropuerto = destino_aeropuerto
        WHERE id_empleado = piloto_id;

        UPDATE avion
        SET id_aeropuerto = destino_aeropuerto
        WHERE id_avion = avion_id;

    END IF;


    -- Prohibición FINALIZADO → otro estado
    IF OLD.estado = 'FINALIZADO' AND NEW.estado <> 'FINALIZADO' THEN
        RAISE EXCEPTION
            'No se puede cambiar un vuelo FINALIZADO a otro estado (%).',
            NEW.estado;
    END IF;

    -- Prohibición FINALIZADO → otro estado
    IF OLD.estado = 'EN_VUELO' AND NEW.estado = 'PROGRAMADO' THEN
        RAISE EXCEPTION
            'No se puede cambiar un vuelo EN_VUELO a otro PROGRAMADO.';
    END IF;

    IF OLD.estado = 'EN_VUELO' AND NEW.estado = 'CANCELADO' THEN
        RAISE EXCEPTION
            'No se puede cancelar un vuelo EN_VUELO, cambie el destino al aeropuerto de retorno';
    END IF;

    IF OLD.estado = 'PROGRAMADO' AND NEW.estado = 'FINALIZADO' THEN
        RAISE EXCEPTION
            'No se puede finalizar un vuelo sin haber iniciado, use cancelar';
    END IF;

    IF OLD.estado = 'CANCELADO' AND NEW.estado <> 'CANCELADO' THEN
        RAISE EXCEPTION
            'No se puede descancelar un vuelo, vuelva a programar un nuevo vuelo';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- FUNCION TRIGGER
-- Se ejecuta al actualizar vuelo, en específico al realizar cambios en el estado
CREATE TRIGGER tg_update_tiempos_y_ubicacion_vuelo
BEFORE UPDATE ON vuelo
FOR EACH ROW
EXECUTE FUNCTION trg_update_tiempos_y_ubicacion_vuelo();





-----------------------------------------------DISPARADOR 4----------------------------------------------------------------------------------------
-- Disparador para el cambio de estado de vuelo PROGRAMADO -> CANCELADO
-- Se enfoca en abordar el problema de suptura de secuencia de diponibilidad por la cancelación de un vuelo y sus vuelos subsecuencuetes

-- Funciones auxiliares

-- Devuelve un piloto disponible en una aeropuerto dado en el intervalo inicio-final
CREATE OR REPLACE FUNCTION obtener_piloto_disponible(
    aeropuerto_origen INT,
    tipo_vuelo_input VARCHAR,
    inicioIntervalo TIMESTAMP,
    finalIntervalo TIMESTAMP
)
RETURNS INT AS $$
DECLARE
    pid INT;
BEGIN
    SELECT p.id_empleado
    INTO pid
    FROM piloto p
    JOIN empleado e ON e.id_empleado = p.id_empleado
    WHERE chk_piloto_disponible_en_ubicacion(p.id_empleado, aeropuerto_origen, inicioIntervalo) = 1
      AND chk_piloto_disponibilidad_temporal(p.id_empleado, inicioIntervalo, finalIntervalo) = 1
      AND chk_piloto_licencia_valida(p.id_empleado, tipo_vuelo_input, inicioIntervalo) = 1
    LIMIT 1;

    RETURN pid; -- puede ser NULL
END;
$$ LANGUAGE plpgsql;



-- Devuelve un avion disponible en una aeropuerto dado en el intervalo inicio-final
CREATE OR REPLACE FUNCTION obtener_avion_disponible(
    aeropuerto_origen INT,
    inicioIntervalo TIMESTAMP,
    finalIntervalo TIMESTAMP
)
RETURNS INT AS $$
DECLARE
    aid INT;
BEGIN
    SELECT a.id_avion
    INTO aid
    FROM avion a
    WHERE chk_avion_estado_operativo(a.id_avion) = 1
      AND chk_avion_disponible_en_ubicacion(a.id_avion, aeropuerto_origen, inicioIntervalo) = 1
      AND chk_avion_disponibilidad_temporal(a.id_avion, inicioIntervalo, finalIntervalo) = 1
    LIMIT 1;

    RETURN aid;
END;
$$ LANGUAGE plpgsql;


-- Procedimiento almacenado
-- Identifica vuelos afectados
-- Reasigna recursos encadenadamente
-- Todo dentro de UNA transacción
CREATE OR REPLACE PROCEDURE propagar_cancelacion(id_vuelo_cancelado INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v RECORD;
    piloto_original INT;
    avion_original  INT;
    piloto_actual   INT;
    avion_actual    INT;
    eta_cancelado   TIMESTAMP;
BEGIN
    SELECT pv.id_piloto, pv.id_avion, pv.eta
    INTO piloto_original, avion_original, eta_cancelado
    FROM programacion_vuelo pv
    WHERE pv.id_vuelo = id_vuelo_cancelado;

    piloto_actual := piloto_original;
    avion_actual  := avion_original;

    FOR v IN
        SELECT pv.id_programacion, pv.id_vuelo, pv.id_piloto, pv.id_avion,
               pv.etd, pv.eta, vu.origen, vu.tipo_vuelo
        FROM programacion_vuelo pv
        JOIN vuelo vu ON vu.id_vuelo = pv.id_vuelo
        WHERE vu.estado = 'PROGRAMADO'
          AND pv.etd >= eta_cancelado
          AND (pv.id_piloto = piloto_original OR pv.id_avion = avion_original)
        ORDER BY pv.etd
    LOOP

        -- piloto afectado
        IF v.id_piloto = piloto_actual THEN
            piloto_actual := obtener_piloto_disponible(
                v.origen, v.tipo_vuelo, v.etd, v.eta
            );

            IF piloto_actual IS NULL THEN
                RAISE EXCEPTION 'No hay piloto disponible para vuelo %', v.id_vuelo;
            END IF;

            UPDATE programacion_vuelo
            SET id_piloto = piloto_actual
            WHERE id_programacion = v.id_programacion;
        END IF;

        -- avión afectado
        IF v.id_avion = avion_actual THEN
            avion_actual := obtener_avion_disponible(
                v.origen, v.etd, v.eta
            );

            IF avion_actual IS NULL THEN
                RAISE EXCEPTION 'No hay avión disponible para vuelo %', v.id_vuelo;
            END IF;

            UPDATE programacion_vuelo
            SET id_avion = avion_actual
            WHERE id_programacion = v.id_programacion;
        END IF;

    END LOOP;
END;
$$;


-- Funcion Trigger
-- Cuando se detecta la cancelación de un vuelo PROGRAMADO llama al proceso almacenado de reasignación de recursos
CREATE OR REPLACE FUNCTION trg_cancelacion_vuelo()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.estado = 'CANCELADO' AND OLD.estado <> 'CANCELADO' THEN
        CALL propagar_cancelacion(NEW.id_vuelo);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Trigger
CREATE TRIGGER cancelar_vuelo
AFTER UPDATE OF estado ON vuelo
FOR EACH ROW
EXECUTE FUNCTION trg_cancelacion_vuelo();








/* Descomentar y ver ejemplos
----------------------------------------------- EJEMPLOS ----------------------------------------------------------------------------------------

----------------- TRIGGER 1: VUELO --------------------

-- INSERT correcto
INSERT INTO vuelo (id_vuelo,origen,destino,estado,tipo_vuelo,codigo_vuelo,tiempo_salida,tiempo_llegada)
VALUES (10001,1,2,'PROGRAMADO','COMERCIAL','AT200',NULL,NULL);
-- Programación que pasa todas las validaciones
INSERT INTO programacion_vuelo (id_programacion,id_vuelo,id_avion,id_piloto,id_puerta,etd,eta)
VALUES (10001,10001,11,6,1, now() + interval '2 days', now() + interval '2 days' + interval '3 hours');
-- Debe INSERTARSE correctamente: hay pista operativa, avión OPERATIVO, licencia ATPL vigente,
-- terminal con capacidad, disponibilidad por ubicación ok.

-- Usando el procedimiento reistrar_vuelo_completo (RECOMENDADO y no hacerlo de la anterior forma)
-- Debería se correcto, es un vuelo subsecuente del anterior
CALL registrar_vuelo_completo(
    10002, 2, 1, 'COMERCIAL', 'AT201',
    10002, 11, 6, 7,
    (now() + interval '3 days')::TIMESTAMP,
    (now() + interval '3 days' + interval '3 hours')::TIMESTAMP
);

-- INSERT incorrecto (solapamiento temporal)
CALL registrar_vuelo_completo(
    10003, 2, 3, 'CARGA', 'AT202',
    10003, 11, 6, 7,
    (now() + interval '3 days')::TIMESTAMP,
    (now() + interval '3 days' + interval '4 hours')::TIMESTAMP
);

-- INSERT incorrecto (no hay disponibilidad por ubicacion de recursos)
CALL registrar_vuelo_completo(
    10004, 1, 2, 'COMERCIAL', 'AT202',
    10004, 1, 1, 1,
    (now() + interval '2 days')::TIMESTAMP,
    (now() + interval '2 days' + interval '3 hours')::TIMESTAMP
);




----------------- TRIGGER 2: BOLETO --------------------

-- INSERT correcto (vuelo PROGRAMADO, COMERCIAL, con espacios)
INSERT INTO boleto (id_programacion_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(7, 16, now(), 16);

-- INSERT incorrecto (vuelo finalizado)
INSERT INTO boleto (id_programacion_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(2, 1, '2025-10-01', 20);

-- INSERT incorrecto (vuelo de CARGA)
INSERT INTO boleto (id_programacion_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(9, 22, now(), 16);


----------------- TRIGGER 3: VUELO CAMBIO DE ESTADO --------------------
-- Vuelo 7 se encuentra programado, su origen es el aeropuerto 4, destino aeropuerto 1
-- Tiene designado el piloto 2 y el avion 2

-- PROGGRAMADO -> EN_VUELO
UPDATE vuelo SET estado = 'EN_VUELO'
WHERE id_vuelo = 7;

-- id_aeropuerto debe ser NULL
SELECT id_aeropuerto FROM empleado
WHERE id_empleado = 2;

SELECT id_aeropuerto FROM avion
WHERE id_avion = 2;

-- EN_VUELO -> FINALIZADO
UPDATE vuelo SET estado = 'FINALIZADO'
WHERE id_vuelo = 7;

-- id_aeropuerto debe ser 1 (aeropuerto destino)
SELECT id_aeropuerto FROM empleado
WHERE id_empleado = 2;

SELECT id_aeropuerto FROM avion
WHERE id_avion = 2;

*/




