-- Script de actualización de la base de datos
------------------------------------------------------------------

-- TABLA: AEROPUERTO
-- aumentar longitud de pais y ciudad
ALTER TABLE aeropuerto
    ALTER COLUMN pais TYPE VARCHAR(80),
    ALTER COLUMN ciudad TYPE VARCHAR(80);

-- cambiar codigo_iata a CHAR(3) (mantener unique y check longitud)
ALTER TABLE aeropuerto
    ALTER COLUMN codigo_iata TYPE CHAR(3);

-- reajustar para mantener las constraint
ALTER TABLE aeropuerto
    DROP CONSTRAINT IF EXISTS uq_codigo_iata;
ALTER TABLE aeropuerto
    ADD CONSTRAINT uq_codigo_iata UNIQUE (codigo_iata);

ALTER TABLE aeropuerto
    DROP CONSTRAINT IF EXISTS ck_codigo_iata_length;
ALTER TABLE aeropuerto
    ADD CONSTRAINT ck_codigo_iata_length CHECK (char_length(codigo_iata) = 3);



-- TABLA: TERMINAL
-- añadir id_terminal
ALTER TABLE terminal
    ADD COLUMN IF NOT EXISTS id_terminal INT;
-- añadir columna nombre
ALTER TABLE terminal
    ADD COLUMN IF NOT EXISTS nombre VARCHAR(50);

-- renombrar columnas con nombre erróneo
ALTER TABLE terminal
    RENAME COLUMN capacidadd_aviones TO capacidad_aviones;

-- quitar columna capacidadd_aviones columna nombre
ALTER TABLE terminal
	DROP COLUMN IF EXISTS capacidadd_publico;

ALTER TABLE terminal
    ALTER COLUMN id_aeropuerto SET NOT NULL,
    ALTER COLUMN numero_terminal SET NOT NULL;


-- preservar CHECK para capacidad_aviones >= 0
ALTER TABLE terminal
    DROP CONSTRAINT IF EXISTS chk_capacidad_aviones;
ALTER TABLE terminal
    ADD CONSTRAINT chk_capacidad_aviones CHECK (capacidad_aviones >= 0);

-- eliminar PK compuesto antiguo y reemplazar por id_terminal PK
ALTER TABLE terminal
    DROP CONSTRAINT IF EXISTS pk_terminal;
ALTER TABLE terminal
    ADD CONSTRAINT pk_terminal PRIMARY KEY (id_terminal);

-- Asegurar unique (id_aeropuerto, numero_terminal)
ALTER TABLE terminal
    ADD CONSTRAINT uq_terminal_aeropuerto_numero UNIQUE (id_aeropuerto, numero_terminal);

COMMENT ON COLUMN terminal.id_terminal IS 'Identificador de la terminal';
COMMENT ON COLUMN terminal.capacidad_aviones IS 'Capacidad máxima de aviones que puede atender la terminal';
COMMENT ON COLUMN terminal.nombre IS 'Nombre de la terminal (si aplica)';


-- TABLA: PUERTA (nueva)
CREATE TABLE IF NOT EXISTS puerta (
    id_puerta INT PRIMARY KEY,
    id_terminal INT NOT NULL,
    numero_puerta INT NOT NULL,
    codigo VARCHAR(10) NOT NULL,
    capacidad_publico INT,
    CONSTRAINT fk_puerta_terminal FOREIGN KEY (id_terminal)
        REFERENCES terminal(id_terminal) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uq_puerta_terminal_num UNIQUE (id_terminal, numero_puerta),
    CONSTRAINT chk_capacidad_publico_puerta CHECK (capacidad_publico >= 0)
);

COMMENT ON TABLE puerta IS 'Puertas/gates pertenecientes a una terminal de un aeropuerto';
COMMENT ON COLUMN puerta.id_puerta IS 'Identificador de la puerta';
COMMENT ON COLUMN puerta.id_terminal IS 'Terminal a la que pertenece la puerta';
COMMENT ON COLUMN puerta.numero_puerta IS 'Número de puerta dentro de la terminal';
COMMENT ON COLUMN puerta.codigo IS 'Código/identificador de la puerta';
COMMENT ON COLUMN puerta.capacidad_publico IS 'Capacidad máxima de público que puede recibir la puerta';



-- TABLA: PISTA (nueva)
CREATE TABLE IF NOT EXISTS pista (
    id_pista INT PRIMARY KEY,
    id_aeropuerto INT NOT NULL,
    codigo VARCHAR(10) NOT NULL,
    longitud_m INT,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT fk_pista_aero FOREIGN KEY (id_aeropuerto) REFERENCES aeropuerto(id_aeropuerto)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_longitud_pista CHECK (longitud_m > 0),
    CONSTRAINT chk_estado_pista CHECK (estado IN ('OPERATIVA', 'CERRADA', 'MANTENIMIENTO')),
    CONSTRAINT uq_pista_aero_codigo UNIQUE (id_aeropuerto, codigo)
);

COMMENT ON TABLE pista IS 'Pistas del aeropuerto';
COMMENT ON COLUMN pista.id_pista IS 'Identificador de la pista';
COMMENT ON COLUMN pista.id_aeropuerto IS 'Referencia al aeropuerto que contiene a la pista';
COMMENT ON COLUMN pista.codigo IS 'Códio de nombramiento de la pista, preferiblemente usar OACI';
COMMENT ON COLUMN pista.longitud_m IS 'Longitud de la pista en metros';
COMMENT ON COLUMN pista.estado IS 'Estado de la pista (OPERATIVA, CERRADA, MANTENIMIENTO)';


-- TABLA: AEROLINEA 
-- Ajustar tamaño de campos y tipo de codigo_internacional a CHAR(3)
ALTER TABLE aerolinea
    ALTER COLUMN nombre TYPE VARCHAR(100),
    ALTER COLUMN pais_origen TYPE VARCHAR(80),
    ALTER COLUMN codigo_internacional TYPE CHAR(3);


-- TABLA: AVION
-- Añadir columna matricula y estado_avion 
ALTER TABLE avion
    ADD COLUMN IF NOT EXISTS matricula VARCHAR(20);

ALTER TABLE avion
    ADD COLUMN IF NOT EXISTS estado_avion VARCHAR(20);

ALTER TABLE avion
    ALTER COLUMN matricula SET NOT NULL;

ALTER TABLE avion
    ADD CONSTRAINT uq_avion_matricula UNIQUE (matricula);

ALTER TABLE avion
    ALTER COLUMN estado_avion SET NOT NULL;

ALTER TABLE avion
    ADD CONSTRAINT chk_estado_avion
    CHECK (estado_avion IN ('OPERATIVO', 'MANTENIMIENTO', 'RETIRADO'));

COMMENT ON COLUMN avion.matricula IS 'Matrícula única del avión';
COMMENT ON COLUMN avion.estado_avion IS 'Estado del avión (OPERATIVO, MANTENIMIENTO, RETIRADO.)';


-- TABLA: EMPLEADO (nueva tabla supettipo)

-- Crear la tabla nueva empleado y modificar las tablas especializadas existentes para referenciarla
-- y eliminar columnas personales duplicadas.

-- (a) Crear tabla empleado
CREATE TABLE IF NOT EXISTS empleado (
    id_empleado INT PRIMARY KEY,
    id_aerolinea INT REFERENCES aerolinea(id_aerolinea) ON DELETE CASCADE ON UPDATE CASCADE,
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto) ON DELETE SET NULL ON UPDATE CASCADE,
    nombre VARCHAR(60) NOT NULL,
    apellido_paterno VARCHAR(60) NOT NULL,
    apellido_materno VARCHAR(60),
    fecha_nacimiento DATE NOT NULL,
    nacionalidad VARCHAR(60) NOT NULL
);

ALTER TABLE empleado
    ADD CONSTRAINT ck_empleado_edad CHECK (fecha_nacimiento <= CURRENT_DATE - INTERVAL '18 years');

COMMENT ON TABLE empleado IS 'Tabla de información de los empleados';
COMMENT ON COLUMN empleado.id_empleado IS 'Identificador único del empleado';
COMMENT ON COLUMN empleado.id_aeropuerto IS 'Aeropuerto donde se encuentra asignado actualmente el empledo';
COMMENT ON COLUMN empleado.id_aerolinea IS 'Aerolínea a la que pertenece el empleado';
COMMENT ON COLUMN empleado.nombre IS 'Nombre del empleado';
COMMENT ON COLUMN empleado.apellido_paterno IS 'Apellido paterno del empleado';
COMMENT ON COLUMN empleado.apellido_materno IS 'Apellido materno del empleado';
COMMENT ON COLUMN empleado.fecha_nacimiento IS 'Fecha de nacimiento del empleado';
COMMENT ON COLUMN empleado.nacionalidad IS 'Nacionalidad del empleado';

-- Ajustar las tablas especializadas

-- TABLA: PILOTO
-- Quitar columnas duplicadas que ahora están en empleado
ALTER TABLE piloto
    DROP COLUMN IF EXISTS id_aerolinea,
    DROP COLUMN IF EXISTS id_aeropuerto,
    DROP COLUMN IF EXISTS nombre,
    DROP COLUMN IF EXISTS apellido_paterno,
    DROP COLUMN IF EXISTS apellido_materno,
    DROP COLUMN IF EXISTS fecha_de_nacimiento,
    DROP COLUMN IF EXISTS nacionalidad,

-- Quitar columnas en dehuso por cambio estructural
    DROP COLUMN IF EXISTS licencia,
    DROP COLUMN IF EXISTS tipo_licencia,
    DROP COLUMN IF EXISTS esta_certificado;

ALTER TABLE piloto
    ADD CONSTRAINT fk_piloto_empleado FOREIGN KEY (id_empleado)
    REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE;

-- TABLA: CONTROLADOR
-- Quitar columnas duplicadas que ahora están en empleado
ALTER TABLE controlador
    DROP COLUMN IF EXISTS id_aerolinea,
    DROP COLUMN IF EXISTS id_aeropuerto,
    DROP COLUMN IF EXISTS nombre,
    DROP COLUMN IF EXISTS apellido_paterno,
    DROP COLUMN IF EXISTS apellido_materno,
    DROP COLUMN IF EXISTS fecha_de_nacimiento,
    DROP COLUMN IF EXISTS nacionalidad;

ALTER TABLE controlador
    ADD CONSTRAINT fk_controlador_empleado FOREIGN KEY (id_empleado)
    REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE;


-- TABLA: SOBRECARGOADOR
ALTER TABLE sobrecargo
    DROP COLUMN IF EXISTS id_aerolinea,
    DROP COLUMN IF EXISTS id_aeropuerto,
    DROP COLUMN IF EXISTS nombre,
    DROP COLUMN IF EXISTS apellido_paterno,
    DROP COLUMN IF EXISTS apellido_materno,
    DROP COLUMN IF EXISTS fecha_de_nacimiento,
    DROP COLUMN IF EXISTS nacionalidad;

ALTER TABLE sobrecargo
    ADD CONSTRAINT fk_sobrecargo_empleado FOREIGN KEY (id_empleado)
    REFERENCES empleado(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE;


-- TABLA: TECNICO
ALTER TABLE tecnico
    DROP COLUMN IF EXISTS id_aerolinea,
    DROP COLUMN IF EXISTS id_aeropuerto,
    DROP COLUMN IF EXISTS nombre,
    DROP COLUMN IF EXISTS apellido_paterno,
    DROP COLUMN IF EXISTS apellido_materno,
    DROP COLUMN IF EXISTS fecha_de_nacimiento,
    DROP COLUMN IF EXISTS nacionalidad;

ALTER TABLE tecnico
    ADD CONSTRAINT fk_tecnico_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
    ON DELETE CASCADE ON UPDATE CASCADE;

-- TABLA: INGENIERO
ALTER TABLE ingeniero
    DROP COLUMN IF EXISTS id_aerolinea,
    DROP COLUMN IF EXISTS id_aeropuerto,
    DROP COLUMN IF EXISTS nombre,
    DROP COLUMN IF EXISTS apellido_paterno,
    DROP COLUMN IF EXISTS apellido_materno,
    DROP COLUMN IF EXISTS fecha_de_nacimiento,
    DROP COLUMN IF EXISTS nacionalidad;

ALTER TABLE ingeniero
    ADD CONSTRAINT fk_ingeniero_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
    ON DELETE CASCADE ON UPDATE CASCADE;

-- TABLA: ATENCIONALPASAJERO
ALTER TABLE atencionalpasajero 
    DROP COLUMN IF EXISTS id_aerolinea,
    DROP COLUMN IF EXISTS id_aeropuerto,
    DROP COLUMN IF EXISTS nombre,
    DROP COLUMN IF EXISTS apellido_paterno,
    DROP COLUMN IF EXISTS apellido_materno,
    DROP COLUMN IF EXISTS fecha_de_nacimiento,
    DROP COLUMN IF EXISTS nacionalidad;

ALTER TABLE atencionalpasajero 
    ADD CONSTRAINT fk_atencionalpasajero_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
    ON DELETE CASCADE ON UPDATE CASCADE;


-- TABLA: LICENCIA_PILOTO (nueva tabla para almacenar las licencias de los pilotos)
CREATE TABLE IF NOT EXISTS licencia_piloto (
    id_licencia INT PRIMARY KEY,
    id_piloto INT NOT NULL,
    tipo_licencia VARCHAR(5) NOT NULL,
    numero_licencia VARCHAR(50) NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    autoridad_emisora VARCHAR(80),
    CONSTRAINT fk_licencia_piloto_piloto FOREIGN KEY (id_piloto)
        REFERENCES piloto(id_empleado) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE licencia_piloto
    ADD CONSTRAINT chk_tipo_licencia
    CHECK (tipo_licencia IN ('ATPL', 'CPL', 'PPL'));

COMMENT ON TABLE licencia_piloto IS 'Licencias de pilotos';
COMMENT ON COLUMN licencia_piloto.id_licencia IS 'Identificador único de la licencia de piloto';
COMMENT ON COLUMN licencia_piloto.id_piloto IS 'Identificador del piloto al que pertenece la licencia (FK a piloto.id_empleado)';
COMMENT ON COLUMN licencia_piloto.tipo_licencia IS 'Tipo de licencia otorgada (ATPL (Airline Transport Pilot), CPL (Commercial Pilot), PPL (Private Pilot))';
COMMENT ON COLUMN licencia_piloto.numero_licencia IS 'Número oficial de la licencia emitida por la autoridad competente';
COMMENT ON COLUMN licencia_piloto.fecha_emision IS 'Fecha en que la licencia fue emitida';
COMMENT ON COLUMN licencia_piloto.fecha_vencimiento IS 'Fecha en que la licencia expira y debe renovarse';
COMMENT ON COLUMN licencia_piloto.autoridad_emisora IS 'Nombre de la autoridad que emitió la licencia (ej. DGAC, FAA, EASA)';


-- La estrucutra de almacenamiento de la información de los vuelos se reestructuró

-- TABLA: VUELO
ALTER TABLE vuelo
  DROP COLUMN id_avion,
  DROP COLUMN piloto,
  DROP COLUMN etd,
  DROP COLUMN eta;

ALTER TABLE vuelo
    ADD COLUMN IF NOT EXISTS codigo_vuelo VARCHAR(10);

ALTER TABLE vuelo
    ADD COLUMN IF NOT EXISTS tiempo_salida TIMESTAMP;

ALTER TABLE vuelo
    ADD COLUMN IF NOT EXISTS tiempo_llegada TIMESTAMP;

ALTER TABLE vuelo
    ALTER COLUMN codigo_vuelo SET NOT NULL;
ALTER TABLE vuelo
    ADD CONSTRAINT uq_codigo_vuelo UNIQUE (codigo_vuelo);

COMMENT ON COLUMN vuelo.codigo_vuelo IS 'Codigo de clave de nombramiento de vuelo';
COMMENT ON COLUMN vuelo.tiempo_salida IS 'Tiempo exacto en el que se regitra la salida del avion del aeropuerto de origen';
COMMENT ON COLUMN vuelo.tiempo_llegada IS 'Tiempo exacto en el que se regitra la lleada del avion del aeropuerto de destino';

-- TABLA: PROGRAMACION_VUELO 
CREATE TABLE IF NOT EXISTS programacion_vuelo (
    id_programacion INT PRIMARY KEY,
    id_vuelo INT NOT NULL,
    id_avion INT NOT NULL,
    id_piloto INT NOT NULL,
    id_puerta INT,
    etd TIMESTAMP NOT NULL,
    eta TIMESTAMP NOT NULL
);

ALTER TABLE programacion_vuelo
    ADD CONSTRAINT chk_etd_eta
    CHECK (eta > etd);

ALTER TABLE programacion_vuelo
    ADD CONSTRAINT fk_programacion_vuelo_vuelo FOREIGN KEY (id_vuelo) REFERENCES vuelo(id_vuelo)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE programacion_vuelo
    ADD CONSTRAINT fk_programacion_vuelo_avion FOREIGN KEY (id_avion) REFERENCES avion(id_avion)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE programacion_vuelo
    ADD CONSTRAINT fk_programacion_vuelo_piloto FOREIGN KEY (id_piloto) REFERENCES piloto(id_empleado)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE programacion_vuelo
    ADD CONSTRAINT fk_programacion_vuelo_puerta FOREIGN KEY (id_puerta) REFERENCES puerta(id_puerta)
    ON DELETE SET NULL ON UPDATE CASCADE;

COMMENT ON TABLE programacion_vuelo IS 'Muestra información de la programación o plan de vuelo de un vuelo, indica los recursos y horarios estimados asignados';
COMMENT ON COLUMN programacion_vuelo.id_programacion IS 'Identificador único de la programación de vuelo';
COMMENT ON COLUMN programacion_vuelo.id_vuelo IS 'Referencia al vuelo al que corresponde el programa o plan de vuelo';
COMMENT ON COLUMN programacion_vuelo.id_avion IS 'Referencia al avión asignado a la programación';
COMMENT ON COLUMN programacion_vuelo.id_piloto IS 'Referencia al piloto asignado a la programación';
COMMENT ON COLUMN programacion_vuelo.id_puerta IS 'Referencia a la puerta de embarque asignada, puede ser NULL por logica real)';
COMMENT ON COLUMN programacion_vuelo.etd IS 'Horario estimado de salida (Estimated Time of Departure) del vuelo programado';
COMMENT ON COLUMN programacion_vuelo.eta IS 'Horario estimado de llegada (Estimated Time of Arrival) del vuelo programado';

-- TABLA: TARIFA_VUELO
ALTER TABLE tarifa_vuelo
    DROP CONSTRAINT IF EXISTS fk_tarifa_vuelo;
ALTER TABLE tarifa_vuelo
    DROP COLUMN id_vuelo;

ALTER TABLE tarifa_vuelo
    ADD COLUMN IF NOT EXISTS id_programacion_vuelo INT;

ALTER TABLE tarifa_vuelo
    ALTER COLUMN id_programacion_vuelo SET NOT NULL;

ALTER TABLE tarifa_vuelo
    ALTER COLUMN precio TYPE NUMERIC(12,2) USING precio::NUMERIC(12,2);

ALTER TABLE tarifa_vuelo
    ADD CONSTRAINT fk_tarifa_programacion FOREIGN KEY (id_programacion_vuelo) REFERENCES programacion_vuelo(id_programacion)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tarifa_vuelo
    ADD CONSTRAINT uq_tarifa_programacion_clase UNIQUE (id_programacion_vuelo, clase);

COMMENT ON COLUMN tarifa_vuelo.id_programacion_vuelo IS 'Referencia a programacion_vuelo';



-- TABLA: BOLETO
ALTER TABLE boleto
    DROP COLUMN IF EXISTS id_vuelo;

ALTER TABLE boleto
    ADD COLUMN IF NOT EXISTS id_programacion_vuelo INT;

ALTER TABLE boleto
    ALTER COLUMN id_programacion_vuelo SET NOT NULL;

ALTER TABLE boleto
    ADD CONSTRAINT fk_boleto_programacion FOREIGN KEY (id_programacion_vuelo) REFERENCES programacion_vuelo(id_programacion)
    ON DELETE CASCADE ON UPDATE CASCADE;

-- UNIQUE (id_programacion_vuelo, numero_asiento)
ALTER TABLE boleto
    ADD CONSTRAINT uq_boleto_prog_asiento UNIQUE (id_programacion_vuelo, numero_asiento);

COMMENT ON COLUMN boleto.id_programacion_vuelo IS 'Programación del vuelo a la que pertenece este boleto';
