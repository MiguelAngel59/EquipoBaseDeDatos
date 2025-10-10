CREATE TABLE aeropuerto (
    id_aeropuerto INT,
    nombre VARCHAR(70),
    tipo VARCHAR(20),
    capacidad_terminales INT,
    pais VARCHAR(50),
    ciudad VARCHAR(50)
);

ALTER TABLE aeropuerto
    ADD CONSTRAINT pk_aeropuerto PRIMARY KEY (id_aeropuerto);

ALTER TABLE aeropuerto
    ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE aeropuerto
    ALTER COLUMN tipo SET NOT NULL;

ALTER TABLE aeropuerto
    ALTER COLUMN pais SET NOT NULL;

ALTER TABLE aeropuerto
    ALTER COLUMN ciudad SET NOT NULL;

ALTER TABLE aeropuerto
    ADD CONSTRAINT chk_tipo_aeropuerto
    CHECK (tipo IN ('INTERNACIONAL', 'NACIONAL'));

ALTER TABLE aeropuerto
    ADD CONSTRAINT chk_capacidad_terminales
    CHECK (capacidad_terminales >= 0);

COMMENT ON TABLE aeropuerto IS 'Tabla que almacena la información de los aeropuertos';
COMMENT ON COLUMN aeropuerto.id_aeropuerto IS 'Identificador único del aeropuerto';
COMMENT ON COLUMN aeropuerto.nombre IS 'Nombre oficial del aeropuerto';
COMMENT ON COLUMN aeropuerto.tipo IS 'Tipo de Aeropuerto (NACIONAL o INTERNACIONAL)';
COMMENT ON COLUMN aeropuerto.capacidad_terminales IS 'Número de terminales del aeropuerto';
COMMENT ON COLUMN aeropuerto.pais IS 'País donde se ubica el aeropuerto';
COMMENT ON COLUMN aeropuerto.ciudad IS 'Ciudad donde se ubica el aeropuerto';


CREATE TABLE aerolinea (
    id_aerolinea INT,
    nombre VARCHAR(70),
    pais_origen VARCHAR(50),
    codigo_internacional VARCHAR(5),
    fecha_fundacion DATE
);

ALTER TABLE aerolinea
    ADD CONSTRAINT pk_aerolinea PRIMARY KEY (id_aerolinea);

ALTER TABLE aerolinea
    ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE aerolinea
    ALTER COLUMN pais_origen SET NOT NULL;

ALTER TABLE aerolinea
    ALTER COLUMN codigo_internacional SET NOT NULL;

ALTER TABLE aerolinea
    ADD CONSTRAINT uq_codigo_internacional UNIQUE (codigo_internacional);

ALTER TABLE aerolinea
    ADD CONSTRAINT chk_fecha_fundacion
    CHECK (fecha_fundacion <= CURRENT_DATE);

COMMENT ON TABLE aerolinea IS 'Tabla que almacena la información de las aerolíneas';
COMMENT ON COLUMN aerolinea.id_aerolinea IS 'Identificador único de la aerolínea';
COMMENT ON COLUMN aerolinea.nombre IS 'Nombre de la aerolínea';
COMMENT ON COLUMN aerolinea.pais_origen IS 'País de origen de la aerolínea';
COMMENT ON COLUMN aerolinea.codigo_internacional IS 'Código internacional de la aerolínea (IATA o ICAO)';
COMMENT ON COLUMN aerolinea.fecha_fundacion IS 'Fecha de la fundación de la aerolínea';


CREATE TABLE avion (
    id_avion INT,
    id_aeropuerto INT,
    id_aerolinea INT,
    modelo VARCHAR(20),
    capacidad INT
);

ALTER TABLE avion
    ADD CONSTRAINT pk_avion PRIMARY KEY (id_avion);

ALTER TABLE avion
    ADD CONSTRAINT fk_aeropuerto FOREIGN KEY (id_aeropuerto)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE avion
    ADD CONSTRAINT fk_aerolinea FOREIGN KEY (id_aerolinea)
    REFERENCES aerolinea(id_aerolinea);

ALTER TABLE avion
    ALTER COLUMN id_aerolinea SET NOT NULL;

ALTER TABLE avion
    ALTER COLUMN modelo SET NOT NULL;

ALTER TABLE avion
    ADD CONSTRAINT chk_capacidad_avion
    CHECK (capacidad >= 0);

COMMENT ON TABLE avion IS 'Tabla que almacena la información de los aviones';
COMMENT ON COLUMN avion.id_avion IS 'Identificador único del avión';
COMMENT ON COLUMN avion.id_aeropuerto IS 'Referencia al aeropuerto donde se encuentra el avión';
COMMENT ON COLUMN avion.id_aerolinea IS 'Referencia a la aerolínea propietaria del avión';
COMMENT ON COLUMN avion.modelo IS 'Modelo del avión';
COMMENT ON COLUMN avion.capacidad IS 'Capacidad del avión';


CREATE TABLE piloto (
    id_piloto INT,
    id_aeropuerto INT,
    id_aerolinea INT,
    licencia VARCHAR(20),
    nacionalidad VARCHAR(50),
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    fecha_de_nacimiento DATE
);

ALTER TABLE piloto
    ADD CONSTRAINT pk_piloto PRIMARY KEY (id_piloto);

ALTER TABLE piloto
    ADD CONSTRAINT fk_aeropuerto_piloto FOREIGN KEY (id_aeropuerto)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE piloto
    ADD CONSTRAINT fk_aerolinea_piloto FOREIGN KEY (id_aerolinea)
    REFERENCES aerolinea(id_aerolinea);

ALTER TABLE piloto
    ALTER COLUMN id_aerolinea SET NOT NULL;

ALTER TABLE piloto
    ALTER COLUMN licencia SET NOT NULL;

ALTER TABLE piloto
    ALTER COLUMN nacionalidad SET NOT NULL;

ALTER TABLE piloto
    ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE piloto
    ALTER COLUMN apellido_paterno SET NOT NULL;

ALTER TABLE piloto
    ALTER COLUMN fecha_de_nacimiento SET NOT NULL;

COMMENT ON TABLE piloto IS 'Tabla que almacena la información de los pilotos';
COMMENT ON COLUMN piloto.id_piloto IS 'Identificador único del piloto';
COMMENT ON COLUMN piloto.id_aeropuerto IS 'Aeropuerto base del piloto';
COMMENT ON COLUMN piloto.id_aerolinea IS 'Aerolínea a la que pertenece el piloto';
COMMENT ON COLUMN piloto.licencia IS 'Número de licencia del piloto';
COMMENT ON COLUMN piloto.nacionalidad IS 'Nacionalidad del piloto';
COMMENT ON COLUMN piloto.nombre IS 'Nombre del piloto';
COMMENT ON COLUMN piloto.apellido_paterno IS 'Apellido paterno del piloto';
COMMENT ON COLUMN piloto.apellido_materno IS 'Apellido materno del piloto';
COMMENT ON COLUMN piloto.fecha_de_nacimiento IS 'Fecha de nacimiento del piloto';


CREATE TABLE vuelo (
    id_vuelo INT,
    id_avion INT,
    id_piloto INT,
    id_origen INT,
    id_destino INT,
    estado VARCHAR(20),
    etd DATE,
    eta DATE,
    precio DOUBLE PRECISION
);

ALTER TABLE vuelo
    ADD CONSTRAINT pk_vuelo PRIMARY KEY (id_vuelo);

ALTER TABLE vuelo
    ADD CONSTRAINT fk_avion_vuelo FOREIGN KEY (id_avion)
    REFERENCES avion(id_avion);

ALTER TABLE vuelo
    ADD CONSTRAINT fk_piloto_vuelo FOREIGN KEY (id_piloto)
    REFERENCES piloto(id_piloto);

ALTER TABLE vuelo
    ADD CONSTRAINT fk_origen_vuelo FOREIGN KEY (id_origen)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE vuelo
    ADD CONSTRAINT fk_destino_vuelo FOREIGN KEY (id_destino)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE vuelo
    ALTER COLUMN id_avion SET NOT NULL;

ALTER TABLE vuelo
    ALTER COLUMN id_piloto SET NOT NULL;

ALTER TABLE vuelo
    ALTER COLUMN id_origen SET NOT NULL;

ALTER TABLE vuelo
    ALTER COLUMN id_destino SET NOT NULL;

ALTER TABLE vuelo
    ALTER COLUMN estado SET NOT NULL;

ALTER TABLE vuelo
    ALTER COLUMN etd SET NOT NULL;

ALTER TABLE vuelo
    ALTER COLUMN eta SET NOT NULL;

ALTER TABLE vuelo
    ADD CONSTRAINT chk_estado_vuelo
    CHECK (estado IN ('PROGRAMADO', 'EN_VUELO', 'CANCELADO', 'FINALIZADO'));

ALTER TABLE vuelo
    ADD CONSTRAINT chk_precio_vuelo
    CHECK (precio >= 0);

ALTER TABLE vuelo
    ADD CONSTRAINT chk_tiempo_vuelo
    CHECK (eta > etd);

COMMENT ON TABLE vuelo IS 'Tabla que almacena los registros de los vuelos programados';
COMMENT ON COLUMN vuelo.id_vuelo IS 'Identificador único del vuelo';
COMMENT ON COLUMN vuelo.id_avion IS 'Referencia al avión asignado al vuelo';
COMMENT ON COLUMN vuelo.id_piloto IS 'Referencia al piloto asignado al vuelo';
COMMENT ON COLUMN vuelo.id_origen IS 'Aeropuerto de origen del vuelo';
COMMENT ON COLUMN vuelo.id_destino IS 'Aeropuerto de destino del vuelo';
COMMENT ON COLUMN vuelo.estado IS 'Estado actual del vuelo (PROGRAMADO, EN_VUELO, CANCELADO, FINALIZADO)';
COMMENT ON COLUMN vuelo.etd IS 'Hora estimada de salida (Estimated Time of Departure)';
COMMENT ON COLUMN vuelo.eta IS 'Hora estimada de llegada (Estimated Time of Arrival)';
COMMENT ON COLUMN vuelo.precio IS 'Precio del boleto para el vuelo';
