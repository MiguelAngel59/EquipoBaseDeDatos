-- DDL_final compacto (estado final después de aplicar script.sql)
-- Tip: ejecutar dentro de un esquema limpio o revisar existencia de constraints antes de aplicar en producción.

-- TABLA: AEROPUERTO
CREATE TABLE aeropuerto (
    id_aeropuerto           INT PRIMARY KEY,
    nombre                  VARCHAR(100) NOT NULL,
    tipo                    VARCHAR(15) NOT NULL CHECK (tipo IN ('INTERNACIONAL','NACIONAL')),
    pais                    VARCHAR(80) NOT NULL,
    ciudad                  VARCHAR(80) NOT NULL,
    codigo_iata             CHAR(3),
    CONSTRAINT uq_codigo_iata UNIQUE (codigo_iata),
    CONSTRAINT ck_codigo_iata_length CHECK (char_length(codigo_iata) = 3)
);
COMMENT ON TABLE aeropuerto IS 'Tabla que almacena la información de los aeropuertos';
COMMENT ON COLUMN aeropuerto.id_aeropuerto IS 'Identificador único del aeropuerto';
COMMENT ON COLUMN aeropuerto.codigo_iata IS 'Código IATA de 3 letras que identifica al aeropuerto';


-- TABLA: AEROLINEA
CREATE TABLE aerolinea (
    id_aerolinea            INT PRIMARY KEY,
    nombre                  VARCHAR(100) NOT NULL,
    pais_origen             VARCHAR(80) NOT NULL,
    codigo_internacional    CHAR(3) NOT NULL,
    fecha_fundacion         DATE,
    CONSTRAINT uq_codigo_internacional UNIQUE (codigo_internacional),
    CONSTRAINT chk_fecha_fundacion CHECK (fecha_fundacion <= CURRENT_DATE)
);
COMMENT ON TABLE aerolinea IS 'Tabla que almacena la información de las aerolíneas';


-- TABLA: AVION
CREATE TABLE avion (
    id_avion                INT PRIMARY KEY,
    id_aeropuerto           INT,
    id_aerolinea            INT NOT NULL,
    modelo                  VARCHAR(35) NOT NULL,
    capacidad_pasajeros     INT CHECK (capacidad_pasajeros >= 0),
    matricula               VARCHAR(20) NOT NULL,
    estado_avion            VARCHAR(20) NOT NULL,
    CONSTRAINT uq_avion_matricula UNIQUE (matricula),
    CONSTRAINT chk_estado_avion CHECK (estado_avion IN ('OPERATIVO','MANTENIMIENTO','RETIRADO')),
    CONSTRAINT fk_avion_aeropuerto FOREIGN KEY (id_aeropuerto)
        REFERENCES aeropuerto(id_aeropuerto) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_avion_aerolinea FOREIGN KEY (id_aerolinea)
        REFERENCES aerolinea(id_aerolinea) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMENT ON TABLE avion IS 'Tabla que almacena información de los aviones';


-- TABLA: TERMINAL
CREATE TABLE terminal (
    id_terminal             INT PRIMARY KEY,
    id_aeropuerto           INT NOT NULL,
    numero_terminal         INT NOT NULL,
    nombre                  VARCHAR(50),
    capacidad_aviones       INT NOT NULL CHECK (capacidad_aviones >= 0),
    CONSTRAINT uq_terminal_aeropuerto_numero UNIQUE (id_aeropuerto, numero_terminal),
    CONSTRAINT fk_terminal_aeropuerto FOREIGN KEY (id_aeropuerto)
        REFERENCES aeropuerto(id_aeropuerto) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMENT ON TABLE terminal IS 'Terminales pertenecientes a los aeropuertos';
COMMENT ON COLUMN terminal.capacidad_aviones IS 'Capacidad máxima de aviones que puede atender la terminal';


-- TABLA: PUERTA (nueva)
CREATE TABLE puerta (
    id_puerta               INT PRIMARY KEY,
    id_terminal             INT NOT NULL,
    numero_puerta           INT NOT NULL,
    codigo                  VARCHAR(10) NOT NULL,
    capacidad_publico       INT CHECK (capacidad_publico >= 0),
    CONSTRAINT fk_puerta_terminal FOREIGN KEY (id_terminal)
        REFERENCES terminal(id_terminal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_puerta_terminal_num UNIQUE (id_terminal, numero_puerta)
);
COMMENT ON TABLE puerta IS 'Puertas/gates pertenecientes a una terminal de un aeropuerto';


-- TABLA: PISTA (nueva)
CREATE TABLE pista (
    id_pista                INT PRIMARY KEY,
    id_aeropuerto           INT NOT NULL,
    codigo                  VARCHAR(10) NOT NULL,
    longitud_m              INT CHECK (longitud_m > 0),
    estado                  VARCHAR(20) NOT NULL CHECK (estado IN ('OPERATIVA','CERRADA','MANTENIMIENTO')),
    CONSTRAINT fk_pista_aero FOREIGN KEY (id_aeropuerto)
        REFERENCES aeropuerto(id_aeropuerto) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_pista_aero_codigo UNIQUE (id_aeropuerto, codigo)
);
COMMENT ON TABLE pista IS 'Pistas del aeropuerto';


-- TABLA: EMPLEADO (super-tipo)
CREATE TABLE empleado (
    id_empleado             INT PRIMARY KEY,
    id_aerolinea            INT REFERENCES aerolinea(id_aerolinea) ON DELETE CASCADE ON UPDATE CASCADE,
    id_aeropuerto           INT REFERENCES aeropuerto(id_aeropuerto) ON DELETE SET NULL ON UPDATE CASCADE,
    nombre                  VARCHAR(60) NOT NULL,
    apellido_paterno        VARCHAR(60) NOT NULL,
    apellido_materno        VARCHAR(60),
    fecha_nacimiento        DATE NOT NULL,
    nacionalidad            VARCHAR(60) NOT NULL,
    CONSTRAINT ck_empleado_edad CHECK (fecha_nacimiento <= CURRENT_DATE - INTERVAL '18 years')
);
COMMENT ON TABLE empleado IS 'Tabla de información de los empleados (super-tipo)';


-- TABLAS ESPECIALIZADAS (subtipos) que referencian empleado

-- PILOTO
CREATE TABLE piloto (
    id_empleado             INT PRIMARY KEY,
    horas_de_vuelo          INT DEFAULT 0 CHECK (horas_de_vuelo >= 0),
    CONSTRAINT fk_piloto_empleado FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMENT ON TABLE piloto IS 'Información específica de pilotos (datos laborales)';

-- CONTROLADOR
CREATE TABLE controlador (
    id_empleado             INT PRIMARY KEY,
    numero_torre_asignada   INT CHECK (numero_torre_asignada >= 0),
    licencia_controlador    VARCHAR(20) NOT NULL,
    turno                   VARCHAR(10) NOT NULL CHECK (turno IN ('Matutino','Vespertino','Nocturno')),
    CONSTRAINT fk_controlador_empleado FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMENT ON TABLE controlador IS 'Información específica de controladores de tráfico aéreo';

-- SOBRECARGO
CREATE TABLE sobrecargo (
    id_empleado             INT PRIMARY KEY,
    años_experiencia        INT CHECK (años_experiencia >= 0),
    CONSTRAINT fk_sobrecargo_empleado FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMENT ON TABLE sobrecargo IS 'Información específica de sobrecargos / auxiliares de vuelo';

-- TECNICO
CREATE TABLE tecnico (
    id_empleado             INT PRIMARY KEY,
    especialidad            VARCHAR(30) NOT NULL,
    CONSTRAINT fk_tecnico_empleado FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMENT ON TABLE tecnico IS 'Información específica de técnicos de mantenimiento aeronáutico';

-- INGENIERO
CREATE TABLE ingeniero (
    id_empleado             INT PRIMARY KEY,
    rama                    VARCHAR(50) NOT NULL,
    grado_estudio           VARCHAR(20),
    CONSTRAINT fk_ingeniero_empleado FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMENT ON TABLE ingeniero IS 'Información específica de ingenieros aeronáuticos';

-- ATENCION AL PASAJERO
CREATE TABLE atencionalpasajero (
    id_empleado             INT PRIMARY KEY,
    puesto                  VARCHAR(30) NOT NULL,
    CONSTRAINT fk_atencionalpasajero_empleado FOREIGN KEY (id_empleado)
        REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMENT ON TABLE atencionalpasajero IS 'Información de empleados de atención al pasajero';


-- TABLA: LICENCIA_PILOTO (nueva)
CREATE TABLE licencia_piloto (
    id_licencia             INT PRIMARY KEY,
    id_piloto               INT NOT NULL,
    tipo_licencia           VARCHAR(5) NOT NULL,
    numero_licencia         VARCHAR(50) NOT NULL,
    fecha_emision           DATE NOT NULL,
    fecha_vencimiento       DATE NOT NULL,
    autoridad_emisora       VARCHAR(80),
    CONSTRAINT fk_licencia_piloto_piloto FOREIGN KEY (id_piloto)
        REFERENCES piloto(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_tipo_licencia CHECK (tipo_licencia IN ('ATPL','CPL','PPL'))
);
COMMENT ON TABLE licencia_piloto IS 'Licencias de pilotos';


-- TABLA: VUELO (redefinida; la programación se movió a programacion_vuelo)
CREATE TABLE vuelo (
    id_vuelo                INT PRIMARY KEY,
    origen                  INT NOT NULL,
    destino                 INT NOT NULL,
    estado                  VARCHAR(20) NOT NULL CHECK (estado IN ('PROGRAMADO','EN_VUELO','CANCELADO','FINALIZADO')),
    tipo_vuelo              VARCHAR(20) NOT NULL CHECK (tipo_vuelo IN ('CARGA','COMERCIAL','PRIVADO')),
    codigo_vuelo            VARCHAR(10) NOT NULL UNIQUE,
    tiempo_salida           TIMESTAMP,
    tiempo_llegada          TIMESTAMP,
    CONSTRAINT fk_origen_vuelo FOREIGN KEY (origen)
        REFERENCES aeropuerto(id_aeropuerto) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_destino_vuelo FOREIGN KEY (destino)
        REFERENCES aeropuerto(id_aeropuerto) ON DELETE CASCADE ON UPDATE CASCADE
);
COMMENT ON TABLE vuelo IS 'Tabla que almacena los vuelos (datos de ruta y estado). Programaciones y asignaciones -> programacion_vuelo';


-- TABLA: PROGRAMACION_VUELO (nueva)
CREATE TABLE programacion_vuelo (
    id_programacion         INT PRIMARY KEY,
    id_vuelo                INT NOT NULL,
    id_avion                INT NOT NULL,
    id_piloto               INT NOT NULL,
    id_puerta               INT,
    etd                     TIMESTAMP NOT NULL,
    eta                     TIMESTAMP NOT NULL,
    CONSTRAINT chk_etd_eta CHECK (eta > etd),
    CONSTRAINT fk_programacion_vuelo_vuelo FOREIGN KEY (id_vuelo)
        REFERENCES vuelo(id_vuelo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_programacion_vuelo_avion FOREIGN KEY (id_avion)
        REFERENCES avion(id_avion) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_programacion_vuelo_piloto FOREIGN KEY (id_piloto)
        REFERENCES piloto(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_programacion_vuelo_puerta FOREIGN KEY (id_puerta)
        REFERENCES puerta(id_puerta) ON DELETE SET NULL ON UPDATE CASCADE
);
COMMENT ON TABLE programacion_vuelo IS 'Programación / plan de un vuelo: recursos y horarios asignados';


-- TABLA: TARIFA_VUELO (modificada para referenciar programacion_vuelo)
CREATE TABLE tarifa_vuelo (
    id_tarifa               INT PRIMARY KEY,
    id_programacion_vuelo   INT NOT NULL,
    precio                  NUMERIC(12,2) NOT NULL CHECK (precio >= 0),
    clase                   VARCHAR(20) NOT NULL CHECK (clase IN ('ECONOMICA','EJECUTIVA','PREMIUM')),
    CONSTRAINT fk_tarifa_programacion FOREIGN KEY (id_programacion_vuelo)
        REFERENCES programacion_vuelo(id_programacion) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_tarifa_programacion_clase UNIQUE (id_programacion_vuelo, clase)
);
COMMENT ON TABLE tarifa_vuelo IS 'Tarifas asociadas a una programación de vuelo';


-- TABLA: BOLETO (ahora referencia programacion_vuelo)
CREATE TABLE boleto (
    id_boleto               INT PRIMARY KEY,
    id_programacion_vuelo   INT NOT NULL,
    fecha_compra            DATE NOT NULL,
    numero_asiento          INT NOT NULL CHECK (numero_asiento > 0),
    CONSTRAINT fk_boleto_programacion FOREIGN KEY (id_programacion_vuelo)
        REFERENCES programacion_vuelo(id_programacion) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_boleto_prog_asiento UNIQUE (id_programacion_vuelo, numero_asiento)
);
COMMENT ON TABLE boleto IS 'Boletos vendidos asociados a una programación de vuelo';
