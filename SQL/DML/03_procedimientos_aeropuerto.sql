-- PROCEDIMIENTOS


-- Procedimiento 1: Cambia automáticamente el estado de los vuelos según la hora actual:
-- - Si ya despegó y no llegó → 'EN_VUELO'
-- - Si ya llegó → 'FINALIZADO'
-- Usa condicionales y operaciones en bloque.
-- Tablas involucradas: vuelo
CREATE PROCEDURE actualizar_estado_por_hora()
LANGUAGE plpgsql
AS $$
DECLARE
    vuelos_en_transito INT;
    vuelos_finalizados INT;
BEGIN
    -- EN_VUELO: existen programaciones activas ahora
    UPDATE vuelo
    SET estado = 'EN_VUELO'
    WHERE estado = 'PROGRAMADO'
      AND EXISTS (
          SELECT 1 FROM programacion_vuelo pv
          WHERE pv.id_vuelo = vuelo.id_vuelo
            AND CURRENT_TIMESTAMP BETWEEN pv.etd AND pv.eta
      );
    GET DIAGNOSTICS vuelos_en_transito = ROW_COUNT;

    -- FINALIZADO: la última programacion ya terminó (max eta < now)
    UPDATE vuelo
    SET estado = 'FINALIZADO'
    WHERE EXISTS (
        SELECT 1
        FROM (
            SELECT pv.id_vuelo, MAX(pv.eta) AS max_eta
            FROM programacion_vuelo pv
            GROUP BY pv.id_vuelo
        ) as sub
        WHERE sub.id_vuelo = vuelo.id_vuelo
          AND sub.max_eta < CURRENT_TIMESTAMP
    )
    AND vuelo.estado <> 'FINALIZADO';
    GET DIAGNOSTICS vuelos_finalizados = ROW_COUNT;

    RAISE NOTICE '% vuelos marcados EN_VUELO, % vuelos marcados FINALIZADO.', vuelos_en_transito, vuelos_finalizados;
END;
$$;




-- Procedimiento 2: Aumenta o disminuye el precio de todas las tarifas de una clase
-- específica (por ejemplo, 'EJECUTIVA' o 'TURISTA') dentro de un vuelo
-- determinado.
--
-- Parámetros:
--   p_id_vuelo   → ID del vuelo cuyas tarifas serán modificadas
--   p_clase      → Clase de tarifa ('EJECUTIVA', 'TURISTA', etc.)
--   p_incremento → Monto a sumar al precio (puede ser negativo)
--
-- Tablas involucradas: tarifa_vuelo, vuelo
CREATE PROCEDURE ajustar_importe_clase_vuelo(
    p_id_vuelo INT,
    p_clase VARCHAR,
    p_incremento NUMERIC(10,2)
)
LANGUAGE plpgsql
AS $$
DECLARE
    tarifas_ajustadas INT := 0;
    vuelo_existe BOOLEAN := FALSE;
BEGIN
    SELECT EXISTS(SELECT 1 FROM vuelo WHERE id_vuelo = p_id_vuelo) INTO vuelo_existe;
    IF NOT vuelo_existe THEN
        RAISE NOTICE 'El vuelo con ID % no existe.', p_id_vuelo;
        RETURN;
    END IF;

    UPDATE tarifa_vuelo tv
    SET precio = tv.precio + p_incremento
    FROM programacion_vuelo pv
    WHERE tv.id_programacion_vuelo = pv.id_programacion
      AND pv.id_vuelo = p_id_vuelo
      AND UPPER(tv.clase) = UPPER(p_clase);

    GET DIAGNOSTICS tarifas_ajustadas = ROW_COUNT;

    IF tarifas_ajustadas = 0 THEN
        RAISE NOTICE 'No se encontraron tarifas de clase % en el vuelo %.', p_clase, p_id_vuelo;
    ELSE
        RAISE NOTICE 'Se ajustaron % tarifas de clase % en el vuelo %, con un incremento de %.2f.',
                     tarifas_ajustadas, p_clase, p_id_vuelo, p_incremento;
    END IF;
END;
$$;




-- Procedimiento 3: Actualiza la ubicación de los aviones con base en el estado temporal
-- de los vuelos. Si un vuelo ya inició, el avión se marca como no disponible
-- (id_aeropuerto = NULL). Si el vuelo ya finalizó, se actualiza con el
-- aeropuerto de destino. Si no hay vuelos asociados o aún no comienzan,
-- el valor actual no se modifica.
-- Tablas involucradas: programacion_vuelo, vuelo, avion
CREATE PROCEDURE actualizar_ubicacion_aviones()
LANGUAGE plpgsql
AS $$
DECLARE
    tmp INT;
BEGIN
    -- 1) Aviones actualmente en vuelo -> quitar ubicación
    UPDATE avion
    SET id_aeropuerto = NULL
    WHERE EXISTS (
        SELECT 1 FROM programacion_vuelo pv
        WHERE pv.id_avion = avion.id_avion
          AND CURRENT_TIMESTAMP BETWEEN pv.etd AND pv.eta
    );
    GET DIAGNOSTICS tmp = ROW_COUNT;

    -- 2) Para cada avión, si su última programacion (por eta) ya concluyó, asignar aeropuerto destino de ese vuelo
    UPDATE avion
    SET id_aeropuerto = v.destino
    FROM (
        SELECT pv.id_avion, pv.id_vuelo, pv.eta
        FROM programacion_vuelo pv
        JOIN (
            -- última programacion por avion
            SELECT id_avion, MAX(eta) AS max_eta
            FROM programacion_vuelo
            GROUP BY id_avion
        ) lastpv ON pv.id_avion = lastpv.id_avion AND pv.eta = lastpv.max_eta
    ) AS lastprog
    JOIN vuelo v ON lastprog.id_vuelo = v.id_vuelo
    WHERE avion.id_avion = lastprog.id_avion
      AND lastprog.eta <= CURRENT_TIMESTAMP;
    GET DIAGNOSTICS tmp = ROW_COUNT;
END;
$$;


-- Procedimiento 4: Actualiza el aeropuerto actual de los pilotos en función de los vuelos
-- registrados. Si el vuelo ya inició, el piloto se marca como no disponible
-- (id_aeropuerto = NULL). Si el vuelo ya finalizó, se actualiza su ubicación
-- con el aeropuerto de destino. Si el piloto no tiene vuelos recientes,
-- su ubicación permanece sin cambios.
-- Tablas involucradas: programacion_vuelo, empleado(piloto), vuelo
CREATE PROCEDURE actualizar_ubicacion_pilotos()
LANGUAGE plpgsql
AS $$
DECLARE
    tmp INT;
BEGIN
    -- Pilotos actualmente en vuelo -> quitar ubicación (empleado.id_aeropuerto)
    UPDATE empleado
    SET id_aeropuerto = NULL
    WHERE id_empleado IN (
        SELECT pv.id_piloto
        FROM programacion_vuelo pv
        WHERE CURRENT_TIMESTAMP BETWEEN pv.etd AND pv.eta
    );
    GET DIAGNOSTICS tmp = ROW_COUNT;

    -- Pilotos con última programacion finalizada -> asignar aeropuerto destino de esa programacion
    UPDATE empleado e
    SET id_aeropuerto = v.destino
    FROM (
        SELECT pv.id_piloto, pv.id_vuelo, pv.eta
        FROM programacion_vuelo pv
        JOIN (
            SELECT id_piloto, MAX(eta) AS max_eta
            FROM programacion_vuelo
            GROUP BY id_piloto
        ) lastpv ON pv.id_piloto = lastpv.id_piloto AND pv.eta = lastpv.max_eta
    ) AS lastprog
    JOIN vuelo v ON lastprog.id_vuelo = v.id_vuelo
    WHERE e.id_empleado = lastprog.id_piloto
      AND lastprog.eta <= CURRENT_TIMESTAMP;
    GET DIAGNOSTICS tmp = ROW_COUNT;
END;
$$;

-- Procedimiento 5: Crea una nueva reserva generando automáticamente un boleto para un vuelo y asiento específicos.
-- Valida que la tarifa corresponda al vuelo, que haya asientos disponibles y que el asiento solicitado no esté ocupado.
-- Si todo es correcto, inserta el boleto y devuelve su ID generado.
-- Tablas involucradas: programacion_vuelo, avion, boleto, tarifa_vuelo.
CREATE PROCEDURE crear_reserva_con_boleto(
    p_id_vuelo INT,
    p_id_tarifa INT,
    p_numero_asiento INT,
    OUT p_id_boleto_generado INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    pv_id INT;
    capacidad INT;
    vendidos INT;
BEGIN
    p_id_boleto_generado := NULL;

    -- 1) Obtener la programacion asociada a la tarifa y que pertenezca al vuelo
    SELECT tv.id_programacion_vuelo INTO pv_id
    FROM tarifa_vuelo tv
    JOIN programacion_vuelo pv ON tv.id_programacion_vuelo = pv.id_programacion
    WHERE tv.id_tarifa = p_id_tarifa
      AND pv.id_vuelo = p_id_vuelo
    LIMIT 1;

    IF pv_id IS NULL THEN
        RAISE EXCEPTION 'La tarifa % no pertenece a ninguna programacion del vuelo %', p_id_tarifa, p_id_vuelo;
    END IF;

    -- 2) Bloquear la programacion/avion para evitar race conditions
    SELECT a.capacidad_pasajeros INTO capacidad
    FROM programacion_vuelo pv
    JOIN avion a ON pv.id_avion = a.id_avion
    WHERE pv.id_programacion = pv_id
    FOR UPDATE; -- bloquea la fila del avión

    IF capacidad IS NULL THEN
        RAISE EXCEPTION 'Programacion % o avion asociado no existe', pv_id;
    END IF;

    -- 3) Contar boletos ya vendidos para esa programacion
    SELECT COUNT(*) INTO vendidos
    FROM boleto b
    WHERE b.id_programacion_vuelo = pv_id;

    IF vendidos >= capacidad THEN
        RAISE EXCEPTION 'No hay asientos disponibles en la programacion % (vuelo %)', pv_id, p_id_vuelo;
    END IF;

    -- 4) Insertar boleto (manejo de unique_violation por asiento duplicado)
    BEGIN
        INSERT INTO boleto (id_programacion_vuelo, fecha_compra, numero_asiento)
        VALUES (pv_id, CURRENT_DATE, p_numero_asiento)
        RETURNING id_boleto INTO p_id_boleto_generado;
    EXCEPTION WHEN unique_violation THEN
        RAISE EXCEPTION 'Asiento % ya ocupado en la programacion % (vuelo %).', p_numero_asiento, pv_id, p_id_vuelo;
    END;

END;
$$;




-- Procedimiento 6: Elimina (reembolsa) todos los boletos asociados a un vuelo específico.
-- Devuelve el número total de boletos eliminados mediante un parámetro de salida.
-- Si no hay boletos para ese vuelo, devuelve 0.
-- Si existen boletos, los elimina y devuelve la cantidad reembolsada.
-- Tablas involucradas: boleto
CREATE OR REPLACE PROCEDURE reembolsar_boletos_por_vuelo(p_id_vuelo INT, OUT reembolsados INT)
LANGUAGE plpgsql
AS $$
DECLARE
    cnt INT := 0;
BEGIN
    SELECT COUNT(*) INTO cnt
    FROM boleto b
    WHERE b.id_programacion_vuelo IN (
        SELECT pv.id_programacion FROM programacion_vuelo pv WHERE pv.id_vuelo = p_id_vuelo
    );

    IF cnt = 0 THEN
        reembolsados := 0;
        RETURN;
    END IF;

    DELETE FROM boleto
    WHERE id_programacion_vuelo IN (
        SELECT pv.id_programacion FROM programacion_vuelo pv WHERE pv.id_vuelo = p_id_vuelo
    );

    reembolsados := cnt;
END;
$$;

---------------Pruebas de Procedimientos----------------------------------------

/*

-- 1 actualizar_estado_por_hora()
CALL actualizar_estado_por_hora();
SELECT id_vuelo, estado
FROM vuelo
WHERE estado LIKE 'PROGRAMADO';


-- 2 ajustar_importe_clase_vuelo(p_id_vuelo, p_clase, p_incremento)
-- Ejemplo: aumenta el precio de la clase EJECUTIVA del vuelo con id 10.
CALL ajustar_importe_clase_vuelo(10, 'EJECUTIVA', 250.00);
-- Verifica tarifas afectadas (usa las programaciones del vuelo 10)
SELECT tv.id_tarifa, tv.clase, tv.precio, pv.id_programacion
FROM tarifa_vuelo tv
JOIN programacion_vuelo pv ON tv.id_programacion_vuelo = pv.id_programacion
WHERE pv.id_vuelo = 10 AND tv.clase ILIKE 'EJECUTIVA';


-- 3 actualizar_ubicacion_aviones()
CALL actualizar_ubicacion_aviones();
SELECT id_avion, modelo, id_aeropuerto
FROM avion
ORDER BY id_avion;


-- 4 actualizar_ubicacion_pilotos()
CALL actualizar_ubicacion_pilotos();
-- Pilotos están en empleado, listamos empleados que también son pilotos:
SELECT e.id_empleado AS id_piloto, e.nombre, e.id_aeropuerto
FROM empleado e
WHERE e.id_empleado IN (SELECT id_empleado FROM piloto)
ORDER BY e.id_empleado;


-- 5 crear_reserva_con_boleto(p_id_vuelo, p_id_tarifa, p_numero_asiento, OUT p_id_boleto_generado)
-- IMPORTANTE: ahora la tarifa debe referenciarse por id_tarifa que exista y pertenezca
-- a una programacion del vuelo. Ejemplo:
CALL crear_reserva_con_boleto(10, 25, 5, NULL);
-- Luego:
SELECT id_boleto, id_programacion_vuelo, fecha_compra, numero_asiento
FROM boleto
WHERE numero_asiento = 5
ORDER BY fecha_compra DESC
LIMIT 5;


-- 6 reembolsar_boletos_por_vuelo(p_id_vuelo INT, OUT reembolsados INT)
CALL reembolsar_boletos_por_vuelo(11, NULL);
-- comprobar:
SELECT COUNT(*) AS boletos_restantes_v11
FROM boleto
WHERE id_programacion_vuelo IN (SELECT id_programacion FROM programacion_vuelo WHERE id_vuelo = 11);
*/
