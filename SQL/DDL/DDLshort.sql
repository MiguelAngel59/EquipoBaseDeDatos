
-- TABLA: AEROPUERTO
CREATE TABLE aeropuerto (
    id_aeropuerto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(15) NOT NULL CHECK (tipo IN ('INTERNACIONAL', 'NACIONAL')),
    pais VARCHAR(80) NOT NULL,
    ciudad VARCHAR(80) NOT NULL,
    codigo_iata CHAR(3) UNIQUE
);
COMMENT ON TABLE aeropuerto IS 'Tabla que almacena la información de los aeropuertos';



-- TABLA: TERMINAL
CREATE TABLE terminal (
    id_terminal SERIAL PRIMARY KEY,
    id_aeropuerto INT NOT NULL REFERENCES aeropuerto(id_aeropuerto),
    numero_terminal INT NOT NULL,
    nombre VARCHAR(50),
    capacidad_aviones INT CHECK (capacidad_aviones >= 0),

    UNIQUE (id_aeropuerto, numero_terminal)
);
OMMENT ON TABLE terminal IS 'Terminales pertenecientes a los aeropuertos';



CREATE TABLE puerta (
    id_puerta SERIAL PRIMARY KEY,
    id_terminal INT NOT NULL REFERENCES terminal(id_terminal),
    numero_puerta INT NOT NULL,
    codigo VARCHAR(10) NOT NULL,
    capacidad_publico INT CHECK (capacidad_publico >= 0),

    UNIQUE (id_terminal, numero_puerta)
);
COMMENT ON TABLE puerta IS 'Puertas/gates pertenecientes a una terminal de un aeropuerto';



-- PISTA
CREATE TABLE pista (
    id_pista SERIAL PRIMARY KEY,
    id_aeropuerto INT NOT NULL REFERENCES aeropuerto(id_aeropuerto),
    codigo VARCHAR(10) NOT NULL,
    longitud_m INT CHECK (longitud_m > 0),
    estado VARCHAR(20) NOT NULL CHECK (estado IN ('OPERATIVA', 'CERRADA', 'MANTENIMIENTO')),

    UNIQUE (id_aeropuerto, codigo)
);
COMMENT ON TABLE pista IS 'Pistas del aeropuerto';


-- TABLA: AEROLÍNEA
CREATE TABLE aerolinea (
    id_aerolinea SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais_origen VARCHAR(80) NOT NULL,
    codigo_internacional CHAR(3) NOT NULL UNIQUE,
    fecha_fundacion DATE CHECK (fecha_fundacion <= CURRENT_DATE)
);
COMMENT ON TABLE aerolinea IS 'Información de las aerolíneas';


-- TABLA: AVIÓN
CREATE TABLE avion (
    id_avion SERIAL PRIMARY KEY,
    id_aerolinea INT NOT NULL REFERENCES aerolinea(id_aerolinea),
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto), -- ubicación actual cuando está en tierra (nullable)
    matricula VARCHAR(20) UNIQUE NOT NULL,
    modelo VARCHAR(35) NOT NULL,
    estado_avion VARCHAR(20) NOT NULL DEFAULT 'OPERATIVO', -- OPERATIVO, MANTENIMIENTO, RETIRADO
    capacidad_pasajeros INT CHECK (capacidad_pasajeros >= 0)
);
COMMENT ON TABLE avion IS 'Información de los aviones';


-- TABLA: EMPLEADO
CREATE TABLE empleado (
    id_empleado SERIAL PRIMARY KEY,
    id_aerolinea INT REFERENCES aerolinea(id_aerolinea),
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto),
    nombre VARCHAR(60) NOT NULL,
    apellido_paterno VARCHAR(60) NOT NULL,
    apellido_materno VARCHAR(60),
    fecha_nacimiento DATE NOT NULL,
    nacionalidad VARCHAR(60) NOT NULL,
    tipo_empleado VARCHAR(30) NOT NULL -- 'PILOTO','SOBRECARGO','CONTROLADOR','TECNICO','ATENCION','INGENIERO'
);
COMMENT ON TABLE empleado IS 'Supertipo para empleados';

-- TABLAS DE EMPLEADOS
CREATE TABLE piloto (
    id_empleado INT PRIMARY KEY REFERENCES empleado(id_empleado) ON DELETE CASCADE,
    horas_vuelo INT CHECK (horas_vuelo >= 0)
);
COMMENT ON TABLE piloto IS 'Pilotos';


CREATE TABLE controlador (
    id_empleado INT PRIMARY KEY REFERENCES empleado(id_empleado) ON DELETE CASCADE,
    numero_torre_asignada INT,
    licencia_controlador VARCHAR(20) NOT NULL,
    turno VARCHAR(10)
);
COMMENT ON TABLE controlador IS 'Controladores';

CREATE TABLE sobrecargo (
    id_empleado INT PRIMARY KEY REFERENCES empleado(id_empleado) ON DELETE CASCADE,
    anos_experiencia INT CHECK (anos_experiencia >= 0)
);
COMMENT ON TABLE sobrecargo IS 'Sobrecargos';

CREATE TABLE tecnico (
    id_empleado INT PRIMARY KEY REFERENCES empleado(id_empleado) ON DELETE CASCADE,
    especialidad VARCHAR(50)
);
COMMENT ON TABLE tecnico IS 'Técnicos';

CREATE TABLE ingeniero (
    id_empleado INT PRIMARY KEY REFERENCES empleado(id_empleado) ON DELETE CASCADE,
    rama VARCHAR(50) NOT NULL,
    grado_estudio VARCHAR(50)
);
COMMENT ON TABLE ingeniero IS 'Ingenieros';

CREATE TABLE atencion_pasajero (
    id_empleado INT PRIMARY KEY REFERENCES empleado(id_empleado) ON DELETE CASCADE,
    puesto VARCHAR(50)
);
COMMENT ON TABLE atencion_pasajero IS 'Atención a pasajeros';

-- LICENCIAS de piloto
CREATE TABLE licencia_piloto (
    id_licencia SERIAL PRIMARY KEY,
    id_piloto INT NOT NULL REFERENCES piloto(id_empleado) ON DELETE CASCADE,
    tipo_licencia VARCHAR(50) NOT NULL, -- p.e. ATPL, CPL, HabilitacionA320
    numero_licencia VARCHAR(50) NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    autoridad_emisora VARCHAR(80)
);

-- TABLA: VUELO
CREATE TABLE vuelo (
    id_vuelo SERIAL PRIMARY KEY,
    codigo_vuelo VARCHAR(10) NOT NULL UNIQUE,
    id_aerolinea INT NOT NULL REFERENCES aerolinea(id_aerolinea),
    origen INT NOT NULL REFERENCES aeropuerto(id_aeropuerto),
    destino INT NOT NULL REFERENCES aeropuerto(id_aeropuerto),
    tipo VARCHAR(20) NOT NULL,  -- comercial, internacional, privado, etc.
    estado VARCHAR(20) NOT NULL, -- programado, en vuelo, completado, cancelado
    salida TIMESTAMP,
    llegada TIMESTAMP
);

CREATE TABLE programacion_vuelo (
    id_programacion SERIAL PRIMARY KEY,
    id_vuelo INT NOT NULL REFERENCES vuelo(id_vuelo),
    id_avion INT NOT NULL REFERENCES avion(id_avion),
    id_piloto INT NOT NULL REFERENCES piloto(id_empleado),
    id_puerta INT NOT NULL REFERENCES puerta(id_puerta),
    etd TIMESTAMP NOT NULL,
    eta TIMESTAMP NOT NULL,
    CHECK (eta > etd)
    FOREIGN KEY (numero_terminal, numero_puerta)
        REFERENCES puerta(numero_terminal, numero_puerta)
);

-- TABLA: TARIFA_VUELO
CREATE TABLE tarifa_vuelo (
    id_tarifa INT PRIMARY KEY,
    id_vuelo INT REFERENCES vuelo(id_vuelo),
    precio NUMERIC(12,2) NOT NULL CHECK (precio >= 0),
    clase VARCHAR(20) NOT NULL
);
COMMENT ON TABLE tarifa_vuelo IS 'Tarifas asociadas a los vuelos';


-- TABLA: BOLETO
CREATE TABLE boleto (
    id_boleto SERIAL PRIMARY KEY,
    id_vuelo INT REFERENCES vuelo(id_vuelo),
    id_tarifa INT REFERENCES tarifa_vuelo(id_tarifa),
    fecha_compra DATE NOT NULL,
    numero_asiento INT NOT NULL CHECK (numero_asiento > 0)
);
COMMENT ON TABLE boleto IS 'Boletos vendidos asociados a vuelos y tarifas';
