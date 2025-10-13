-- 1 NO CANCELADOS
SELECT aeropuerto.ciudad, COUNT(vuelo.id_vuelo) AS cantidad_vuelos
FROM vuelo
JOIN aeropuerto ON vuelo.origen = aeropuerto.id_aeropuerto
WHERE vuelo.estado != 'CANCELADO'
GROUP BY aeropuerto.ciudad
ORDER BY cantidad_vuelos DESC
-- 1 TODOS (QUITAR Where)

  
-- 2
SELECT aerolinea.nombre,
       AVG(vuelo.eta - vuelo.etd) AS duracion_promedio
FROM vuelo
JOIN avion ON vuelo.id_avion = avion.id_avion
JOIN aerolinea ON avion.id_aerolinea = aerolinea.id_aerolinea
GROUP BY aerolinea.nombre
ORDER BY duracion_promedio DESC


-- 3  CAMBIAR LOS INSERT PARA TENER UN ÜNICO MAYOR Y MENOR
-- Vuelo más largo
SELECT vuelo.id_vuelo, (vuelo.eta - vuelo.etd) AS duracion
FROM vuelo
WHERE (vuelo.eta - vuelo.etd) = (
    SELECT MAX(vuelo.eta - vuelo.etd) FROM vuelo
);
-- Vuelo más corto
SELECT vuelo.id_vuelo, (vuelo.eta - vuelo.etd) AS duracion
FROM vuelo
WHERE (vuelo.eta - vuelo.etd) = (
    SELECT MIN(vuelo.eta - vuelo.etd) FROM vuelo
);


-- 4 Sin CANCELADOS
SELECT TO_CHAR(vuelo.etd, 'YYYY-MM') AS mes, COUNT(*) AS cantidad_vuelos
FROM vuelo
WHERE vuelo.estado != 'CANCELADO'
GROUP BY TO_CHAR(vuelo.etd, 'YYYY-MM')
ORDER BY mes;


-- 5
SELECT aerolinea.nombre, COUNT(vuelo.id_vuelo) AS total_vuelos
FROM vuelo
JOIN avion ON vuelo.id_avion = avion.id_avion
JOIN aerolinea ON avion.id_aerolinea = aerolinea.id_aerolinea
WHERE vuelo.estado != 'CANCELADO'
GROUP BY aerolinea.nombre
HAVING COUNT(vuelo.id_vuelo) > 10
ORDER BY total_vuelos;


--6
SELECT aeropuerto.ciudad AS destino,
       SUM(vuelo.eta - vuelo.etd) AS duracion_total
FROM vuelo
JOIN aeropuerto ON vuelo.destino = aeropuerto.id_aeropuerto
WHERE vuelo.estado != 'CANCELADO'
GROUP BY aeropuerto.ciudad
HAVING SUM(vuelo.eta - vuelo.etd) = (
    SELECT MAX(subconsulta.duracion)
    FROM (
        SELECT SUM(vuelo.eta - vuelo.etd) AS duracion
        FROM vuelo
        WHERE vuelo.estado != 'CANCELADO'
        GROUP BY vuelo.destino
    ) AS subconsulta
);



-- 7
SELECT aerolinea.nombre AS aerolinea,
       empleados.puesto,
       empleados.cantidad
FROM (
    SELECT 'piloto' AS puesto, piloto.id_aerolinea, COUNT(*) AS cantidad
    FROM piloto
    GROUP BY piloto.id_aerolinea

    UNION ALL

    SELECT 'sobrecargo', sobrecargo.id_aerolinea, COUNT(*) AS cantidad
    FROM sobrecargo
    GROUP BY sobrecargo.id_aerolinea

    UNION ALL

    SELECT 'controlador', controlador.id_aerolinea, COUNT(*) AS cantidad
    FROM controlador
    GROUP BY controlador.id_aerolinea

    UNION ALL

    SELECT 'tecnico', tecnico.id_aerolinea, COUNT(*) AS cantidad
    FROM tecnico
    GROUP BY tecnico.id_aerolinea

    UNION ALL

    SELECT 'atencionalpasajero', atencionalpasajero.id_aerolinea, COUNT(*) AS cantidad
    FROM atencionalpasajero
    GROUP BY atencionalpasajero.id_aerolinea

    UNION ALL

    SELECT 'ingeniero', ingeniero.id_aerolinea, COUNT(*) AS cantidad
    FROM ingeniero
    GROUP BY ingeniero.id_aerolinea
) AS empleados
JOIN aerolinea ON empleados.id_aerolinea = aerolinea.id_aerolinea
ORDER BY aerolinea.nombre, empleados.puesto;


-- 8
SELECT aeropuerto.nombre AS aeropuerto,
       empleados.puesto,
       empleados.cantidad
FROM (
    SELECT 'controlador' AS puesto, controlador.id_aeropuerto, COUNT(*) AS cantidad
    FROM controlador
    GROUP BY controlador.id_aeropuerto

    UNION ALL

    SELECT 'tecnico', tecnico.id_aeropuerto, COUNT(*) AS cantidad
    FROM tecnico
    GROUP BY tecnico.id_aeropuerto

    UNION ALL

    SELECT 'atencionalpasajero', atencionalpasajero.id_aeropuerto, COUNT(*) AS cantidad
    FROM atencionalpasajero
    GROUP BY atencionalpasajero.id_aeropuerto

    UNION ALL

    SELECT 'ingeniero', ingeniero.id_aeropuerto, COUNT(*) AS cantidad
    FROM ingeniero
    GROUP BY ingeniero.id_aeropuerto
) AS empleados
JOIN aeropuerto ON empleados.id_aeropuerto = aeropuerto.id_aeropuerto
ORDER BY aeropuerto.nombre, empleados.puesto;


-- 9
SELECT vuelo.id_vuelo, AVG(tarifa_vuelo.precio) AS costo_promedio
FROM boleto
JOIN tarifa_vuelo ON boleto.id_tarifa = tarifa_vuelo.id_tarifa
JOIN vuelo ON boleto.id_vuelo = vuelo.id_vuelo
WHERE vuelo.estado != 'CANCELADO'
GROUP BY vuelo.id_vuelo
--ORDER BY vuelo.id_vuelo;
ORDER BY costo_promedio DESC;


-- 10
SELECT vuelo.id_vuelo, SUM(tarifa_vuelo.precio) AS costo_total
FROM boleto
JOIN tarifa_vuelo ON boleto.id_tarifa = tarifa_vuelo.id_tarifa
JOIN vuelo ON boleto.id_vuelo = vuelo.id_vuelo
WHERE vuelo.estado != 'CANCELADO'
GROUP BY vuelo.id_vuelo
ORDER BY costo_total DESC;


