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


-- contar_vuelos_por_aeropuerto(p_id_aeropuerto, p_fecha)
-- Ejemplo: Cuenta cuántos vuelos salen de cada aeropuerto en una fecha determinada (en este caso, hoy, puede pasar que no haya ningún vuelo el día que se pruebe).

SELECT 
    ap.id_aeropuerto,
    ap.nombre AS aeropuerto,
    contar_vuelos_por_aeropuerto(ap.id_aeropuerto, CURRENT_DATE) AS vuelos_salida_hoy
FROM aeropuerto ap
ORDER BY vuelos_salida_hoy DESC;

--duracion_vuelo_minutos(p_id_vuelo INT)
--Calcula la duración de cada vuelo (en minutos) a partir de las horas de salida (etd) y llegada (eta).

SELECT 
    v.id_vuelo,
    v.origen,
    v.destino,
    v.etd,
    v.eta,
    duracion_vuelo_minutos(v.id_vuelo) AS duracion_minutos
FROM vuelo v
ORDER BY duracion_minutos DESC NULLS LAST;

--tarifa_minima_por_vuelo(p_id_vuelo INT)
--Devuelve la tarifa mínima disponible para cada vuelo.

SELECT 
    v.id_vuelo,
    a.modelo AS avion,
    tarifa_minima_por_vuelo(v.id_vuelo) AS tarifa_minima_general
FROM vuelo v
JOIN avion a ON v.id_avion = a.id_avion
ORDER BY tarifa_minima_general ASC;










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
SELECT id_avion, modelo, id_aeropuerto
FROM avion
ORDER BY id_avion;


-- actualizar_ubicacion_pilotos()
-- Ejemplo: actualiza la ubicación de los pilotos según sus vuelos.
CALL actualizar_ubicacion_pilotos();
-- Consulta para verificar resultado
SELECT id_empleado AS id_piloto, nombre, id_aeropuerto
FROM piloto
ORDER BY id_empleado;


--crear_reserva_con_boleto(p_id_vuelo, p_id_tarifa, p_numero_asiento, OUT p_id_boleto_generado)
--Ejemplo: crea una reserva/boleto para el vuelo 10, tarifa 1000 y asiento 5.
CALL crear_reserva_con_boleto(10, 25, 5, NULL);
SELECT id_boleto, id_vuelo, id_tarifa, fecha_compra, numero_asiento
FROM boleto
WHERE id_vuelo = 10 AND numero_asiento = 5;

--reembolsar_boletos_por_vuelo(p_id_vuelo INT, OUT reembolsados INT)
--Ejemplo: Elimina todos los boletos asociados al vuelo 11 (simula un reembolso masivo).

CALL reembolsar_boletos_por_vuelo(11, NULL);
SELECT COUNT(*) AS boletos_restantes_v11 FROM boleto WHERE id_vuelo = 11;
