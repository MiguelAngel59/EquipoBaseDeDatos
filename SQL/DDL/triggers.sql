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
   -- Determinar si se encuentra o encontrará en el aeropuerto deseado en determinado tiempo
   -- Si el piloto se encuentra en el aeropuerto deseado y no tiene vuelos por realizar, está disponible
   -- Caso contrario, dado que existe secuenciación estricta de desplazamiento, se busca la última programación (de vuelo no cancelado) con eta <= tiempo_deseado
   -- Verificamos que no existan vuelos por realizar después del tiempo_deseado, pues esto involucraría alteraciones en la disponibilidad de vuelos secuentes.
   -- Bajo lo anterior logramos que la inserción siempre sea lineal, osea después del último vuelo realizado o por realizar.
   -- Si pasa el anterior if. entonces el destino de la última programación es en efecto su último destino trazado hasta el momento de su desplazamiento.
   -- Si dicho ultimo destuno es igual al aeropuerto deseado entonces el piloto está disponible por ubicación en ese tiempo.
   -- Los criterios de verificar que no existan más vuelos por realizar desde la última posición esperada del vaion, nos ayuda a que las inserciones de los 
   -- vuelos sigan una secuenciación estricta para la inserción y actualización.
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
    -- 1) Ubicación actual: si el empleado (piloto) tiene id_aeropuerto igual al origen
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
            RETURN 1; -- disponible
        ELSE
            RETURN 0; -- tiene programaciones futuras, no disponible
        END IF;
    END IF;

    -- 2) No está (o no hay info): buscar el último vuelo (no cancelado) con eta <= tiempo_deseado
    SELECT pv.id_programacion INTO ultimo_prog_id
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_piloto = id_piloto_input
      AND v.estado <> 'CANCELADO'
      AND pv.eta <= tiempo_deseado
    ORDER BY pv.eta DESC
    LIMIT 1;

    IF ultimo_prog_id IS NULL THEN
        -- No hay vuelos antes de tiempo_deseado y no está físicamente en el aeropuerto: no disponible
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

    -- Nuevo chequeo extra: asegurarnos que NO existan vuelos con estado PROGRAMADO después de tiempo_deseado
    SELECT COUNT(*) INTO vuelos_futuros
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_piloto = id_piloto_input
      AND v.estado = 'PROGRAMADO'
      AND pv.etd > tiempo_deseado;  -- programaciones que ocurren después del tiempo que queremos

    IF vuelos_futuros = 0 THEN
        RETURN 1; -- disponible (último destino coincide y no hay vuelos programados después)
    ELSE
        RETURN 0; -- existen vuelos programados después, no permitimos insertar (rompería la secuencia)
    END IF;
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
    SELECT id_aeropuerto INTO ubicacion_actual
    FROM avion
    WHERE id_avion = id_avion_input;

    IF ubicacion_actual IS NOT NULL AND ubicacion_actual = aeropuerto_deseado THEN
        SELECT COUNT(*) INTO vuelos_futuros
        FROM programacion_vuelo pv
        JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
        WHERE pv.id_avion = id_avion_input
          AND v.estado = 'PROGRAMADO'
          AND pv.etd > now();

        IF vuelos_futuros = 0 THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END IF;

    SELECT pv.id_programacion INTO ultimo_prog_id
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_avion = id_avion_input
      AND v.estado <> 'CANCELADO'
      AND pv.eta <= tiempo_deseado
    ORDER BY pv.eta DESC
    LIMIT 1;

    IF ultimo_prog_id IS NULL THEN
        RETURN 0;
    END IF;

    SELECT v.destino INTO ultimo_vuelo_destino
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_programacion = ultimo_prog_id;

    IF ultimo_vuelo_destino IS NULL OR ultimo_vuelo_destino <> aeropuerto_deseado THEN
        RETURN 0;
    END IF;

    SELECT COUNT(*) INTO vuelos_futuros
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_avion = id_avion_input
      AND v.estado = 'PROGRAMADO'
      AND pv.etd > tiempo_deseado;

    IF vuelos_futuros = 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
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
CREATE OR REPLACE FUNCTION registrar_vuelo_completo(
    p_id_vuelo INT,
    p_origen INT,
    p_destino INT,
    p_tipo_vuelo VARCHAR,
    p_codigo_vuelo VARCHAR,
    -- programacion
    p_id_programacion INT,
    p_id_avion INT,
    p_id_piloto INT,
    p_id_puerta INT,
    p_etd TIMESTAMP,
    p_eta TIMESTAMP
)
RETURNS TABLE (id_vuelo_insertado INT, id_programacion_insertado INT) AS $$
BEGIN
    -- Insert del vuelo
    INSERT INTO vuelo (id_vuelo, origen, destino, estado, tipo_vuelo, codigo_vuelo, tiempo_salida, tiempo_llegada)
    VALUES (p_id_vuelo, p_origen, p_destino, 'PROGRAMADO', p_tipo_vuelo, p_codigo_vuelo, NULL, NULL);
    RETURNING p_id_vuelo INTO id_vuelo_insertado;

    -- Insert de la programación: el trigger trg_validar_programacion_vuelo se ejecutará y validará.
    INSERT INTO programacion_vuelo (id_programacion, id_vuelo, id_avion, id_piloto, id_puerta, etd, eta)
    VALUES (p_id_programacion, new_vuelo_id, p_id_avion, p_id_piloto, p_id_puerta, p_etd, p_eta);

    RETURNING p_id_programacion INTO id_programacion_insertado;

    RETURN NEXT;
EXCEPTION
    WHEN others THEN
        RAISE;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION registrar_vuelo_completo(INT, INT, INT, VARCHAR, VARCHAR, INT, INT, INT, INT, TIMESTAMP, TIMESTAMP)
IS 'Inserta vuelo y su programacion en una sola operación transaccional. Las validaciones completas se ejecutan en el trigger de programacion_vuelo; si el trigger falla, la transacción revierte.';




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
-- Trigger para actualizar tiempos de registro del vuelo y cambio en la ubicación de avión y piloto

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

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- FUNCION TRIGGER
-- Se ejecuta al actualizar vuelo, en específico al realizar cambios en el estado
CREATE TRIGGER tg_update_tiempos_y_ubicacion_vuelo
BEFORE UPDATE ON vuelo
FOR EACH ROW
EXECUTE FUNCTION trg_update_tiempos_y_ubicacion_vuelo();



----------------------------------------------- EJEMPLOS ----------------------------------------------------------------------------------------

-- TRIGGER 1: VUELO



-- VUELO 

-- INSERT correcto
INSERT INTO vuelo (id_vuelo,origen,destino,estado,tipo_vuelo,codigo_vuelo,tiempo_salida,tiempo_llegada)
VALUES (10001,1,2,'PROGRAMADO','COMERCIAL','AT200',NULL,NULL);
-- Programación que pasa todas las validaciones
INSERT INTO programacion_vuelo (id_programacion,id_vuelo,id_avion,id_piloto,id_puerta,etd,eta)
VALUES (10001,10001,1,6,1, now() + interval '2 days', now() + interval '2 days' + interval '3 hours');
-- Debe INSERTARSE correctamente: hay pista operativa, avión OPERATIVO, licencia ATPL vigente,
-- terminal con capacidad, disponibilidad por ubicación ok.

-- Usando función reistrar_vuelo_completo (RECOMENDADO y no hacerlo de la anterior forma)
-- Debería se correcto, es un vuelo subsecuente del anterior
SELECT * 
FROM registrar_vuelo_completo(
    10002, 2, 1, 'COMERCIAL', 'AT201', 10002, 1, 6, 7, now() + interval '3 days', now() + interval '3 days' + interval '3 hours'
);














