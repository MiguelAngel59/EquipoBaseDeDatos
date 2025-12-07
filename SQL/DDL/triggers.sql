-- =====================================================================
-- BLOQUE: Validaciones y procedimiento transaccional (versión actualizada)
-- - Ignora vuelos cuyo estado = 'CANCELADO' en todas las verificaciones
-- - No usa ignored_programacion
-- - La función registro_vuelo_completo inserta vuelo -> programacion_vuelo
--   y deja al trigger validar las reglas complejas.
-- =====================================================================

/* ---------------------------
   UTIL: solapamiento de intervalos
   --------------------------- */
CREATE OR REPLACE FUNCTION util_intervals_overlap(a_start TIMESTAMP, a_end TIMESTAMP, b_start TIMESTAMP, b_end TIMESTAMP)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN NOT (a_end <= b_start OR b_end <= a_start);
END;
$$ LANGUAGE plpgsql IMMUTABLE;

COMMENT ON FUNCTION util_intervals_overlap(TIMESTAMP, TIMESTAMP, TIMESTAMP, TIMESTAMP)
IS 'Devuelve true si los intervalos (a_start,a_end) y (b_start,b_end) se solapan.';

/* =================================================
   1) disponibilidad temporal de PILOTO (sin CANCELADOS)
   retorna 1 = disponible, 0 = no disponible
   ================================================= */
CREATE OR REPLACE FUNCTION chk_piloto_temporal_disponible(id_piloto_input INT, new_etd TIMESTAMP, new_eta TIMESTAMP)
RETURNS INTEGER AS $$
DECLARE
    cnt INT;
BEGIN
    SELECT COUNT(*) INTO cnt
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_piloto = id_piloto_input
      AND v.estado <> 'CANCELADO'
      AND util_intervals_overlap(pv.etd, pv.eta, new_etd, new_eta);

    IF cnt = 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION chk_piloto_temporal_disponible(INT, TIMESTAMP, TIMESTAMP)
IS '1 si el piloto no tiene programaciones (no-CANCELADAS) que se solapen con el intervalo dado; 0 si hay conflicto.';

/* =================================================
   2) disponibilidad temporal de AVIÓN (sin CANCELADOS)
   retorna 1 = disponible, 0 = no disponible
   ================================================= */
CREATE OR REPLACE FUNCTION chk_avion_temporal_disponible(id_avion_input INT, new_etd TIMESTAMP, new_eta TIMESTAMP)
RETURNS INTEGER AS $$
DECLARE
    cnt INT;
BEGIN
    SELECT COUNT(*) INTO cnt
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_avion = id_avion_input
      AND v.estado <> 'CANCELADO'
      AND util_intervals_overlap(pv.etd, pv.eta, new_etd, new_eta);

    IF cnt = 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION chk_avion_temporal_disponible(INT, TIMESTAMP, TIMESTAMP)
IS '1 si el avión no tiene programaciones (no-CANCELADAS) que se solapen; 0 si hay conflicto.';

/* =================================================
   3) licencia válida para PILOTO (vigencia en fecha del ETD)
   reglas:
     - PRIVADO -> PPL
     - COMERCIAL/CARGA -> CPL o ATPL
   retorna 1 = OK, 0 = no OK
   ================================================= */
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
IS 'Valida que el piloto tenga al menos una licencia vigente en la fecha de referencia (ref_date) compatible con el tipo de vuelo.';

/* =================================================
   4) estado operativo del avión
   retorna 1 = OPERATIVO, 0 = no operativo o inexistente
   ================================================= */
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

/* =================================================
   5) disponibilidad por UBICACIÓN del PILOTO (sin CANCELADOS)
   - Se busca la última programación (no cancelada) con eta <= new_etd.
   - Si existe, el piloto estará en el destino de ese vuelo.
   - Si no existe, se usa empleado.id_aeropuerto (ubicación actual).
   retorna 1 = estará en aeropuerto_origen, 0 = no
   ================================================= */
CREATE OR REPLACE FUNCTION chk_piloto_disponible_en_ubicacion(id_piloto_input INT, aeropuerto_origen INT, new_etd TIMESTAMP)
RETURNS INTEGER AS $$
DECLARE
    last_prog_id INT;
    last_vuelo_destino INT;
    emp_aero INT;
BEGIN
    SELECT pv.id_programacion INTO last_prog_id
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_piloto = id_piloto_input
      AND v.estado <> 'CANCELADO'
      AND pv.eta <= new_etd
    ORDER BY pv.eta DESC
    LIMIT 1;

    IF last_prog_id IS NOT NULL THEN
        SELECT v.destino INTO last_vuelo_destino
        FROM programacion_vuelo pv JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
        WHERE pv.id_programacion = last_prog_id;
        IF last_vuelo_destino = aeropuerto_origen THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    ELSE
        SELECT id_aeropuerto INTO emp_aero FROM empleado WHERE id_empleado = id_piloto_input;
        IF emp_aero IS NULL THEN
            RETURN 0;
        END IF;
        IF emp_aero = aeropuerto_origen THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END IF;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION chk_piloto_disponible_en_ubicacion(INT, INT, TIMESTAMP)
IS 'Determina si el piloto estará en el aeropuerto de origen antes o en new_etd. Considera solo programaciones con vuelo.estado <> CANCELADO.';

/* =================================================
   6) disponibilidad por UBICACIÓN del AVIÓN (sin CANCELADOS)
   - Igual lógica que para piloto, usando avion.id_aeropuerto
   retorna 1 = OK, 0 = no
   ================================================= */
CREATE OR REPLACE FUNCTION chk_avion_disponible_en_ubicacion(id_avion_input INT, aeropuerto_origen INT, new_etd TIMESTAMP)
RETURNS INTEGER AS $$
DECLARE
    last_prog_id INT;
    last_vuelo_destino INT;
    av_aero INT;
BEGIN
    SELECT pv.id_programacion INTO last_prog_id
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE pv.id_avion = id_avion_input
      AND v.estado <> 'CANCELADO'
      AND pv.eta <= new_etd
    ORDER BY pv.eta DESC
    LIMIT 1;

    IF last_prog_id IS NOT NULL THEN
        SELECT v.destino INTO last_vuelo_destino
        FROM programacion_vuelo pv JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
        WHERE pv.id_programacion = last_prog_id;
        IF last_vuelo_destino = aeropuerto_origen THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    ELSE
        SELECT id_aeropuerto INTO av_aero FROM avion WHERE id_avion = id_avion_input;
        IF av_aero IS NULL THEN
            RETURN 0;
        END IF;
        IF av_aero = aeropuerto_origen THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END IF;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION chk_avion_disponible_en_ubicacion(INT, INT, TIMESTAMP)
IS 'Determina si el avión estará en el aeropuerto de origen antes o en new_etd. Considera solo programaciones con vuelo.estado <> CANCELADO.';

/* =================================================
   7) capacidad de la terminal (contando programaciones no-CANCELADAS)
   - Se obtiene id_terminal via puerta -> terminal
   - Cuenta programaciones solapadas (v.estado <> 'CANCELADO')
   - Retorna 1 = hay capacidad, 0 = no hay
   ================================================= */
CREATE OR REPLACE FUNCTION chk_terminal_capacidad_por_puerta(id_puerta_input INT, new_etd TIMESTAMP, new_eta TIMESTAMP)
RETURNS INTEGER AS $$
DECLARE
    id_terminal_local INT;
    capacidad INT;
    concurrentes INT;
BEGIN
    SELECT id_terminal INTO id_terminal_local FROM puerta WHERE id_puerta = id_puerta_input;
    IF id_terminal_local IS NULL THEN
        RETURN 0;
    END IF;

    SELECT capacidad_aviones INTO capacidad FROM terminal WHERE id_terminal = id_terminal_local;
    IF capacidad IS NULL THEN
        RETURN 0;
    END IF;

    SELECT COUNT(*) INTO concurrentes
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    JOIN puerta p ON pv.id_puerta = p.id_puerta
    WHERE p.id_terminal = id_terminal_local
      AND v.estado <> 'CANCELADO'
      AND util_intervals_overlap(pv.etd, pv.eta, new_etd, new_eta);

    IF concurrentes < capacidad THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION chk_terminal_capacidad_por_puerta(INT, TIMESTAMP, TIMESTAMP)
IS 'Verifica que la terminal tenga espacio para otra programación entre new_etd y new_eta (ignora vuelos CANCELADOS).';

/* =================================================
   8) existencia de pista operativa en el AEROPUERTO
   - Retorna 1 = al menos una pista OPERATIVA, 0 = no
   ================================================= */
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

/* =================================================
   TRIGGER validator: antes de INSERT/UPDATE en programacion_vuelo
   - Obtiene info del vuelo (tipo_vuelo, origen)
   - Ejecuta todas las funciones modulares (sin ignored_programacion)
   - Todas las verificaciones consideran solo vuelos con estado <> CANCELADO
   - Si falla algo => RAISE EXCEPTION -> transacción revierte
   ================================================= */
CREATE OR REPLACE FUNCTION trg_validate_programacion_vuelo()
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

    -- 1) comprobación temporal piloto
    IF chk_piloto_temporal_disponible(NEW.id_piloto, NEW.etd, NEW.eta) = 0 THEN
        RAISE EXCEPTION 'Validación: piloto % tiene programación que se solapa con (etd=% , eta=%).', NEW.id_piloto, NEW.etd, NEW.eta;
    END IF;

    -- 2) comprobación temporal avión
    IF chk_avion_temporal_disponible(NEW.id_avion, NEW.etd, NEW.eta) = 0 THEN
        RAISE EXCEPTION 'Validación: avión % tiene programación que se solapa con (etd=% , eta=%).', NEW.id_avion, NEW.etd, NEW.eta;
    END IF;

    -- 3) disponibilidad ubicación piloto
    IF chk_piloto_disponible_en_ubicacion(NEW.id_piloto, vuelo_origen, NEW.etd) = 0 THEN
        RAISE EXCEPTION 'Validación: el piloto % no estará en aeropuerto origen % en la fecha/hora de salida %.', NEW.id_piloto, vuelo_origen, NEW.etd;
    END IF;

    -- 4) disponibilidad ubicación avión
    IF chk_avion_disponible_en_ubicacion(NEW.id_avion, vuelo_origen, NEW.etd) = 0 THEN
        RAISE EXCEPTION 'Validación: el avión % no estará en aeropuerto origen % en la fecha/hora de salida %.', NEW.id_avion, vuelo_origen, NEW.etd;
    END IF;

    -- 5) licencia vigente y tipo (usamos NEW.etd como referencia)
    IF chk_piloto_licencia_valida(NEW.id_piloto, vuelo_tipo, NEW.etd) = 0 THEN
        RAISE EXCEPTION 'Validación: el piloto % no tiene licencia vigente y compatible con el tipo de vuelo (% ) para la fecha %.', NEW.id_piloto, vuelo_tipo, NEW.etd::date;
    END IF;

    -- 6) estado de avión operativo
    IF chk_avion_estado_operativo(NEW.id_avion) = 0 THEN
        RAISE EXCEPTION 'Validación: el avión % no está en estado OPERATIVO.', NEW.id_avion;
    END IF;

    -- 7) capacidad terminal (si hay puerta asignada)
    IF NEW.id_puerta IS NOT NULL THEN
        IF chk_terminal_capacidad_por_puerta(NEW.id_puerta, NEW.etd, NEW.eta) = 0 THEN
            RAISE EXCEPTION 'Validación: la terminal de la puerta % no tiene capacidad disponible entre % y %.', NEW.id_puerta, NEW.etd, NEW.eta;
        END IF;
    END IF;

    -- 8) pista operativa en aeropuerto origen
    IF chk_aeropuerto_tiene_pista_operativa(vuelo_origen) = 0 THEN
        RAISE EXCEPTION 'Validación: el aeropuerto origen % no tiene pistas en estado OPERATIVA.', vuelo_origen;
    END IF;

    -- Si todo OK, permitir la operación
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_programacion_vuelo_before_ins_upd ON programacion_vuelo;
CREATE TRIGGER trg_programacion_vuelo_before_ins_upd
BEFORE INSERT OR UPDATE ON programacion_vuelo
FOR EACH ROW EXECUTE FUNCTION trg_validate_programacion_vuelo();

COMMENT ON FUNCTION trg_validate_programacion_vuelo()
IS 'Trigger que valida reglas de negocio antes de insertar/actualizar programacion_vuelo (disponibilidades, licencias, estado de avión, capacidad terminal, pistas).';

/* =================================================
   Procedimiento transaccional: Inserta vuelo -> programacion_vuelo
   - No repite las validaciones del trigger (el trigger las aplicará)
   - Parámetros: si p_id_vuelo o p_id_programacion son NULL, la función intentará
     generar ids mediante secuencias opcionales (si existen). Si no, debe
     recibir ids explícitos.
   - Devuelve los ids insertados.
   ================================================= */
CREATE OR REPLACE FUNCTION registro_vuelo_completo(
    p_id_vuelo INT,
    p_origen INT,
    p_destino INT,
    p_estado VARCHAR,
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
DECLARE
    new_vuelo_id INT := p_id_vuelo;
    new_prog_id INT := p_id_programacion;
BEGIN
    -- Validaciones mínimas y existencia de aeropuertos (no repetimos las reglas complejas)
    PERFORM 1 FROM aeropuerto WHERE id_aeropuerto = p_origen;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Registro abortado: origen id_aeropuerto=% no existe.', p_origen;
    END IF;
    PERFORM 1 FROM aeropuerto WHERE id_aeropuerto = p_destino;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Registro abortado: destino id_aeropuerto=% no existe.', p_destino;
    END IF;

    -- Soporte simple para generación automática de ids si pasaron NULL y existe secuencia
    IF new_vuelo_id IS NULL THEN
        -- usar una secuencia llamada seq_vuelo_id si existe
        BEGIN
            SELECT nextval('seq_vuelo_id') INTO new_vuelo_id;
        EXCEPTION WHEN undefined_table THEN
            RAISE EXCEPTION 'registro_vuelo_completo: p_id_vuelo es NULL y no existe secuencia seq_vuelo_id; pase un id_vuelo explícito.';
        END;
    END IF;

    IF new_prog_id IS NULL THEN
        BEGIN
            SELECT nextval('seq_programacion_id') INTO new_prog_id;
        EXCEPTION WHEN undefined_table THEN
            RAISE EXCEPTION 'registro_vuelo_completo: p_id_programacion es NULL y no existe secuencia seq_programacion_id; pase un id_programacion explícito.';
        END;
    END IF;

    -- Insert del vuelo
    INSERT INTO vuelo (id_vuelo, origen, destino, estado, tipo_vuelo, codigo_vuelo, tiempo_salida, tiempo_llegada)
    VALUES (new_vuelo_id, p_origen, p_destino, p_estado, p_tipo_vuelo, p_codigo_vuelo, NULL, NULL);

    id_vuelo_insertado := new_vuelo_id;

    -- Insert de la programación: el trigger trg_validate_programacion_vuelo se ejecutará y validará.
    INSERT INTO programacion_vuelo (id_programacion, id_vuelo, id_avion, id_piloto, id_puerta, etd, eta)
    VALUES (new_prog_id, new_vuelo_id, p_id_avion, p_id_piloto, p_id_puerta, p_etd, p_eta);

    id_programacion_insertado := new_prog_id;

    RETURN;
EXCEPTION
    WHEN others THEN
        -- re-lanzar para que el cliente vea el mensaje del trigger o del error
        RAISE;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION registro_vuelo_completo(INT, INT, INT, VARCHAR, VARCHAR, VARCHAR, INT, INT, INT, INT, TIMESTAMP, TIMESTAMP)
IS 'Inserta vuelo y su programacion en una sola operación transaccional. Las validaciones completas se ejecutan en el trigger de programacion_vuelo; si el trigger falla, la transacción revierte.';

/* ============================
   FIN DEL BLOQUE
   ============================ */
