-- FUNCIONES


-- Función: Calcula el porcentaje de ocupación de un vuelo (boletos vendidos / capacidad del avión).
-- Útil para monitorear rendimiento de vuelos y ocupación.
-- Tablas involucradas: vuelo, avion, boleto
CREATE FUNCTION porcentaje_ocupacion_vuelo(p_id_vuelo INT)
RETURNS NUMERIC(5,2) AS $$
DECLARE
    total_boletos   INT := 0;
    total_capacidad BIGINT := 0; -- sum de capacidades (puede ser mayor a INT si hay muchas prog.)
    porcentaje      NUMERIC(5,2) := 0;
BEGIN
    -- contar boletos vendidos para todas las programaciones de este vuelo
    SELECT COALESCE(SUM(cnt),0) INTO total_boletos
    FROM (
        SELECT COUNT(*) AS cnt
        FROM boleto b
        JOIN programacion_vuelo pv ON b.id_programacion_vuelo = pv.id_programacion
        WHERE pv.id_vuelo = p_id_vuelo
        GROUP BY pv.id_programacion
    ) s;

    -- sumar capacidad de los aviones asignados a las programaciones de este vuelo
    SELECT COALESCE(SUM(a.capacidad_pasajeros),0) INTO total_capacidad
    FROM programacion_vuelo pv
    JOIN avion a ON pv.id_avion = a.id_avion
    WHERE pv.id_vuelo = p_id_vuelo;

    IF total_capacidad IS NULL OR total_capacidad = 0 THEN
        RETURN 0;
    END IF;

    porcentaje := ROUND((total_boletos::NUMERIC / total_capacidad::NUMERIC) * 100, 2);
    RETURN porcentaje;
END;
$$ LANGUAGE plpgsql;


-- Función: Devuelve el número de vuelos actualmente en estado 'PROGRAMADO' o 'EN_VUELO' de una aerolínea.
-- Útil para ver cuántos vuelos están activos o representan una actividad operacional por aerolínea.
-- Tablas involucradas: vuelo, avion, aerolinea
CREATE FUNCTION vuelos_activos_aerolinea(p_id_aerolinea INT)
RETURNS INT AS $$
DECLARE
    total INT := 0;
BEGIN
    SELECT COUNT(DISTINCT pv.id_vuelo) INTO total
    FROM programacion_vuelo pv
    JOIN avion a ON pv.id_avion = a.id_avion
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE a.id_aerolinea = p_id_aerolinea
      AND v.estado IN ('PROGRAMADO','EN_VUELO');

    RETURN COALESCE(total, 0);
END;
$$ LANGUAGE plpgsql;


-- Función: Calcula los ingresos totales generados por todos los vuelos que parten desde un aeropuerto.
-- Tablas involucradas: aeropuerto, vuelo, boleto, tarifa_vuelo
CREATE FUNCTION total_ingresos_aeropuerto(p_id_aeropuerto INT)
RETURNS NUMERIC(12,2) AS $$
DECLARE
    ingresos NUMERIC(12,2);
BEGIN
    SELECT COALESCE(SUM(tv.precio),0)::NUMERIC(12,2) INTO ingresos
    FROM boleto b
    JOIN tarifa_vuelo tv ON b.id_programacion_vuelo = tv.id_programacion_vuelo
    JOIN programacion_vuelo pv ON b.id_programacion_vuelo = pv.id_programacion
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE v.origen = p_id_aeropuerto;

    RETURN ingresos;
END;
$$ LANGUAGE plpgsql;


-- Función: Cuenta cuántos vuelos salen de un aeropuerto en una fecha específica.
-- Útil para generar reportes de tráfico aéreo o medir la actividad diaria por aeropuerto.
-- Tablas involucradas: vuelo
CREATE FUNCTION contar_vuelos_por_aeropuerto(p_id_aeropuerto INT, p_fecha DATE)
RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*) INTO total
    FROM programacion_vuelo pv
    JOIN vuelo v ON pv.id_vuelo = v.id_vuelo
    WHERE v.origen = p_id_aeropuerto
      AND DATE(pv.etd) = p_fecha;

    RETURN COALESCE(total, 0);
END;
$$ LANGUAGE plpgsql;



-- Función: Calcula la duración estimada de un vuelo en minutos.
-- Útil para mostrar tiempos de vuelo en reportes.
-- Tablas involucradas: vuelo
CREATE FUNCTION duracion_vuelo_minutos(p_id_vuelo INT)
RETURNS INT AS $$
DECLARE
    duracion INTERVAL;
BEGIN
    SELECT (pv.eta - pv.etd) INTO duracion
    FROM programacion_vuelo pv
    WHERE pv.id_vuelo = p_id_vuelo
    ORDER BY pv.etd DESC
    LIMIT 1;

    IF duracion IS NULL THEN
        RETURN NULL;
    END IF;

    RETURN (EXTRACT(EPOCH FROM duracion)::INT / 60);
END;
$$ LANGUAGE plpgsql;




-- Función: Devuelve la tarifa mínima disponible para un vuelo, de forma general o filtrada por clase.
-- Útil para mostrar precios más bajos disponibles.
-- Tablas involucradas: tarifa_vuelo
CREATE FUNCTION tarifa_minima_por_vuelo(p_id_vuelo INT, p_clase VARCHAR DEFAULT NULL)
RETURNS NUMERIC AS $$
DECLARE
    min_precio NUMERIC;
BEGIN
    IF p_clase IS NULL THEN
        SELECT MIN(tv.precio) INTO min_precio
        FROM tarifa_vuelo tv
        JOIN programacion_vuelo pv ON tv.id_programacion_vuelo = pv.id_programacion
        WHERE pv.id_vuelo = p_id_vuelo;
    ELSE
        SELECT MIN(tv.precio) INTO min_precio
        FROM tarifa_vuelo tv
        JOIN programacion_vuelo pv ON tv.id_programacion_vuelo = pv.id_programacion
        WHERE pv.id_vuelo = p_id_vuelo
          AND UPPER(tv.clase) = UPPER(p_clase);
    END IF;

    RETURN COALESCE(min_precio, 0);
END;
$$ LANGUAGE plpgsql;




