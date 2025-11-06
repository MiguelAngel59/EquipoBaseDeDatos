-- PROCEDIMIENTOS


-- Procedimiento: Cambia automáticamente el estado de los vuelos según la hora actual:
-- - Si ya despegó y no llegó → 'EN_VUELO'
-- - Si ya llegó → 'FINALIZADO'
-- Usa condicionales y operaciones en bloque.
-- Tablas involucradas: vuelo
CREATE OR REPLACE PROCEDURE actualizar_estado_por_hora()
LANGUAGE plpgsql
AS $$
DECLARE
    vuelos_en_transito INT;
    vuelos_finalizados INT;
BEGIN
    -- Actualizar vuelos en vuelo
    UPDATE vuelo
    SET estado = 'EN_VUELO'
    WHERE estado = 'PROGRAMADO' AND CURRENT_TIMESTAMP BETWEEN etd AND eta;
    GET DIAGNOSTICS vuelos_en_transito = ROW_COUNT;

    -- Actualizar vuelos finalizados
    UPDATE vuelo
    SET estado = 'FINALIZADO'
    WHERE estado IN ('EN_VUELO', 'PROGRAMADO') AND CURRENT_TIMESTAMP > eta;
    GET DIAGNOSTICS vuelos_finalizados = ROW_COUNT;

    RAISE NOTICE '% vuelos marcados EN_VUELO, % finalizados.', vuelos_en_transito, vuelos_finalizados;
END;
$$;


-- Procedimiento: Aumenta o disminuye el precio de todas las tarifas de una clase
-- específica (por ejemplo, 'EJECUTIVA' o 'TURISTA') dentro de un vuelo
-- determinado.
--
-- Parámetros:
--   p_id_vuelo   → ID del vuelo cuyas tarifas serán modificadas
--   p_clase      → Clase de tarifa ('EJECUTIVA', 'TURISTA', etc.)
--   p_incremento → Monto a sumar al precio (puede ser negativo)
--
-- Tablas involucradas: tarifa_vuelo, vuelo
CREATE OR REPLACE PROCEDURE ajustar_importe_clase_vuelo(
    p_id_vuelo INT,
    p_clase VARCHAR,
    p_incremento NUMERIC(10,2)
)
LANGUAGE plpgsql
AS $$
DECLARE
    tarifas_ajustadas INT;
    vuelo_existe BOOLEAN;
BEGIN
    -- Verificar que el vuelo exista
    SELECT EXISTS (SELECT 1 FROM vuelo WHERE id_vuelo = p_id_vuelo)
    INTO vuelo_existe;

    IF NOT vuelo_existe THEN
        RAISE NOTICE 'El vuelo con ID % no existe.', p_id_vuelo;
        RETURN;
    END IF;

    -- Actualizar los precios de las tarifas correspondientes
    UPDATE tarifa_vuelo
    SET precio = precio + p_incremento
    WHERE id_vuelo = p_id_vuelo
      AND UPPER(clase) = UPPER(p_clase);

    GET DIAGNOSTICS tarifas_ajustadas = ROW_COUNT;

    -- Validar si hubo filas afectadas
    IF tarifas_ajustadas = 0 THEN
        RAISE NOTICE 'No se encontraron tarifas de clase % en el vuelo %.', p_clase, p_id_vuelo;
    ELSE
        RAISE NOTICE 'Se ajustaron % tarifas de clase % en el vuelo %, con un incremento de %.2f.',
                     tarifas_ajustadas, p_clase, p_id_vuelo, p_incremento;
    END IF;
END;
$$;




-- Procedimiento: Actualiza la ubicación de los aviones con base en el estado temporal
-- de los vuelos. Si un vuelo ya inició, el avión se marca como no disponible
-- (id_aeropuerto = NULL). Si el vuelo ya finalizó, se actualiza con el
-- aeropuerto de destino. Si no hay vuelos asociados o aún no comienzan,
-- el valor actual no se modifica.
-- Tablas involucradas: vuelo, avion
-- ==========================================================
CREATE OR REPLACE PROCEDURE actualizar_ubicacion_aviones()
LANGUAGE plpgsql
AS $$
DECLARE
    tmp INT;
BEGIN
    -- Aviones actualmente en vuelo → quitar ubicación
    UPDATE avion
    SET id_aeropuerto = NULL
    WHERE id_avion IN (
        SELECT v.id_avion
        FROM vuelo v
        WHERE CURRENT_TIMESTAMP BETWEEN v.etd AND v.eta
    );
    GET DIAGNOSTICS tmp = ROW_COUNT;

    -- Aviones con vuelo finalizado → asignar aeropuerto destino
    UPDATE avion
    SET id_aeropuerto = v.destino
    FROM vuelo v
    WHERE avion.id_avion = v.id_avion
      AND CURRENT_TIMESTAMP >= v.eta;
    GET DIAGNOSTICS tmp = ROW_COUNT;
END;
$$;



-- Procedimiento: Actualiza el aeropuerto actual de los pilotos en función de los vuelos
-- registrados. Si el vuelo ya inició, el piloto se marca como no disponible
-- (id_aeropuerto = NULL). Si el vuelo ya finalizó, se actualiza su ubicación
-- con el aeropuerto de destino. Si el piloto no tiene vuelos recientes,
-- su ubicación permanece sin cambios.
--
-- Parámetros: (ninguno)
--
-- Tablas involucradas: vuelo, piloto
-- ==========================================================
CREATE OR REPLACE PROCEDURE actualizar_ubicacion_pilotos()
LANGUAGE plpgsql
AS $$
DECLARE
    tmp INT;
BEGIN
    -- Pilotos actualmente en vuelo → quitar ubicación
    UPDATE piloto
    SET id_aeropuerto = NULL
    WHERE id_empleado IN (
        SELECT v.piloto
        FROM vuelo v
        WHERE CURRENT_TIMESTAMP BETWEEN v.etd AND v.eta
    );
    GET DIAGNOSTICS tmp = ROW_COUNT;

    -- Pilotos con vuelo finalizado → asignar aeropuerto destino
    UPDATE piloto
    SET id_aeropuerto = v.destino
    FROM vuelo v
    WHERE piloto.id_empleado = v.piloto
      AND CURRENT_TIMESTAMP >= v.eta;
    GET DIAGNOSTICS tmp = ROW_COUNT;
END;
$$;


