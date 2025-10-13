-- ===========================================
-- TABLA: AEROPUERTO
-- ===========================================
CREATE TABLE aeropuerto (
    id_aeropuerto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(15) NOT NULL CHECK (tipo IN ('INTERNACIONAL', 'NACIONAL')),
    pais VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    codigo_iata VARCHAR(3) UNIQUE
);
COMMENT ON TABLE aeropuerto IS 'Tabla que almacena la información de los aeropuertos';

-- ===========================================
-- TABLA: TERMINAL
-- ===========================================
CREATE TABLE terminal (
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto),
    numero_terminal INT,
    capacidadd_aviones INT CHECK (capacidadd_aviones >= 0),
    capacidadd_publico INT CHECK (capacidadd_publico >= 0),
    PRIMARY KEY (id_aeropuerto, numero_terminal)
);
COMMENT ON TABLE terminal IS 'Terminales pertenecientes a los aeropuertos';

-- ===========================================
-- TABLA: AEROLÍNEA
-- ===========================================
CREATE TABLE aerolinea (
    id_aerolinea INT PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    pais_origen VARCHAR(50) NOT NULL,
    codigo_internacional VARCHAR(3) NOT NULL UNIQUE,
    fecha_fundacion DATE CHECK (fecha_fundacion <= CURRENT_DATE)
);
COMMENT ON TABLE aerolinea IS 'Información de las aerolíneas';

-- ===========================================
-- TABLA: AVIÓN
-- ===========================================
CREATE TABLE avion (
    id_avion INT PRIMARY KEY,
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto),
    id_aerolinea INT NOT NULL REFERENCES aerolinea(id_aerolinea),
    modelo VARCHAR(35) NOT NULL,
    capacidad_pasajeros INT CHECK (capacidad_pasajeros >= 0)
);
COMMENT ON TABLE avion IS 'Información de los aviones';

-- ===========================================
-- TABLAS DE EMPLEADOS (estructura similar)
-- ===========================================
CREATE TABLE piloto (
    id_empleado INT PRIMARY KEY,
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto),
    id_aerolinea INT NOT NULL REFERENCES aerolinea(id_aerolinea),
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50),
    fecha_de_nacimiento DATE NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    licencia VARCHAR(20) NOT NULL,
    tipo_licencia VARCHAR(20) NOT NULL,
    esta_certificado BOOLEAN NOT NULL,
    horas_de_vuelo INT CHECK (horas_de_vuelo >= 0)
);

CREATE TABLE controlador (
    id_empleado INT PRIMARY KEY,
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto),
    id_aerolinea INT NOT NULL REFERENCES aerolinea(id_aerolinea),
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50),
    fecha_de_nacimiento DATE NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    numero_torre_asignada INT CHECK (numero_torre_asignada >= 0),
    licencia_controlador VARCHAR(20) NOT NULL,
    turno VARCHAR(10)
);

CREATE TABLE sobrecargo (
    id_empleado INT PRIMARY KEY,
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto),
    id_aerolinea INT NOT NULL REFERENCES aerolinea(id_aerolinea),
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50),
    fecha_de_nacimiento DATE NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    años_experiencia INT CHECK (años_experiencia >= 0)
);

CREATE TABLE tecnico (
    id_empleado INT PRIMARY KEY,
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto),
    id_aerolinea INT NOT NULL REFERENCES aerolinea(id_aerolinea),
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50),
    fecha_de_nacimiento DATE NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    especialidad VARCHAR(30) NOT NULL
);

CREATE TABLE atencionalpasajero (
    id_empleado INT PRIMARY KEY,
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto),
    id_aerolinea INT NOT NULL REFERENCES aerolinea(id_aerolinea),
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50),
    fecha_de_nacimiento DATE NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    puesto VARCHAR(30) NOT NULL
);

CREATE TABLE ingeniero (
    id_empleado INT PRIMARY KEY,
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto),
    id_aerolinea INT NOT NULL REFERENCES aerolinea(id_aerolinea),
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50),
    fecha_de_nacimiento DATE NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    rama VARCHAR(50) NOT NULL,
    grado_estudio VARCHAR(20)
);

-- ===========================================
-- TABLA: VUELO
-- ===========================================
CREATE TABLE vuelo (
    id_vuelo INT PRIMARY KEY,
    id_avion INT NOT NULL REFERENCES avion(id_avion),
    piloto INT NOT NULL REFERENCES piloto(id_empleado),
    origen INT NOT NULL REFERENCES aeropuerto(id_aeropuerto),
    destino INT NOT NULL REFERENCES aeropuerto(id_aeropuerto),
    estado VARCHAR(20) NOT NULL CHECK (estado IN ('PROGRAMADO','EN_VUELO','CANCELADO','FINALIZADO')),
    etd TIMESTAMP NOT NULL,
    eta TIMESTAMP NOT NULL CHECK (eta > etd),
    tipo_vuelo VARCHAR(20) NOT NULL CHECK (tipo_vuelo IN ('CARGA','COMERCIAL'))
);
COMMENT ON TABLE vuelo IS 'Registros de vuelos en el sistema';

-- ===========================================
-- TABLA: TARIFA_VUELO
-- ===========================================
CREATE TABLE tarifa_vuelo (
    id_tarifa INT PRIMARY KEY,
    id_vuelo INT REFERENCES vuelo(id_vuelo),
    precio DOUBLE PRECISION NOT NULL CHECK (precio >= 0),
    clase VARCHAR(20) NOT NULL
);
COMMENT ON TABLE tarifa_vuelo IS 'Tarifas asociadas a los vuelos';

-- ===========================================
-- TABLA: BOLETO
-- ===========================================
CREATE TABLE boleto (
    id_boleto SERIAL PRIMARY KEY,
    id_vuelo INT REFERENCES vuelo(id_vuelo),
    id_tarifa INT REFERENCES tarifa_vuelo(id_tarifa),
    fecha_compra DATE NOT NULL,
    numero_asiento INT NOT NULL CHECK (numero_asiento > 0)
);
COMMENT ON TABLE boleto IS 'Boletos vendidos asociados a vuelos y tarifas';
