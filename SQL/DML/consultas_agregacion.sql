-- 1
-- Muestra cuántos vuelos no cancelados salen de cada ciudad de origen.
-- Se utilizan las tablas vuelo y aeropuerto, vinculando vuelo.origen con aeropuerto.id_aeropuerto.
-- Se aplica COUNT sobre vuelo.id_vuelo, agrupando por ciudad y excluyendo vuelos cancelados.
SELECT a.ciudad,
       COUNT(v.id_vuelo) AS cantidad_vuelos
FROM vuelo v
JOIN aeropuerto a ON v.origen = a.id_aeropuerto
WHERE v.estado != 'CANCELADO'
GROUP BY a.ciudad
ORDER BY cantidad_vuelos DESC;

  
-- 2
-- Muestra la duración promedio de los vuelos por aerolínea.
-- Se utilizan las tablas vuelo, avion y aerolinea, vinculando cada vuelo con la aerolínea propietaria del avión.
-- Se aplica AVG sobre la diferencia entre eta y etd para obtener la duración promedio por aerolínea.
SELECT ar.nombre AS aerolinea,
       AVG(p.eta - p.etd) AS duracion_promedio_interval
FROM programacion_vuelo p
JOIN avion a ON p.id_avion = a.id_avion
JOIN aerolinea ar ON a.id_aerolinea = ar.id_aerolinea
WHERE p.eta IS NOT NULL AND p.etd IS NOT NULL
GROUP BY ar.nombre
ORDER BY duracion_promedio_interval DESC;

  
-- 3
-- Muestra el id del vuelo más largo y el más corto por ciudad de origen.
-- Se utilizan las tablas vuelo y aeropuerto, vinculando vuelo.origen con aeropuerto.id_aeropuerto.
-- Se calcula la duración como la diferencia entre eta y etd.
-- Se usan subconsultas correlacionadas con ORDER BY y LIMIT 1 para obtener los vuelos extremos por ciudad.
SELECT a.ciudad AS ciudad_origen,
       (
         SELECT v1.id_vuelo
         FROM programacion_vuelo p1
         JOIN vuelo v1 ON p1.id_vuelo = v1.id_vuelo
         WHERE v1.origen = a.id_aeropuerto AND v1.estado != 'CANCELADO' AND p1.eta IS NOT NULL AND p1.etd IS NOT NULL
         ORDER BY (p1.eta - p1.etd) ASC
         LIMIT 1
       ) AS vuelo_mas_corto,
       (
         SELECT v2.id_vuelo
         FROM programacion_vuelo p2
         JOIN vuelo v2 ON p2.id_vuelo = v2.id_vuelo
         WHERE v2.origen = a.id_aeropuerto AND v2.estado != 'CANCELADO' AND p2.eta IS NOT NULL AND p2.etd IS NOT NULL
         ORDER BY (p2.eta - p2.etd) DESC
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
SELECT TO_CHAR(p.etd, 'YYYY-MM') AS anio_mes,
       COUNT(*) AS cantidad_vuelos
FROM programacion_vuelo p
JOIN vuelo v ON p.id_vuelo = v.id_vuelo
WHERE v.estado != 'CANCELADO'
GROUP BY TO_CHAR(p.etd, 'YYYY-MM')
ORDER BY anio_mes;


-- 5
-- Lista las aerolíneas que tienen más de 10 vuelos registrados en el sistema.
-- Se utilizan las tablas vuelo, avion y aerolinea, vinculando cada vuelo con su aerolínea.
-- Se aplica COUNT sobre vuelo.id_vuelo y se filtran las aerolíneas con más de 10 vuelos usando HAVING.
SELECT ar.nombre,
       COUNT(p.id_programacion) AS total_vuelos
FROM programacion_vuelo p
JOIN avion a ON p.id_avion = a.id_avion
JOIN aerolinea ar ON a.id_aerolinea = ar.id_aerolinea
GROUP BY ar.nombre
HAVING COUNT(p.id_programacion) > 10
ORDER BY total_vuelos DESC;

-- 6
-- Muestra la ciudad destino con la mayor suma total de duración de vuelos.
-- Se utilizan las tablas vuelo y aeropuerto, vinculando vuelo.destino con aeropuerto.id_aeropuerto.
-- Se aplica SUM sobre la duración (eta - etd) y se filtra el destino con duración total máxima.
SELECT ap.ciudad AS destino,
       SUM(p.eta - p.etd) AS duracion_total
FROM programacion_vuelo p
JOIN vuelo v ON p.id_vuelo = v.id_vuelo
JOIN aeropuerto ap ON v.destino = ap.id_aeropuerto
WHERE p.eta IS NOT NULL AND p.etd IS NOT NULL
GROUP BY ap.ciudad
ORDER BY duracion_total DESC
LIMIT 1;


-- 7
-- Cuenta cuántos empleados hay registrados en cada aerolínea, desglosados por puesto.
-- Se agrupan los empleados por tipo (piloto, sobrecargo, etc.) y por id_aerolinea.
-- Se usa UNION ALL para combinar los conteos de cada tabla de empleados.
-- Se vincula con la tabla aerolinea para mostrar el nombre correspondiente.
SELECT ar.nombre AS aerolinea,
       e.puesto,
       e.cantidad
FROM (
    SELECT 'piloto' AS puesto, emp.id_aerolinea, COUNT(*) AS cantidad
    FROM piloto pl
    JOIN empleado emp ON pl.id_empleado = emp.id_empleado
    GROUP BY emp.id_aerolinea

    UNION ALL

    SELECT 'sobrecargo', emp.id_aerolinea, COUNT(*) AS cantidad
    FROM sobrecargo s
    JOIN empleado emp ON s.id_empleado = emp.id_empleado
    GROUP BY emp.id_aerolinea

    UNION ALL

    SELECT 'controlador', emp.id_aerolinea, COUNT(*) AS cantidad
    FROM controlador c
    JOIN empleado emp ON c.id_empleado = emp.id_empleado
    GROUP BY emp.id_aerolinea

    UNION ALL

    SELECT 'tecnico', emp.id_aerolinea, COUNT(*) AS cantidad
    FROM tecnico t
    JOIN empleado emp ON t.id_empleado = emp.id_empleado
    GROUP BY emp.id_aerolinea

    UNION ALL

    SELECT 'atencionalpasajero', emp.id_aerolinea, COUNT(*) AS cantidad
    FROM atencionalpasajero ap
    JOIN empleado emp ON ap.id_empleado = emp.id_empleado
    GROUP BY emp.id_aerolinea

    UNION ALL

    SELECT 'ingeniero', emp.id_aerolinea, COUNT(*) AS cantidad
    FROM ingeniero i
    JOIN empleado emp ON i.id_empleado = emp.id_empleado
    GROUP BY emp.id_aerolinea
) AS e
JOIN aerolinea ar ON e.id_aerolinea = ar.id_aerolinea
ORDER BY ar.nombre, e.puesto;


-- 8
-- Cuenta cuántos empleados trabajan en cada aeropuerto, desglosados por puesto.
-- Se agrupan los empleados por tipo (controlador, técnico, etc.) y por id_aeropuerto.
-- Se usa UNION ALL para combinar los conteos de cada tabla de empleados.
-- Se vincula con la tabla aeropuerto para mostrar el nombre correspondiente.
SELECT ap.nombre AS aeropuerto,
       e.puesto,
       e.cantidad
FROM (
    SELECT 'controlador' AS puesto, emp.id_aeropuerto, COUNT(*) AS cantidad
    FROM controlador c
    JOIN empleado emp ON c.id_empleado = emp.id_empleado
    GROUP BY emp.id_aeropuerto

    UNION ALL

    SELECT 'tecnico', emp.id_aeropuerto, COUNT(*) AS cantidad
    FROM tecnico t
    JOIN empleado emp ON t.id_empleado = emp.id_empleado
    GROUP BY emp.id_aeropuerto

    UNION ALL

    SELECT 'atencionalpasajero', emp.id_aeropuerto, COUNT(*) AS cantidad
    FROM atencionalpasajero ap2
    JOIN empleado emp ON ap2.id_empleado = emp.id_empleado
    GROUP BY emp.id_aeropuerto

    UNION ALL

    SELECT 'ingeniero', emp.id_aeropuerto, COUNT(*) AS cantidad
    FROM ingeniero i
    JOIN empleado emp ON i.id_empleado = emp.id_empleado
    GROUP BY emp.id_aeropuerto
) AS e
LEFT JOIN aeropuerto ap ON e.id_aeropuerto = ap.id_aeropuerto
ORDER BY ap.nombre, e.puesto;


-- 9
-- Calcula el costo promedio de los boletos vendidos por cada vuelo.
-- Se utilizan las tablas boleto, tarifa_vuelo y vuelo, vinculando cada boleto con su tarifa y vuelo.
-- Se aplica AVG sobre tarifa_vuelo.precio, agrupando por vuelo.
-- Se excluyen los vuelos cancelados.
SELECT v.id_vuelo,
       p.id_programacion,
       AVG(t.precio) AS costo_promedio_tarifas_disponibles,
       COUNT(b.id_boleto) AS boletos_vendidos_registrados
FROM programacion_vuelo p
JOIN vuelo v ON p.id_vuelo = v.id_vuelo
LEFT JOIN tarifa_vuelo t ON t.id_programacion_vuelo = p.id_programacion
LEFT JOIN boleto b ON b.id_programacion_vuelo = p.id_programacion
WHERE v.estado != 'CANCELADO'
GROUP BY v.id_vuelo, p.id_programacion
ORDER BY costo_promedio_tarifas_disponibles DESC;


-- 10
-- Calcula el costo total generado por cada vuelo, sumando el precio de todos los boletos vendidos.
-- Se utilizan las tablas boleto, tarifa_vuelo y vuelo, vinculando cada boleto con su tarifa y vuelo.
-- Se aplica SUM sobre tarifa_vuelo.precio, agrupando por vuelo.
SELECT v.id_vuelo,
       SUM(COALESCE(avg_tarifa,0) * cnt_boletos) AS costo_total_estimado
FROM (
    SELECT p.id_programacion,
           p.id_vuelo,
           COUNT(b.id_boleto) AS cnt_boletos,
           AVG(t.precio) AS avg_tarifa
    FROM programacion_vuelo p
    LEFT JOIN boleto b ON b.id_programacion_vuelo = p.id_programacion
    LEFT JOIN tarifa_vuelo t ON t.id_programacion_vuelo = p.id_programacion
    GROUP BY p.id_programacion, p.id_vuelo
) sub
JOIN vuelo v ON sub.id_vuelo = v.id_vuelo
GROUP BY v.id_vuelo
ORDER BY costo_total_estimado DESC;

-- 11
-- Muestra el número total de vuelos registrados por cada aerolínea.
-- Se usan las tablas vuelo, avion y aerolinea para vincular cada vuelo con la aerolínea propietaria del avión usado.
-- Se aplica COUNT para contar los vuelos registrados por cada aerolínea.
SELECT ar.nombre AS aerolinea,
       COUNT(p.id_programacion) AS total_vuelos
FROM programacion_vuelo p
JOIN avion a ON p.id_avion = a.id_avion
JOIN aerolinea ar ON a.id_aerolinea = ar.id_aerolinea
GROUP BY ar.nombre
ORDER BY ar.nombre;


-- 12
-- Muestra el número de pilotos certificados registrados y agrupados por tipo de licencia.
-- Se usa la tabla piloto, filtrando por esta_certificado = TRUE y agrupando por tipo_licencia.
-- Se aplica COUNT para obtener el número de pilotos certificados por cada tipo de licencia.
SELECT lp.tipo_licencia,
       COUNT(DISTINCT lp.id_piloto) AS pilotos_certificados
FROM licencia_piloto lp
WHERE lp.fecha_vencimiento >= CURRENT_DATE
GROUP BY lp.tipo_licencia
ORDER BY lp.tipo_licencia;


-- 13
-- Muestra el costo promedio de boletos vendidos por aerolínea.
-- Se usan las tablas boleto, tarifa_vuelo, vuelo, avion y aerolinea para rastrear cada boleto hasta la aerolínea que operó el vuelo.
-- De los boletos de cada aerolínea se obtienen las tarifa_vuelo.
-- Se aplica AVG sobre tarifa_vuelo.precio para obtener el promedio de precios de los vuelos por aerolínea.
SELECT ar.nombre AS aerolinea,
       AVG(t.precio) AS costo_promedio_tarifa_disponible
FROM tarifa_vuelo t
JOIN programacion_vuelo p ON t.id_programacion_vuelo = p.id_programacion
JOIN avion a ON p.id_avion = a.id_avion
JOIN aerolinea ar ON a.id_aerolinea = ar.id_aerolinea
GROUP BY ar.nombre
ORDER BY ar.nombre;


-- 14
-- Muestra el vuelo con el boleto más caro y el vuelo con el boleto más barato registrados en el sistema.
-- Si hay varios con boletos con el mayor o menor precio, se toma el de menor id.
-- Se utilizan las tablas boleto, tarifa_vuelo y vuelo para rastrear el precio de cada boleto y el vuelo al que pertenece.
-- Se aplica MAX y MIN sobre tarifa_vuelo.precio para identificar los extremos de precio entre todos los boletos vendidos.
-- Se encapsulan los SELECT con LIMIT dentro de subconsultas para después usar UNION sobre cada consulta.
(
  SELECT v.id_vuelo,
         t.precio AS precio
  FROM tarifa_vuelo t
  JOIN programacion_vuelo p ON t.id_programacion_vuelo = p.id_programacion
  JOIN vuelo v ON p.id_vuelo = v.id_vuelo
  WHERE t.precio = (SELECT MAX(precio) FROM tarifa_vuelo)
  ORDER BY v.id_vuelo
  LIMIT 1
)
UNION
(
  SELECT v.id_vuelo,
         t.precio AS precio
  FROM tarifa_vuelo t
  JOIN programacion_vuelo p ON t.id_programacion_vuelo = p.id_programacion
  JOIN vuelo v ON p.id_vuelo = v.id_vuelo
  WHERE t.precio = (SELECT MIN(precio) FROM tarifa_vuelo)
  ORDER BY v.id_vuelo
  LIMIT 1
)
ORDER BY precio DESC;


-- 15
-- Cuenta el número de aviones registrados en cada aerolínea.
-- Se utilizan las tablas avion y aerolinea, vinculando cada avión con su aerolínea mediante id_aerolinea.
-- Se aplica COUNT sobre avion.id_avion para obtener cuántos aviones tiene registrada cada aerolínea.
SELECT ar.nombre AS aerolinea,
       COUNT(a.id_avion) AS total_aviones
FROM avion a
JOIN aerolinea ar ON a.id_aerolinea = ar.id_aerolinea
GROUP BY ar.nombre
ORDER BY ar.nombre;


-- 16
-- Muestra cuántos vuelos salen de cada aeropuerto(No cancelados), ordenando de mayor a menor.
-- Se usan las tablas vuelo y aeropuerto, considerando vuelo.origen como punto de salida.
-- Se aplica COUNT para contar los vuelos no cancelados por aeropuerto de origen.
SELECT ap.nombre AS aeropuerto,
       COUNT(v.id_vuelo) AS vuelos_salida
FROM vuelo v
JOIN aeropuerto ap ON v.origen = ap.id_aeropuerto
WHERE v.estado != 'CANCELADO'
GROUP BY ap.nombre
ORDER BY vuelos_salida DESC;

-- 17
-- Muestra los vuelos cuya capacidad total de pasajeros (según el avión asignado) supera los 50 asientos.
-- Se usan las tablas vuelo y avion, considerando avion.capacidad_pasajeros como criterio de filtro.
-- No se aplica función de agregación, solo se filtran los vuelos con capacidad mayor a 50.
SELECT DISTINCT v.id_vuelo,
       a.capacidad_pasajeros AS capacidad_total
FROM programacion_vuelo p
JOIN avion a ON p.id_avion = a.id_avion
JOIN vuelo v ON p.id_vuelo = v.id_vuelo
WHERE a.capacidad_pasajeros > 50
ORDER BY v.id_vuelo;

-- 18
-- Muestra los vuelos con más del 50% de ocupación, comparando boletos vendidos contra la capacidad del avión.
-- Se usan las tablas vuelo, avion y boleto; se calcula el porcentaje de ocupación dividiendo boletos vendidos entre capacidad.
-- Se aplica COUNT para contar boletos por vuelo y se filtran aquellos con ocupación superior al 50%.
SELECT p.id_programacion,
       v.id_vuelo,
       COUNT(b.id_boleto) AS boletos_vendidos,
       a.capacidad_pasajeros,
       (COUNT(b.id_boleto) * 100.0) / NULLIF(a.capacidad_pasajeros,0) AS porcentaje_ocupacion
FROM programacion_vuelo p
JOIN avion a ON p.id_avion = a.id_avion
JOIN vuelo v ON p.id_vuelo = v.id_vuelo
LEFT JOIN boleto b ON b.id_programacion_vuelo = p.id_programacion
GROUP BY p.id_programacion, v.id_vuelo, a.capacidad_pasajeros
HAVING COUNT(b.id_boleto) > a.capacidad_pasajeros / 2.0
ORDER BY v.id_vuelo;


-- 19
-- Muestra cuántos vuelos de pasajeros (COMERCIAL) y cuántos de carga (CARGA) salen de cada aeropuerto.
-- Se usan las tablas vuelo y aeropuerto, agrupando por aeropuerto de origen y tipo de vuelo.
-- Se aplica COUNT para obtener la cantidad de vuelos por tipo y aeropuerto, excluyendo vuelos cancelados.
SELECT ap.nombre AS aeropuerto,
       v.tipo_vuelo,
       COUNT(v.id_vuelo) AS cantidad_vuelos
FROM vuelo v
JOIN aeropuerto ap ON v.origen = ap.id_aeropuerto
WHERE v.estado != 'CANCELADO'
GROUP BY ap.nombre, v.tipo_vuelo
ORDER BY ap.nombre, v.tipo_vuelo;


-- 20
-- Muestra la duración promedio y el número de vuelos de carga por aerolínea, mostrando las 5 con mayor actividad.
-- Se usan las tablas vuelo, avion y aerolinea, considerando solo vuelos de tipo 'CARGA'.
-- Se aplican AVG para duración (eta - etd) y COUNT para cantidad de vuelos, ordenando por actividad de carga.
SELECT ar.nombre AS aerolinea,
       AVG(p.eta - p.etd) AS duracion_promedio,
       COUNT(p.id_programacion) AS total_vuelos_carga
FROM programacion_vuelo p
JOIN vuelo v ON p.id_vuelo = v.id_vuelo
JOIN avion a ON p.id_avion = a.id_avion
JOIN aerolinea ar ON a.id_aerolinea = ar.id_aerolinea
WHERE v.tipo_vuelo = 'CARGA'
  AND p.eta IS NOT NULL AND p.etd IS NOT NULL
GROUP BY ar.nombre
ORDER BY total_vuelos_carga DESC
LIMIT 5;








-----------------CONSULTAS PROPIAS-----------------------------

-- 1
-- Muestra cuántos vuelos ha realizado cada avión registrado en el sistema, ordenados de mayor número de vuelos a menor.
-- Se utilizan las tablas avion y vuelo, vinculando vuelo.id_avion con avion.id_avion.
-- Se aplica COUNT sobre vuelo.id_vuelo, agrupando por avión.
SELECT a.id_avion,
       a.modelo,
       COUNT(p.id_programacion) AS total_vuelos
FROM avion a
LEFT JOIN programacion_vuelo p ON a.id_avion = p.id_avion
GROUP BY a.id_avion, a.modelo
ORDER BY total_vuelos DESC;


-- 2
-- Muestra el tiempo total en vuelo acumulado por cada avión, considerando solo vuelos finalizados.
-- Se utiliza la tabla vuelo, agrupando por id_avion.
-- Se calcula la duración como la diferencia entre eta y etd.
-- Se aplica SUM para acumular el tiempo total por avión.
SELECT a.id_avion,
       SUM(p.eta - p.etd) AS tiempo_total_en_vuelo
FROM programacion_vuelo p
JOIN avion a ON p.id_avion = a.id_avion
JOIN vuelo v ON p.id_vuelo = v.id_vuelo
WHERE v.estado = 'FINALIZADO' AND p.eta IS NOT NULL AND p.etd IS NOT NULL
GROUP BY a.id_avion
ORDER BY tiempo_total_en_vuelo DESC;


-- 3
-- Muestra cuántos modelos distintos de avión tiene registrada cada aerolínea.
-- Se utiliza la tabla avion, agrupando por id_aerolinea.
-- Se aplica COUNT(DISTINCT modelo) para contar la variedad de modelos por aerolínea.
SELECT ar.nombre AS aerolinea,
       COUNT(DISTINCT a.modelo) AS modelos_distintos
FROM avion a
JOIN aerolinea ar ON a.id_aerolinea = ar.id_aerolinea
GROUP BY ar.nombre
ORDER BY modelos_distintos DESC;


-- 4
-- Muestra la capacidad máxima y mínima de los aviones registrados por cada aerolínea.
-- Se utiliza la tabla avion, agrupando por id_aerolinea.
-- Se aplican MAX y MIN sobre capacidad_pasajeros.
SELECT ar.nombre AS aerolinea,
       MAX(a.capacidad_pasajeros) AS capacidad_maxima,
       MIN(a.capacidad_pasajeros) AS capacidad_minima
FROM avion a
JOIN aerolinea ar ON a.id_aerolinea = ar.id_aerolinea
GROUP BY ar.nombre
ORDER BY capacidad_maxima DESC;


-- 5
-- Muestra los aviones que han estado en 5 o más ciudades distintas, considerando origen y destino de sus vuelos.
-- Se utilizan las tablas vuelo, avion y aeropuerto.
-- Se construye una unión de ciudades visitadas por cada avión (origen y destino), eliminando duplicados.
-- Se agrupa por avión y se filtra con HAVING para mostrar solo aquellos con 5 o más ciudades distintas.
SELECT a.id_avion,
       a.modelo,
       COUNT(DISTINCT ap.ciudad) AS ciudades_visitadas
FROM programacion_vuelo p
JOIN avion a ON p.id_avion = a.id_avion
JOIN vuelo v ON p.id_vuelo = v.id_vuelo
JOIN aeropuerto ap ON ap.id_aeropuerto IN (v.origen, v.destino)
GROUP BY a.id_avion, a.modelo
HAVING COUNT(DISTINCT ap.ciudad) >= 5
ORDER BY ciudades_visitadas DESC;

