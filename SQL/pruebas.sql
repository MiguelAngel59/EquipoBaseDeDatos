-- PRUEBAS

-----------------------------Funciones----------------------------------------

-- porcentaje_ocupacion_vuelo(p_id_vuelo INT)
-- Ejemplo: muestra el porcentaje de ocupación de los vuelos del día.
SELECT 
    v.id_vuelo,
    a.modelo AS avion_modelo,
    porcentaje_ocupacion_vuelo(v.id_vuelo) AS porcentaje_ocupacion
FROM vuelo v
JOIN avion a ON v.id_avion = a.id_avion
ORDER BY porcentaje_ocupacion DESC;


-- vuelos_activos_aerolinea(p_id_aerolinea INT)
-- Ejemplo: lista cuántos vuelos activos tiene cada aerolínea.
SELECT 
    al.nombre AS aerolinea,
    vuelos_activos_aerolinea(al.id_aerolinea) AS vuelos_activos
FROM aerolinea al
ORDER BY vuelos_activos DESC;


-- total_ingresos_aeropuerto(p_id_aeropuerto INT)
-- Ejemplo: calcula los ingresos generados por cada aeropuerto.
SELECT 
    ap.nombre AS aeropuerto_origen,
    total_ingresos_aeropuerto(ap.id_aeropuerto) AS ingresos_totales
FROM aeropuerto ap
ORDER BY ingresos_totales DESC;






---------------------------Procedimiento--------------------------------------

-- actualizar_estado_por_hora()
-- Ejemplo: actualiza los estados de los vuelos según la hora actual, posterior
-- se consulta los vuelos PRORAMADOS, los cuales deberían ser pocos.
CALL actualizar_estado_por_hora();
SELECT id_vuelo, estado
FROM vuelo
WHERE estado LIKE 'PROGRAMADO';


-- ajustar_importe_clase_vuelo(p_id_vuelo, p_clase, p_incremento)
-- Ejemplo: aumenta el precio de la clase EJECUTIVA del vuelo 10.
CALL ajustar_importe_clase_vuelo(10, 'EJECUTIVA', 250.00);
SELECT id_tarifa, clase, precio
FROM tarifa_vuelo
WHERE id_vuelo = 10 AND clase ILIKE 'EJECUTIVA';


-- actualizar_ubicacion_aviones()
-- Ejemplo: actualiza la ubicación de los aviones según los vuelos activos.
CALL actualizar_ubicacion_aviones();
-- Consulta para verificar resultado
SELECT id_avion, id_aeropuerto
FROM avion
ORDER BY id_avion;


-- actualizar_ubicacion_pilotos()
-- Ejemplo: actualiza la ubicación de los pilotos según sus vuelos.
CALL actualizar_ubicacion_pilotos();
-- Consulta para verificar resultado
SELECT id_empleado AS id_piloto, nombre, id_aeropuerto
FROM piloto
ORDER BY id_empleado;
