-- 1
-- Muestra cuántos vuelos no cancelados salen de cada ciudad de origen.
-- Se utilizan las tablas vuelo y aeropuerto, vinculando vuelo.origen con aeropuerto.id_aeropuerto.
-- Se aplica COUNT sobre vuelo.id_vuelo, agrupando por ciudad y excluyendo vuelos cancelados.
SELECT aeropuerto.ciudad, COUNT(vuelo.id_vuelo) AS cantidad_vuelos
FROM vuelo
JOIN aeropuerto ON vuelo.origen = aeropuerto.id_aeropuerto
WHERE vuelo.estado != 'CANCELADO'
GROUP BY aeropuerto.ciudad
ORDER BY cantidad_vuelos DESC;

  
-- 2
-- Muestra la duración promedio de los vuelos por aerolínea.
-- Se utilizan las tablas vuelo, avion y aerolinea, vinculando cada vuelo con la aerolínea propietaria del avión.
-- Se aplica AVG sobre la diferencia entre eta y etd para obtener la duración promedio por aerolínea.
SELECT aerolinea.nombre,
       AVG(vuelo.eta - vuelo.etd) AS duracion_promedio
FROM vuelo
JOIN avion ON vuelo.id_avion = avion.id_avion
JOIN aerolinea ON avion.id_aerolinea = aerolinea.id_aerolinea
GROUP BY aerolinea.nombre
ORDER BY duracion_promedio DESC;

  
-- 3
-- Muestra el id del vuelo más largo y el más corto por ciudad de origen.
-- Se utilizan las tablas vuelo y aeropuerto, vinculando vuelo.origen con aeropuerto.id_aeropuerto.
-- Se calcula la duración como la diferencia entre eta y etd.
-- Se usan subconsultas correlacionadas con ORDER BY y LIMIT 1 para obtener los vuelos extremos por ciudad.
SELECT a.ciudad AS ciudad_origen,
       (
         SELECT v1.id_vuelo
         FROM vuelo v1
         WHERE v1.origen = a.id_aeropuerto AND v1.estado != 'CANCELADO'
         ORDER BY (v1.eta - v1.etd) ASC
         LIMIT 1
       ) AS vuelo_mas_corto,
       (
         SELECT v2.id_vuelo
         FROM vuelo v2
         WHERE v2.origen = a.id_aeropuerto AND v2.estado != 'CANCELADO'
         ORDER BY (v2.eta - v2.etd) DESC
         LIMIT 1
       ) AS vuelo_mas_largo
FROM aeropuerto a
WHERE EXISTS (
    SELECT 1
    FROM vuelo v
    WHERE v.origen = a.id_aeropuerto AND v.estado != 'CANCELADO'
)
ORDER BY ciudad_origen;


-- 4
-- Muestra cuántos vuelos no cancelados hay por mes, agrupando por año y mes de salida.
-- Se utiliza la tabla vuelo y se extrae el mes con TO_CHAR sobre etd.
-- Se aplica COUNT para obtener la cantidad de vuelos por mes.
SELECT TO_CHAR(vuelo.etd, 'YYYY-MM') AS año_mes, COUNT(*) AS cantidad_vuelos
FROM vuelo
WHERE vuelo.estado != 'CANCELADO'
GROUP BY TO_CHAR(vuelo.etd, 'YYYY-MM')
ORDER BY año_mes;


-- 5
-- Lista las aerolíneas que tienen más de 10 vuelos registrados en el sistema.
-- Se utilizan las tablas vuelo, avion y aerolinea, vinculando cada vuelo con su aerolínea.
-- Se aplica COUNT sobre vuelo.id_vuelo y se filtran las aerolíneas con más de 10 vuelos usando HAVING.
SELECT aerolinea.nombre, COUNT(vuelo.id_vuelo) AS total_vuelos
FROM vuelo
JOIN avion ON vuelo.id_avion = avion.id_avion
JOIN aerolinea ON avion.id_aerolinea = aerolinea.id_aerolinea
--WHERE vuelo.estado != 'CANCELADO'   ----No especifica vuelas operados, es Registrados
GROUP BY aerolinea.nombre
HAVING COUNT(vuelo.id_vuelo) > 10
ORDER BY total_vuelos;


-- 6
-- Muestra la ciudad destino con la mayor suma total de duración de vuelos.
-- Se utilizan las tablas vuelo y aeropuerto, vinculando vuelo.destino con aeropuerto.id_aeropuerto.
-- Se aplica SUM sobre la duración (eta - etd) y se filtra el destino con duración total máxima.
SELECT aeropuerto.ciudad AS destino,
       SUM(vuelo.eta - vuelo.etd) AS duracion_total
FROM vuelo
JOIN aeropuerto ON vuelo.destino = aeropuerto.id_aeropuerto
GROUP BY aeropuerto.ciudad
HAVING SUM(vuelo.eta - vuelo.etd) = (
    SELECT MAX(subconsulta.duracion)
    FROM (
        SELECT SUM(vuelo.eta - vuelo.etd) AS duracion
        FROM vuelo
        GROUP BY vuelo.destino
    ) AS subconsulta
);


-- 7
-- Cuenta cuántos empleados hay registrados en cada aerolínea, desglosados por puesto.
-- Se agrupan los empleados por tipo (piloto, sobrecargo, etc.) y por id_aerolinea.
-- Se usa UNION ALL para combinar los conteos de cada tabla de empleados.
-- Se vincula con la tabla aerolinea para mostrar el nombre correspondiente.
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
-- Cuenta cuántos empleados trabajan en cada aeropuerto, desglosados por puesto.
-- Se agrupan los empleados por tipo (controlador, técnico, etc.) y por id_aeropuerto.
-- Se usa UNION ALL para combinar los conteos de cada tabla de empleados.
-- Se vincula con la tabla aeropuerto para mostrar el nombre correspondiente.
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
-- Calcula el costo promedio de los boletos vendidos por cada vuelo.
-- Se utilizan las tablas boleto, tarifa_vuelo y vuelo, vinculando cada boleto con su tarifa y vuelo.
-- Se aplica AVG sobre tarifa_vuelo.precio, agrupando por vuelo.
-- Se excluyen los vuelos cancelados.
SELECT vuelo.id_vuelo, AVG(tarifa_vuelo.precio) AS costo_promedio
FROM boleto
JOIN tarifa_vuelo ON boleto.id_tarifa = tarifa_vuelo.id_tarifa
JOIN vuelo ON boleto.id_vuelo = vuelo.id_vuelo
WHERE vuelo.estado != 'CANCELADO'
GROUP BY vuelo.id_vuelo
--ORDER BY vuelo.id_vuelo;
ORDER BY costo_promedio DESC;


-- 10
-- Calcula el costo total generado por cada vuelo, sumando el precio de todos los boletos vendidos.
-- Se utilizan las tablas boleto, tarifa_vuelo y vuelo, vinculando cada boleto con su tarifa y vuelo.
-- Se aplica SUM sobre tarifa_vuelo.precio, agrupando por vuelo.
SELECT vuelo.id_vuelo, SUM(tarifa_vuelo.precio) AS costo_total
FROM boleto
JOIN tarifa_vuelo ON boleto.id_tarifa = tarifa_vuelo.id_tarifa
JOIN vuelo ON boleto.id_vuelo = vuelo.id_vuelo
GROUP BY vuelo.id_vuelo
ORDER BY costo_total DESC;


-- 11
-- Muestra el número total de vuelos registrados por cada aerolínea.
-- Se usan las tablas vuelo, avion y aerolinea para vincular cada vuelo con la aerolínea propietaria del avión usado.
-- Se aplica COUNT para contar los vuelos registrados por cada aerolínea.
SELECT aerolinea.nombre AS aerolinea,
       COUNT(vuelo.id_vuelo) AS total_vuelos
FROM vuelo
JOIN avion ON vuelo.id_avion = avion.id_avion
JOIN aerolinea ON avion.id_aerolinea = aerolinea.id_aerolinea
GROUP BY aerolinea.nombre
ORDER BY aerolinea.nombre;


-- 12
-- Muestra el número de pilotos certificados registrados y agrupados por tipo de licencia.
-- Se usa la tabla piloto, filtrando por esta_certificado = TRUE y agrupando por tipo_licencia.
-- Se aplica COUNT para obtener el número de pilotos certificados por cada tipo de licencia.
SELECT piloto.tipo_licencia,
       COUNT(piloto.id_empleado) AS pilotos_certificados
FROM piloto
WHERE piloto.esta_certificado = TRUE
GROUP BY piloto.tipo_licencia
ORDER BY piloto.tipo_licencia;


-- 13
-- Muestra el costo promedio de boletos vendidos por aerolínea.
-- Se usan las tablas boleto, tarifa_vuelo, vuelo, avion y aerolinea para rastrear cada boleto hasta la aerolínea que operó el vuelo.
-- De los boletos de cada aerolínea se obtienen las tarifa_vuelo.
-- Se aplica AVG sobre tarifa_vuelo.precio para obtener el promedio de precios de los vuelos por aerolínea.
SELECT aerolinea.nombre AS aerolinea,
       AVG(tarifa_vuelo.precio) AS costo_promedio
FROM boleto
JOIN tarifa_vuelo ON boleto.id_tarifa = tarifa_vuelo.id_tarifa
JOIN vuelo ON boleto.id_vuelo = vuelo.id_vuelo
JOIN avion ON vuelo.id_avion = avion.id_avion
JOIN aerolinea ON avion.id_aerolinea = aerolinea.id_aerolinea
GROUP BY aerolinea.nombre
ORDER BY aerolinea.nombre;


-- 14
-- Muestra el vuelo con el boleto más caro y el vuelo con el boleto más barato registrados en el sistema.
-- Si hay varios con boletos con el mayor o menor precio, se toma el de menor id.
-- Se utilizan las tablas boleto, tarifa_vuelo y vuelo para rastrear el precio de cada boleto y el vuelo al que pertenece.
-- Se aplica MAX y MIN sobre tarifa_vuelo.precio para identificar los extremos de precio entre todos los boletos vendidos.
-- Se encapsulan los SELECT con LIMIT dentro de subconsultas para después usar UNION sobre cada consulta.
(
  SELECT vuelo.id_vuelo,
         tarifa_vuelo.precio AS precio
  FROM boleto
  JOIN tarifa_vuelo ON boleto.id_tarifa = tarifa_vuelo.id_tarifa
  JOIN vuelo ON boleto.id_vuelo = vuelo.id_vuelo
  WHERE tarifa_vuelo.precio = (
      SELECT MAX(precio)
      FROM tarifa_vuelo
  )
  ORDER BY vuelo.id_vuelo
  LIMIT 1
)
UNION
(
  SELECT vuelo.id_vuelo,
         tarifa_vuelo.precio AS precio
  FROM boleto
  JOIN tarifa_vuelo ON boleto.id_tarifa = tarifa_vuelo.id_tarifa
  JOIN vuelo ON boleto.id_vuelo = vuelo.id_vuelo
  WHERE tarifa_vuelo.precio = (
      SELECT MIN(precio)
      FROM tarifa_vuelo
  )
  ORDER BY vuelo.id_vuelo
  LIMIT 1
)
ORDER BY precio DESC;


-- 15
-- Cuenta el número de aviones registrados en cada aerolínea.
-- Se utilizan las tablas avion y aerolinea, vinculando cada avión con su aerolínea mediante id_aerolinea.
-- Se aplica COUNT sobre avion.id_avion para obtener cuántos aviones tiene registrada cada aerolínea.
SELECT aerolinea.nombre AS aerolinea,
       COUNT(avion.id_avion) AS total_aviones
FROM avion
JOIN aerolinea ON avion.id_aerolinea = aerolinea.id_aerolinea
GROUP BY aerolinea.nombre
ORDER BY aerolinea.nombre;


-- 16
-- Muestra cuántos vuelos salen de cada aeropuerto(No cancelados), ordenando de mayor a menor.
-- Se usan las tablas vuelo y aeropuerto, considerando vuelo.origen como punto de salida.
-- Se aplica COUNT para contar los vuelos no cancelados por aeropuerto de origen.
SELECT aeropuerto.nombre AS aeropuerto,
       COUNT(vuelo.id_vuelo) AS vuelos_salida
FROM vuelo
JOIN aeropuerto ON vuelo.origen = aeropuerto.id_aeropuerto
WHERE vuelo.estado != 'CANCELADO'
GROUP BY aeropuerto.nombre
ORDER BY vuelos_salida DESC;


-- 17
-- Muestra los vuelos cuya capacidad total de pasajeros (según el avión asignado) supera los 50 asientos.
-- Se usan las tablas vuelo y avion, considerando avion.capacidad_pasajeros como criterio de filtro.
-- No se aplica función de agregación, solo se filtran los vuelos con capacidad mayor a 50.
SELECT vuelo.id_vuelo,
       avion.capacidad_pasajeros AS capacidad_total
FROM vuelo
JOIN avion ON vuelo.id_avion = avion.id_avion
WHERE avion.capacidad_pasajeros > 50
ORDER BY vuelo.id_vuelo;


-- 18
-- Muestra los vuelos con más del 50% de ocupación, comparando boletos vendidos contra la capacidad del avión.
-- Se usan las tablas vuelo, avion y boleto; se calcula el porcentaje de ocupación dividiendo boletos vendidos entre capacidad.
-- Se aplica COUNT para contar boletos por vuelo y se filtran aquellos con ocupación superior al 50%.
SELECT vuelo.id_vuelo,
       COUNT(boleto.id_boleto) AS boletos_vendidos,
       avion.capacidad_pasajeros,
       COUNT(boleto.id_boleto) * 100.0 / avion.capacidad_pasajeros AS porcentaje_ocupacion
FROM vuelo
JOIN avion ON vuelo.id_avion = avion.id_avion
LEFT JOIN boleto ON vuelo.id_vuelo = boleto.id_vuelo
GROUP BY vuelo.id_vuelo, avion.capacidad_pasajeros
HAVING COUNT(boleto.id_boleto) > avion.capacidad_pasajeros / 2
ORDER BY vuelo.id_vuelo;


-- 19
-- Muestra cuántos vuelos de pasajeros (COMERCIAL) y cuántos de carga (CARGA) salen de cada aeropuerto.
-- Se usan las tablas vuelo y aeropuerto, agrupando por aeropuerto de origen y tipo de vuelo.
-- Se aplica COUNT para obtener la cantidad de vuelos por tipo y aeropuerto, excluyendo vuelos cancelados.
SELECT aeropuerto.nombre AS aeropuerto,
       vuelo.tipo_vuelo,
       COUNT(vuelo.id_vuelo) AS cantidad_vuelos
FROM vuelo
JOIN aeropuerto ON vuelo.origen = aeropuerto.id_aeropuerto
WHERE vuelo.estado != 'CANCELADO'
GROUP BY aeropuerto.nombre, vuelo.tipo_vuelo
ORDER BY aeropuerto.nombre, vuelo.tipo_vuelo;


-- 20
-- Muestra la duración promedio y el número de vuelos de carga por aerolínea, mostrando las 5 con mayor actividad.
-- Se usan las tablas vuelo, avion y aerolinea, considerando solo vuelos de tipo 'CARGA'.
-- Se aplican AVG para duración (eta - etd) y COUNT para cantidad de vuelos, ordenando por actividad de carga.
SELECT aerolinea.nombre AS aerolinea,
       AVG(vuelo.eta - vuelo.etd) AS duracion_promedio,
       COUNT(vuelo.id_vuelo) AS total_vuelos_carga
FROM vuelo
JOIN avion ON vuelo.id_avion = avion.id_avion
JOIN aerolinea ON avion.id_aerolinea = aerolinea.id_aerolinea
WHERE vuelo.tipo_vuelo = 'CARGA'
GROUP BY aerolinea.nombre
HAVING COUNT(vuelo.id_vuelo) > 0
ORDER BY total_vuelos_carga DESC
LIMIT 5;









-----------------CONSULTAS PROPIAS-----------------------------

-- 1
-- Muestra cuántos vuelos ha realizado cada avión registrado en el sistema, ordenados de mayor número de vuelos a menor.
-- Se utilizan las tablas avion y vuelo, vinculando vuelo.id_avion con avion.id_avion.
-- Se aplica COUNT sobre vuelo.id_vuelo, agrupando por avión.
SELECT avion.id_avion,
       avion.modelo,
       COUNT(vuelo.id_vuelo) AS total_vuelos
FROM avion
JOIN vuelo ON avion.id_avion = vuelo.id_avion
GROUP BY avion.id_avion, avion.modelo
ORDER BY total_vuelos DESC;


-- 2
-- Muestra el tiempo total en vuelo acumulado por cada avión, considerando solo vuelos finalizados.
-- Se utiliza la tabla vuelo, agrupando por id_avion.
-- Se calcula la duración como la diferencia entre eta y etd.
-- Se aplica SUM para acumular el tiempo total por avión.
SELECT avion.id_avion,
       SUM(vuelo.eta - vuelo.etd) AS tiempo_total_en_vuelo
FROM vuelo
JOIN avion ON vuelo.id_avion = avion.id_avion
WHERE vuelo.estado = 'FINALIZADO'
GROUP BY avion.id_avion
ORDER BY tiempo_total_en_vuelo DESC;


-- 3
-- Muestra cuántos modelos distintos de avión tiene registrada cada aerolínea.
-- Se utiliza la tabla avion, agrupando por id_aerolinea.
-- Se aplica COUNT(DISTINCT modelo) para contar la variedad de modelos por aerolínea.
SELECT aerolinea.nombre AS aerolinea,
       COUNT(DISTINCT avion.modelo) AS modelos_distintos
FROM avion
JOIN aerolinea ON avion.id_aerolinea = aerolinea.id_aerolinea
GROUP BY aerolinea.nombre
ORDER BY modelos_distintos DESC;


-- 4
-- Muestra la capacidad máxima y mínima de los aviones registrados por cada aerolínea.
-- Se utiliza la tabla avion, agrupando por id_aerolinea.
-- Se aplican MAX y MIN sobre capacidad_pasajeros.
SELECT aerolinea.nombre AS aerolinea,
       MAX(avion.capacidad_pasajeros) AS capacidad_maxima,
       MIN(avion.capacidad_pasajeros) AS capacidad_minima
FROM avion
JOIN aerolinea ON avion.id_aerolinea = aerolinea.id_aerolinea
GROUP BY aerolinea.nombre
ORDER BY capacidad_maxima DESC;


-- 5
-- Muestra los aviones que han estado en 5 o más ciudades distintas, considerando origen y destino de sus vuelos.
-- Se utilizan las tablas vuelo, avion y aeropuerto.
-- Se construye una unión de ciudades visitadas por cada avión (origen y destino), eliminando duplicados.
-- Se agrupa por avión y se filtra con HAVING para mostrar solo aquellos con 5 o más ciudades distintas.
SELECT avion.id_avion,
       avion.modelo,
       COUNT(DISTINCT aeropuerto.ciudad) AS ciudades_visitadas
FROM vuelo
JOIN avion ON vuelo.id_avion = avion.id_avion
JOIN aeropuerto ON aeropuerto.id_aeropuerto IN (vuelo.origen, vuelo.destino)
GROUP BY avion.id_avion, avion.modelo
HAVING COUNT(DISTINCT aeropuerto.ciudad) >= 5
ORDER BY ciudades_visitadas DESC;


