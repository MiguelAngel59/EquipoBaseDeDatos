-- -----------------------------Funciones----------------------------------------

-- porcentaje_ocupacion_vuelo(p_id_vuelo INT)
SELECT 
    v.id_vuelo,
    (SELECT a.modelo FROM programacion_vuelo pv JOIN avion a ON pv.id_avion = a.id_avion
     WHERE pv.id_vuelo = v.id_vuelo LIMIT 1) AS avion_modelo_example,
    porcentaje_ocupacion_vuelo(v.id_vuelo) AS porcentaje_ocupacion
FROM vuelo v
ORDER BY porcentaje_ocupacion DESC;


-- vuelos_activos_aerolinea(p_id_aerolinea INT)
SELECT 
    al.nombre AS aerolinea,
    vuelos_activos_aerolinea(al.id_aerolinea) AS vuelos_activos
FROM aerolinea al
ORDER BY vuelos_activos DESC;


-- total_ingresos_aeropuerto(p_id_aeropuerto INT)
SELECT 
    ap.nombre AS aeropuerto_origen,
    total_ingresos_aeropuerto(ap.id_aeropuerto) AS ingresos_totales
FROM aeropuerto ap
ORDER BY ingresos_totales DESC;


-- contar_vuelos_por_aeropuerto(p_id_aeropuerto, p_fecha)
SELECT 
    ap.id_aeropuerto,
    ap.nombre AS aeropuerto,
    contar_vuelos_por_aeropuerto(ap.id_aeropuerto, CURRENT_DATE) AS vuelos_salida_hoy
FROM aeropuerto ap
ORDER BY vuelos_salida_hoy DESC;


-- duracion_vuelo_minutos(p_id_vuelo INT)
SELECT 
    v.id_vuelo,
    v.origen,
    v.destino,
    duracion_vuelo_minutos(v.id_vuelo) AS duracion_minutos
FROM vuelo v
ORDER BY duracion_minutos DESC NULLS LAST;


-- tarifa_minima_por_vuelo(p_id_vuelo INT)
SELECT 
    v.id_vuelo,
    tarifa_minima_por_vuelo(v.id_vuelo) AS tarifa_minima_general,
    tarifa_minima_por_vuelo(v.id_vuelo,'ECONOMICA') AS tarifa_minima_economica
FROM vuelo v
ORDER BY tarifa_minima_general ASC;



-- ---------------------------Procedimiento--------------------------------------

-- actualizar_estado_por_hora()
CALL actualizar_estado_por_hora();
SELECT id_vuelo, estado
FROM vuelo
WHERE estado LIKE 'PROGRAMADO';


-- ajustar_importe_clase_vuelo(p_id_vuelo, p_clase, p_incremento)
-- Ejemplo: aumenta el precio de la clase EJECUTIVA del vuelo con id 10.
CALL ajustar_importe_clase_vuelo(10, 'EJECUTIVA', 250.00);
-- Verifica tarifas afectadas (usa las programaciones del vuelo 10)
SELECT tv.id_tarifa, tv.clase, tv.precio, pv.id_programacion
FROM tarifa_vuelo tv
JOIN programacion_vuelo pv ON tv.id_programacion_vuelo = pv.id_programacion
WHERE pv.id_vuelo = 10 AND tv.clase ILIKE 'EJECUTIVA';


-- actualizar_ubicacion_aviones()
CALL actualizar_ubicacion_aviones();
SELECT id_avion, modelo, id_aeropuerto
FROM avion
ORDER BY id_avion;


-- actualizar_ubicacion_pilotos()
CALL actualizar_ubicacion_pilotos();
-- Pilotos están en empleado, listamos empleados que también son pilotos:
SELECT e.id_empleado AS id_piloto, e.nombre, e.id_aeropuerto
FROM empleado e
WHERE e.id_empleado IN (SELECT id_empleado FROM piloto)
ORDER BY e.id_empleado;


-- crear_reserva_con_boleto(p_id_vuelo, p_id_tarifa, p_numero_asiento, OUT p_id_boleto_generado)
-- IMPORTANTE: ahora la tarifa debe referenciarse por id_tarifa que exista y pertenezca
-- a una programacion del vuelo. Ejemplo:
CALL crear_reserva_con_boleto(10, 25, 5, NULL);
-- Luego:
SELECT id_boleto, id_programacion_vuelo, fecha_compra, numero_asiento
FROM boleto
WHERE numero_asiento = 5
ORDER BY fecha_compra DESC
LIMIT 5;


-- reembolsar_boletos_por_vuelo(p_id_vuelo INT, OUT reembolsados INT)
CALL reembolsar_boletos_por_vuelo(11, NULL);
-- comprobar:
SELECT COUNT(*) AS boletos_restantes_v11
FROM boleto
WHERE id_programacion_vuelo IN (SELECT id_programacion FROM programacion_vuelo WHERE id_vuelo = 11);

