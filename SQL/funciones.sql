-- FUNCIONES


-- Función: Calcula el porcentaje de ocupación de un vuelo (boletos vendidos / capacidad del avión).
-- Útil para monitorear rendimiento de vuelos y ocupación.
-- Tablas involucradas: vuelo, avion, boleto
CREATE OR REPLACE FUNCTION porcentaje_ocupacion_vuelo(p_id_vuelo INT)
RETURNS NUMERIC(5,2) AS $$
DECLARE
    boletos_vendidos INT;
    capacidad_avion INT;
    porcentaje NUMERIC(5,2);
BEGIN
    SELECT COUNT(*) INTO boletos_vendidos
    FROM boleto
    WHERE id_vuelo = p_id_vuelo;

    SELECT a.capacidad_pasajeros
    INTO capacidad_avion
    FROM avion a
    JOIN vuelo v ON a.id_avion = v.id_avion
    WHERE v.id_vuelo = p_id_vuelo;

    IF capacidad_avion = 0 OR capacidad_avion IS NULL THEN
        RETURN 0;
    END IF;

    porcentaje := ROUND((boletos_vendidos::NUMERIC / capacidad_avion) * 100, 2);
    RETURN porcentaje;
END;
$$ LANGUAGE plpgsql;


-- Función: Devuelve el número de vuelos actualmente en estado 'PROGRAMADO' o 'EN_VUELO' de una aerolínea.
-- Útil para ver cuántos vuelos están activos o representan una actividad operacional por aerolínea.
-- Tablas involucradas: vuelo, avion, aerolinea
CREATE OR REPLACE FUNCTION vuelos_activos_aerolinea(p_id_aerolinea INT)
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*)
    INTO total
    FROM vuelo v
    JOIN avion a ON v.id_avion = a.id_avion
    WHERE a.id_aerolinea = p_id_aerolinea
      AND v.estado IN ('PROGRAMADO', 'EN_VUELO');

    RETURN COALESCE(total, 0);
END;
$$ LANGUAGE plpgsql;


-- Función: Calcula los ingresos totales generados por todos los vuelos que parten desde un aeropuerto.
-- Tablas involucradas: aeropuerto, vuelo, boleto, tarifa_vuelo
CREATE OR REPLACE FUNCTION total_ingresos_aeropuerto(p_id_aeropuerto INT)
RETURNS NUMERIC(12,2) AS $$
DECLARE
    ingresos NUMERIC(12,2);
BEGIN
    SELECT SUM(tv.precio)
    INTO ingresos
    FROM vuelo v
    JOIN boleto b ON v.id_vuelo = b.id_vuelo
    JOIN tarifa_vuelo tv ON b.id_tarifa = tv.id_tarifa
    WHERE v.origen = p_id_aeropuerto;

    RETURN COALESCE(ingresos, 0);
END;
$$ LANGUAGE plpgsql;


-- Función: Cuenta cuántos vuelos salen de un aeropuerto en una fecha específica.
-- Útil para generar reportes de tráfico aéreo o medir la actividad diaria por aeropuerto.
-- Tablas involucradas: vuelo
CREATE OR REPLACE FUNCTION contar_vuelos_por_aeropuerto(p_id_aeropuerto INT, p_fecha DATE)
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*) INTO total
    FROM vuelo
    WHERE origen = p_id_aeropuerto
      AND DATE(etd) = p_fecha;

    RETURN COALESCE(total, 0);
END;
$$ LANGUAGE plpgsql;



-- Función: Calcula la duración estimada de un vuelo en minutos.
-- Útil para mostrar tiempos de vuelo en reportes.
-- Tablas involucradas: vuelo
CREATE OR REPLACE FUNCTION duracion_vuelo_minutos(p_id_vuelo INT)
RETURNS INT AS $$
DECLARE
    duracion INTERVAL;
BEGIN
    SELECT eta - etd INTO duracion FROM vuelo WHERE id_vuelo = p_id_vuelo;
    IF duracion IS NULL THEN
        RETURN NULL;
    END IF;
    RETURN (EXTRACT(EPOCH FROM duracion)::INT / 60);
END;
$$ LANGUAGE plpgsql;




-- Función: Devuelve la tarifa mínima disponible para un vuelo, de forma general o filtrada por clase.
-- Útil para mostrar precios más bajos disponibles.
-- Tablas involucradas: tarifa_vuelo
CREATE OR REPLACE FUNCTION tarifa_minima_por_vuelo(p_id_vuelo INT, p_clase VARCHAR DEFAULT NULL)
RETURNS NUMERIC AS $$
DECLARE
    min_precio NUMERIC;
BEGIN
    IF p_clase IS NULL THEN
        SELECT MIN(precio) INTO min_precio FROM tarifa_vuelo WHERE id_vuelo = p_id_vuelo;
    ELSE
        SELECT MIN(precio) INTO min_precio FROM tarifa_vuelo WHERE id_vuelo = p_id_vuelo AND UPPER(clase) = UPPER(p_clase);
    END IF;
    RETURN COALESCE(min_precio, 0);
END;
$$ LANGUAGE plpgsql;




