-- PRUEBAS

-----------------------------Funciones----------------------------------------

-- porcentaje_ocupacion_vuelo(p_id_vuelo INT)
-- Ejemplo: muestra el porcentaje de ocupación de los vuelos del día.
SELECT 
    v.id_vuelo,
    v.codigo_vuelo,
    a.nombre AS aerolinea,
    porcentaje_ocupacion_vuelo(v.id_vuelo) AS ocupacion_actual
FROM vuelo v
JOIN aerolinea a ON v.id_aerolinea = a.id_aerolinea
WHERE DATE(v.etd) = CURRENT_DATE
ORDER BY ocupacion_actual DESC;


-- vuelos_activos_aerolinea(p_id_aerolinea INT)
-- Ejemplo: lista cuántos vuelos activos tiene cada aerolínea.
SELECT 
    a.nombre AS aerolinea,
    vuelos_activos_aerolinea(a.id_aerolinea) AS vuelos_en_operacion
FROM aerolinea a
ORDER BY vuelos_en_operacion DESC;


-- total_ingresos_aeropuerto(p_id_aeropuerto INT)
-- Ejemplo: calcula los ingresos generados por cada aeropuerto.
SELECT 
    ap.nombre AS aeropuerto_origen,
    total_ingresos_aeropuerto(ap.id_aeropuerto) AS ingresos_generados
FROM aeropuerto ap
WHERE ap.tipo = 'INTERNACIONAL'
ORDER BY ingresos_generados DESC;






---------------------------Procedimiento--------------------------------------

-- actualizar_estado_por_hora()
-- Ejemplo: actualiza los estados de los vuelos según la hora actual.
CALL actualizar_estado_por_hora(v_en_transito, v_finalizados);
SELECT 
    v_en_transito AS "Vuelos EN_VUELO",
    v_finalizados AS "Vuelos FINALIZADOS";


-- ajustar_importe_clase_vuelo(p_id_vuelo, p_clase, p_incremento)
-- Ejemplo: aumenta el precio de la clase EJECUTIVA del vuelo 104.
CALL ajustar_importe_clase_vuelo(104, 'EJECUTIVA', 250.00);
SELECT id_tarifa, clase, precio
FROM tarifa_vuelo
WHERE id_vuelo = 104 AND clase ILIKE 'EJECUTIVA';


-- actualizar_ubicacion_aviones()
-- Ejemplo: actualiza la ubicación de los aviones según los vuelos activos.
CALL actualizar_ubicacion_aviones();
SELECT id_avion, id_aeropuerto
FROM avion
ORDER BY id_avion;


-- actualizar_ubicacion_pilotos()
-- Ejemplo: actualiza la ubicación de los pilotos según sus vuelos.
CALL actualizar_ubicacion_pilotos();
SELECT id_empleado AS id_piloto, nombre, id_aeropuerto
FROM piloto
ORDER BY nombre;
