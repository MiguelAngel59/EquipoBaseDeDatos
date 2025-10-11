CREATE TABLE aeropuerto (
    id_aeropuerto INT,
    nombre VARCHAR(100),
    tipo VARCHAR(15),
    pais VARCHAR(50),
    ciudad VARCHAR(50),
    codigo_iata VARCHAR(3)
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
    ADD CONSTRAINT uq_codigo_iata UNIQUE (codigo_iata);

ALTER TABLE aeropuerto
    ADD CONSTRAINT chk_tipo_aeropuerto
    CHECK (tipo IN ('INTERNACIONAL', 'NACIONAL'));

COMMENT ON TABLE aeropuerto IS 'Tabla que almacena la información de los aeropuertos';
COMMENT ON COLUMN aeropuerto.id_aeropuerto IS 'Identificador único del aeropuerto';
COMMENT ON COLUMN aeropuerto.nombre IS 'Nombre oficial del aeropuerto';
COMMENT ON COLUMN aeropuerto.tipo IS 'Tipo de Aeropuerto (NACIONAL o INTERNACIONAL)';
COMMENT ON COLUMN aeropuerto.pais IS 'País donde se ubica el aeropuerto';
COMMENT ON COLUMN aeropuerto.ciudad IS 'Ciudad donde se ubica el aeropuerto';
COMMENT ON COLUMN aeropuerto.codigo_iata IS 'Código IATA de 3 letras que identifica al aeropuerto';



CREATE TABLE terminal (
    id_aeropuerto INT,
    numero_terminal INT,
    capacidadd_aviones INT,
    capacidadd_publico INT
);

ALTER TABLE terminal
    ADD CONSTRAINT pk_terminal PRIMARY KEY (id_aeropuerto, numero_terminal);

ALTER TABLE terminal
    ADD CONSTRAINT fk_terminal_aeropuerto FOREIGN KEY (id_aeropuerto)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE terminal
    ADD CONSTRAINT chk_capacidad_aviones CHECK (capacidadd_aviones >= 0);

ALTER TABLE terminal
    ADD CONSTRAINT chk_capacidad_publico CHECK (capacidadd_publico >= 0);

COMMENT ON TABLE terminal IS 'Terminales pertenecientes a los aeropuertos';
COMMENT ON COLUMN terminal.id_aeropuerto IS 'Aeropuerto al que pertenece la terminal';
COMMENT ON COLUMN terminal.numero_terminal IS 'Número de terminal dentro del aeropuerto';
COMMENT ON COLUMN terminal.capacidadd_aviones IS 'Capacidad máxima de aviones que puede atender la terminal';
COMMENT ON COLUMN terminal.capacidadd_publico IS 'Capacidad máxima de público que puede recibir la terminal';



CREATE TABLE aerolinea (
    id_aerolinea INT,
    nombre VARCHAR(70),
    pais_origen VARCHAR(50),
    codigo_internacional VARCHAR(3),
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
    ADD CONSTRAINT chk_fecha_fundacion CHECK (fecha_fundacion <= CURRENT_DATE);

COMMENT ON TABLE aerolinea IS 'Tabla que almacena la información de las aerolíneas';
COMMENT ON COLUMN aerolinea.id_aerolinea IS 'Identificador único de la aerolínea';
COMMENT ON COLUMN aerolinea.nombre IS 'Nombre de la aerolínea';
COMMENT ON COLUMN aerolinea.pais_origen IS 'País de origen de la aerolínea';
COMMENT ON COLUMN aerolinea.codigo_internacional IS 'Código internacional de la aerolínea (IATA/ICAO)';
COMMENT ON COLUMN aerolinea.fecha_fundacion IS 'Fecha de fundación de la aerolínea';



CREATE TABLE avion (
    id_avion INT,
    id_aeropuerto INT,
    id_aerolinea INT,
    modelo VARCHAR(35),
    capacidad_pasajeros INT
);

ALTER TABLE avion
    ADD CONSTRAINT pk_avion PRIMARY KEY (id_avion);

ALTER TABLE avion
    ADD CONSTRAINT fk_avion_aeropuerto FOREIGN KEY (id_aeropuerto)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE avion
    ADD CONSTRAINT fk_avion_aerolinea FOREIGN KEY (id_aerolinea)
    REFERENCES aerolinea(id_aerolinea);

ALTER TABLE avion
    ALTER COLUMN id_aerolinea SET NOT NULL;

ALTER TABLE avion
    ALTER COLUMN modelo SET NOT NULL;

ALTER TABLE avion
    ADD CONSTRAINT chk_capacidad_pasajeros CHECK (capacidad_pasajeros >= 0);

COMMENT ON TABLE avion IS 'Tabla que almacena información de los aviones';
COMMENT ON COLUMN avion.id_avion IS 'Identificador único del avión';
COMMENT ON COLUMN avion.id_aeropuerto IS 'Aeropuerto en el que se encuentra estacionado';
COMMENT ON COLUMN avion.id_aerolinea IS 'Aerolínea propietaria del avión';
COMMENT ON COLUMN avion.modelo IS 'Modelo del avión';
COMMENT ON COLUMN avion.capacidad_pasajeros IS 'Capacidad máxima de pasajeros';



CREATE TABLE piloto (
    id_empleado INT,
    id_aeropuerto INT,
    id_aerolinea INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    fecha_de_nacimiento DATE,
    nacionalidad VARCHAR(50),
    licencia VARCHAR(20),
    tipo_licencia VARCHAR(20),
    esta_certificado BOOLEAN,
    horas_de_vuelo INT
);

ALTER TABLE piloto
    ADD CONSTRAINT pk_piloto PRIMARY KEY (id_empleado);

ALTER TABLE piloto
    ADD CONSTRAINT fk_piloto_aeropuerto FOREIGN KEY (id_aeropuerto)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE piloto
    ADD CONSTRAINT fk_piloto_aerolinea FOREIGN KEY (id_aerolinea)
    REFERENCES aerolinea(id_aerolinea);

ALTER TABLE piloto
    ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE piloto
    ALTER COLUMN apellido_paterno SET NOT NULL;

ALTER TABLE piloto
    ALTER COLUMN fecha_de_nacimiento SET NOT NULL;

ALTER TABLE piloto
    ALTER COLUMN id_aerolinea SET NOT NULL;

ALTER TABLE piloto
    ALTER COLUMN licencia SET NOT NULL;

ALTER TABLE piloto
    ALTER COLUMN tipo_licencia SET NOT NULL;

ALTER TABLE piloto
    ALTER COLUMN esta_certificado SET NOT NULL;

ALTER TABLE piloto
    ALTER COLUMN nacionalidad SET NOT NULL;

ALTER TABLE piloto
    ADD CONSTRAINT chk_horas_vuelo CHECK (horas_de_vuelo >= 0);

COMMENT ON TABLE piloto IS 'Tabla de información de los pilotos';
COMMENT ON COLUMN piloto.id_empleado IS 'Identificador único del piloto';
COMMENT ON COLUMN piloto.id_aeropuerto IS 'Aeropuerto base del piloto';
COMMENT ON COLUMN piloto.id_aerolinea IS 'Aerolínea a la que pertenece el piloto';
COMMENT ON COLUMN piloto.nombre IS 'Nombre del piloto';
COMMENT ON COLUMN piloto.apellido_paterno IS 'Apellido paterno del piloto';
COMMENT ON COLUMN piloto.apellido_materno IS 'Apellido materno del piloto';
COMMENT ON COLUMN piloto.fecha_de_nacimiento IS 'Fecha de nacimiento del piloto';
COMMENT ON COLUMN piloto.nacionalidad IS 'Nacionalidad del piloto';
COMMENT ON COLUMN piloto.licencia IS 'Número de licencia del piloto';
COMMENT ON COLUMN piloto.tipo_licencia IS 'Tipo de licencia otorgada al piloto';
COMMENT ON COLUMN piloto.esta_certificado IS 'Indica si el piloto está certificado';
COMMENT ON COLUMN piloto.horas_de_vuelo IS 'Total de horas de vuelo acumuladas';



CREATE TABLE controlador (
    id_empleado INT,
    id_aeropuerto INT,
    id_aerolinea INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    fecha_de_nacimiento DATE,
    nacionalidad VARCHAR(50),
    numero_torre_asignada INTEGER,
    licencia_controlador VARCHAR(20),
    turno VARCHAR(10)
);

ALTER TABLE controlador
    ADD CONSTRAINT pk_controlador PRIMARY KEY (id_empleado);

ALTER TABLE controlador
    ADD CONSTRAINT fk_controlador_aeropuerto FOREIGN KEY (id_aeropuerto)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE controlador
    ADD CONSTRAINT fk_controlador_aerolinea FOREIGN KEY (id_aerolinea)
    REFERENCES aerolinea(id_aerolinea);

ALTER TABLE controlador
    ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE controlador
    ALTER COLUMN apellido_paterno SET NOT NULL;

ALTER TABLE controlador
    ALTER COLUMN fecha_de_nacimiento SET NOT NULL;

ALTER TABLE controlador
    ALTER COLUMN nacionalidad SET NOT NULL;

ALTER TABLE controlador
    ALTER COLUMN id_aerolinea SET NOT NULL;

ALTER TABLE controlador
    ALTER COLUMN licencia_controlador SET NOT NULL;

ALTER TABLE controlador
    ADD CONSTRAINT chk_numero_torre CHECK (numero_torre_asignada >= 0);

COMMENT ON TABLE controlador IS 'Tabla de información de los controladores de tráfico aéreo';
COMMENT ON COLUMN controlador.id_empleado IS 'Identificador único del controlador';
COMMENT ON COLUMN controlador.id_aeropuerto IS 'Aeropuerto donde labora el controlador';
COMMENT ON COLUMN controlador.id_aerolinea IS 'Aerolínea a la que pertenece el controlador';
COMMENT ON COLUMN controlador.nombre IS 'Nombre del controlador';
COMMENT ON COLUMN controlador.apellido_paterno IS 'Apellido paterno del controlador';
COMMENT ON COLUMN controlador.apellido_materno IS 'Apellido materno del controlador';
COMMENT ON COLUMN controlador.fecha_de_nacimiento IS 'Fecha de nacimiento del controlador';
COMMENT ON COLUMN controlador.nacionalidad IS 'Nacionalidad del controlador';
COMMENT ON COLUMN controlador.numero_torre_asignada IS 'Número de torre asignada al controlador';
COMMENT ON COLUMN controlador.licencia_controlador IS 'Número de licencia del controlador aéreo';
COMMENT ON COLUMN controlador.turno IS 'Turno de trabajo del controlador (matutino, vespertino, nocturno)';



CREATE TABLE sobrecargo (
    id_empleado INT,
    id_aeropuerto INT,
    id_aerolinea INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    fecha_de_nacimiento DATE,
    nacionalidad VARCHAR(50),
    años_experiencia INTEGER
);

ALTER TABLE sobrecargo
    ADD CONSTRAINT pk_sobrecargo PRIMARY KEY (id_empleado);

ALTER TABLE sobrecargo
    ADD CONSTRAINT fk_sobrecargo_aeropuerto FOREIGN KEY (id_aeropuerto)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE sobrecargo
    ADD CONSTRAINT fk_sobrecargo_aerolinea FOREIGN KEY (id_aerolinea)
    REFERENCES aerolinea(id_aerolinea);

ALTER TABLE sobrecargo
    ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE sobrecargo
    ALTER COLUMN apellido_paterno SET NOT NULL;

ALTER TABLE sobrecargo
    ALTER COLUMN fecha_de_nacimiento SET NOT NULL;

ALTER TABLE sobrecargo
    ALTER COLUMN nacionalidad SET NOT NULL;

ALTER TABLE sobrecargo
    ALTER COLUMN id_aerolinea SET NOT NULL;

ALTER TABLE sobrecargo
    ADD CONSTRAINT chk_anios_experiencia CHECK (años_experiencia >= 0);

COMMENT ON TABLE sobrecargo IS 'Tabla de información de los sobrecargos o auxiliares de vuelo';
COMMENT ON COLUMN sobrecargo.id_empleado IS 'Identificador único del sobrecargo';
COMMENT ON COLUMN sobrecargo.id_aeropuerto IS 'Aeropuerto donde está asignado el sobrecargo';
COMMENT ON COLUMN sobrecargo.id_aerolinea IS 'Aerolínea a la que pertenece el sobrecargo';
COMMENT ON COLUMN sobrecargo.nombre IS 'Nombre del sobrecargo';
COMMENT ON COLUMN sobrecargo.apellido_paterno IS 'Apellido paterno del sobrecargo';
COMMENT ON COLUMN sobrecargo.apellido_materno IS 'Apellido materno del sobrecargo';
COMMENT ON COLUMN sobrecargo.fecha_de_nacimiento IS 'Fecha de nacimiento del sobrecargo';
COMMENT ON COLUMN sobrecargo.nacionalidad IS 'Nacionalidad del sobrecargo';
COMMENT ON COLUMN sobrecargo.años_experiencia IS 'Años de experiencia acumulados como sobrecargo';



CREATE TABLE tecnico (
    id_empleado INT,
    id_aeropuerto INT,
    id_aerolinea INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    fecha_de_nacimiento DATE,
    nacionalidad VARCHAR(50),
    especialidad VARCHAR(30)
);

ALTER TABLE tecnico
    ADD CONSTRAINT pk_tecnico PRIMARY KEY (id_empleado);

ALTER TABLE tecnico
    ADD CONSTRAINT fk_tecnico_aeropuerto FOREIGN KEY (id_aeropuerto)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE tecnico
    ADD CONSTRAINT fk_tecnico_aerolinea FOREIGN KEY (id_aerolinea)
    REFERENCES aerolinea(id_aerolinea);

ALTER TABLE tecnico
    ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE tecnico
    ALTER COLUMN apellido_paterno SET NOT NULL;

ALTER TABLE tecnico
    ALTER COLUMN fecha_de_nacimiento SET NOT NULL;

ALTER TABLE tecnico
    ALTER COLUMN nacionalidad SET NOT NULL;

ALTER TABLE tecnico
    ALTER COLUMN id_aerolinea SET NOT NULL;

ALTER TABLE tecnico
    ALTER COLUMN especialidad SET NOT NULL;

COMMENT ON TABLE tecnico IS 'Tabla de información de los técnicos de mantenimiento aeronáutico';
COMMENT ON COLUMN tecnico.id_empleado IS 'Identificador único del técnico';
COMMENT ON COLUMN tecnico.id_aeropuerto IS 'Aeropuerto donde labora el técnico';
COMMENT ON COLUMN tecnico.id_aerolinea IS 'Aerolínea a la que pertenece el técnico';
COMMENT ON COLUMN tecnico.nombre IS 'Nombre del técnico';
COMMENT ON COLUMN tecnico.apellido_paterno IS 'Apellido paterno del técnico';
COMMENT ON COLUMN tecnico.apellido_materno IS 'Apellido materno del técnico';
COMMENT ON COLUMN tecnico.fecha_de_nacimiento IS 'Fecha de nacimiento del técnico';
COMMENT ON COLUMN tecnico.nacionalidad IS 'Nacionalidad del técnico';
COMMENT ON COLUMN tecnico.especialidad IS 'Área o especialidad técnica del empleado';



CREATE TABLE atencionalpasajero (
    id_empleado INT,
    id_aeropuerto INT,
    id_aerolinea INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    fecha_de_nacimiento DATE,
    nacionalidad VARCHAR(50),
    puesto VARCHAR(30)
);

ALTER TABLE atencionalpasajero
    ADD CONSTRAINT pk_atencionpasajero PRIMARY KEY (id_empleado);

ALTER TABLE atencionalpasajero
    ADD CONSTRAINT fk_atencionpasajero_aeropuerto FOREIGN KEY (id_aeropuerto)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE atencionalpasajero
    ADD CONSTRAINT fk_atencionpasajero_aerolinea FOREIGN KEY (id_aerolinea)
    REFERENCES aerolinea(id_aerolinea);

ALTER TABLE atencionalpasajero
    ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE atencionalpasajero
    ALTER COLUMN apellido_paterno SET NOT NULL;

ALTER TABLE atencionalpasajero
    ALTER COLUMN fecha_de_nacimiento SET NOT NULL;

ALTER TABLE atencionalpasajero
    ALTER COLUMN nacionalidad SET NOT NULL;

ALTER TABLE atencionalpasajero
    ALTER COLUMN id_aerolinea SET NOT NULL;

ALTER TABLE atencionalpasajero
    ALTER COLUMN puesto SET NOT NULL;

COMMENT ON TABLE atencionalpasajero IS 'Tabla de información de los empleados de atención al pasajero';
COMMENT ON COLUMN atencionalpasajero.id_empleado IS 'Identificador único del empleado de atención al pasajero';
COMMENT ON COLUMN atencionalpasajero.id_aeropuerto IS 'Aeropuerto donde trabaja el empleado de atención al pasajero';
COMMENT ON COLUMN atencionalpasajero.id_aerolinea IS 'Aerolínea a la que pertenece el empleado';
COMMENT ON COLUMN atencionalpasajero.nombre IS 'Nombre del empleado de atención al pasajero';
COMMENT ON COLUMN atencionalpasajero.apellido_paterno IS 'Apellido paterno del empleado de atención al pasajero';
COMMENT ON COLUMN atencionalpasajero.apellido_materno IS 'Apellido materno del empleado de atención al pasajero';
COMMENT ON COLUMN atencionalpasajero.fecha_de_nacimiento IS 'Fecha de nacimiento del empleado de atención al pasajero';
COMMENT ON COLUMN atencionalpasajero.nacionalidad IS 'Nacionalidad del empleado de atención al pasajero';
COMMENT ON COLUMN atencionalpasajero.puesto IS 'Puesto o cargo desempeñado por el empleado';



CREATE TABLE ingeniero (
    id_empleado INT,
    id_aeropuerto INT,
    id_aerolinea INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    fecha_de_nacimiento DATE,
    nacionalidad VARCHAR(50),
    rama VARCHAR(50),
    grado_estudio VARCHAR(20)
);

ALTER TABLE ingeniero
    ADD CONSTRAINT pk_ingeniero PRIMARY KEY (id_empleado);

ALTER TABLE ingeniero
    ADD CONSTRAINT fk_ingeniero_aeropuerto FOREIGN KEY (id_aeropuerto)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE ingeniero
    ADD CONSTRAINT fk_ingeniero_aerolinea FOREIGN KEY (id_aerolinea)
    REFERENCES aerolinea(id_aerolinea);

ALTER TABLE ingeniero
    ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE ingeniero
    ALTER COLUMN apellido_paterno SET NOT NULL;

ALTER TABLE ingeniero
    ALTER COLUMN fecha_de_nacimiento SET NOT NULL;

ALTER TABLE ingeniero
    ALTER COLUMN nacionalidad SET NOT NULL;

ALTER TABLE ingeniero
    ALTER COLUMN id_aerolinea SET NOT NULL;

ALTER TABLE ingeniero
    ALTER COLUMN rama SET NOT NULL;

COMMENT ON TABLE ingeniero IS 'Tabla de información de los ingenieros aeronáuticos';
COMMENT ON COLUMN ingeniero.id_empleado IS 'Identificador único del ingeniero';
COMMENT ON COLUMN ingeniero.id_aeropuerto IS 'Aeropuerto donde labora el ingeniero';
COMMENT ON COLUMN ingeniero.id_aerolinea IS 'Aerolínea a la que pertenece el ingeniero';
COMMENT ON COLUMN ingeniero.nombre IS 'Nombre del ingeniero';
COMMENT ON COLUMN ingeniero.apellido_paterno IS 'Apellido paterno del ingeniero';
COMMENT ON COLUMN ingeniero.apellido_materno IS 'Apellido materno del ingeniero';
COMMENT ON COLUMN ingeniero.fecha_de_nacimiento IS 'Fecha de nacimiento del ingeniero';
COMMENT ON COLUMN ingeniero.nacionalidad IS 'Nacionalidad del ingeniero';
COMMENT ON COLUMN ingeniero.rama IS 'Rama de la ingeniería (mecánica, electrónica, etc.)';
COMMENT ON COLUMN ingeniero.grado_estudio IS 'Grado académico del ingeniero';



CREATE TABLE vuelo (
    id_vuelo INT,
    id_avion INT,
    piloto INT,
    origen INT,
    destino INT,
    estado VARCHAR(20),
    etd TIMESTAMP,
    eta TIMESTAMP
);

ALTER TABLE vuelo
    ADD CONSTRAINT pk_vuelo PRIMARY KEY (id_vuelo);

ALTER TABLE vuelo
    ADD CONSTRAINT fk_avion_vuelo FOREIGN KEY (id_avion)
    REFERENCES avion(id_avion);

ALTER TABLE vuelo
    ADD CONSTRAINT fk_piloto_vuelo FOREIGN KEY (piloto)
    REFERENCES piloto(id_empleado);

ALTER TABLE vuelo
    ADD CONSTRAINT fk_origen_vuelo FOREIGN KEY (origen)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE vuelo
    ADD CONSTRAINT fk_destino_vuelo FOREIGN KEY (destino)
    REFERENCES aeropuerto(id_aeropuerto);

ALTER TABLE vuelo
    ALTER COLUMN id_avion SET NOT NULL;

ALTER TABLE vuelo
    ALTER COLUMN piloto SET NOT NULL;

ALTER TABLE vuelo
    ALTER COLUMN origen SET NOT NULL;

ALTER TABLE vuelo
    ALTER COLUMN destino SET NOT NULL;

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
    ADD CONSTRAINT chk_tiempo_vuelo
    CHECK (eta > etd);

COMMENT ON TABLE vuelo IS 'Tabla que almacena los registros de los vuelos registrados en el sistema';
COMMENT ON COLUMN vuelo.id_vuelo IS 'Identificador único del vuelo';
COMMENT ON COLUMN vuelo.id_avion IS 'Referencia al avión asignado al vuelo';
COMMENT ON COLUMN vuelo.piloto IS 'Referencia al piloto asignado al vuelo';
COMMENT ON COLUMN vuelo.origen IS 'Aeropuerto de origen del vuelo';
COMMENT ON COLUMN vuelo.destino IS 'Aeropuerto de destino del vuelo';
COMMENT ON COLUMN vuelo.estado IS 'Estado actual del vuelo (PROGRAMADO, EN_VUELO, CANCELADO, FINALIZADO)';
COMMENT ON COLUMN vuelo.etd IS 'Horario estimado de salida (Estimated Time of Departure)';
COMMENT ON COLUMN vuelo.eta IS 'Horario estimado de llegada (Estimated Time of Arrival)';



CREATE TABLE tarifa_vuelo (
    id_tarifa INT,
    id_vuelo INT,
    precio DOUBLE PRECISION,
    clase VARCHAR(20)
);

ALTER TABLE tarifa_vuelo
    ADD CONSTRAINT pk_tarifa PRIMARY KEY (id_tarifa);

ALTER TABLE tarifa_vuelo
    ADD CONSTRAINT fk_tarifa_vuelo FOREIGN KEY (id_vuelo)
    REFERENCES vuelo(id_vuelo);

ALTER TABLE tarifa_vuelo
    ALTER COLUMN precio SET NOT NULL;

ALTER TABLE tarifa_vuelo
    ALTER COLUMN clase SET NOT NULL;

ALTER TABLE tarifa_vuelo
    ADD CONSTRAINT chk_precio_tarifa CHECK (precio >= 0);

COMMENT ON TABLE tarifa_vuelo IS 'Tarifas asociadas a los vuelos';
COMMENT ON COLUMN tarifa_vuelo.id_tarifa IS 'Identificador único de la tarifa';
COMMENT ON COLUMN tarifa_vuelo.id_vuelo IS 'Identificador del vuelo al que pertenece la tarifa';
COMMENT ON COLUMN tarifa_vuelo.precio IS 'Costo correspondiente a la clase';
COMMENT ON COLUMN tarifa_vuelo.clase IS 'Clase de vuelo';



CREATE TABLE boleto (
    id_boleto SERIAL,
    id_vuelo INT,
    id_tarifa INT,
    fecha_compra DATE,
    numero_asiento INT
);

ALTER TABLE boleto
    ADD CONSTRAINT pk_boleto PRIMARY KEY (id_boleto);

ALTER TABLE boleto
    ADD CONSTRAINT fk_boleto_vuelo FOREIGN KEY (id_vuelo)
    REFERENCES vuelo(id_vuelo);

ALTER TABLE boleto
    ADD CONSTRAINT fk_boleto_tarifa FOREIGN KEY (id_tarifa)
    REFERENCES tarifa_vuelo(id_tarifa);

ALTER TABLE boleto
    ALTER COLUMN fecha_compra SET NOT NULL;

ALTER TABLE boleto
    ALTER COLUMN numero_asiento SET NOT NULL;

ALTER TABLE boleto
    ADD CONSTRAINT uq_numero_asiento UNIQUE (numero_asiento);

ALTER TABLE boleto
    ADD CONSTRAINT chk_numero_asiento CHECK (numero_asiento > 0);

COMMENT ON TABLE boleto IS 'Boletos vendidos asociados a vuelos y tarifas';
COMMENT ON COLUMN boleto.id_boleto IS 'Identificador único del boleto';
COMMENT ON COLUMN boleto.id_vuelo IS 'Vuelo correspondiente al boleto';
COMMENT ON COLUMN boleto.id_tarifa IS 'Tarifa con la que fue adquirido el boleto';
COMMENT ON COLUMN boleto.fecha_compra IS 'Fecha en la que se realizó la compra';
COMMENT ON COLUMN boleto.numero_asiento IS 'Número de asiento asignado al boleto';
