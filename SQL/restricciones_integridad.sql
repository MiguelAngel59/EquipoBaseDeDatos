--------------------------------------------------- PRACTICA 8 -----------------------------------------------------
-- 1. Agregar las restricciones de integridad necesarias para su modelo utilizando ALTERTABLE.
--------------------------------------------------------------------------------------------------------------------

-- Algunas restricciones de integridad ya estaban agregadas, fundamentalemente los señalamientos NOT NULL, UNIQUE y
-- Checks para impedir valores fuera de rango, a continuación agregaremos solo algunos extras o modificaremos existente
-- para un ajuste más correcto a las reglas de negocio


-- AEROPUERTO
-- Validación de longitud del código IATA
ALTER TABLE aeropuerto
    ADD CONSTRAINT ck_codigo_iata_length
    CHECK (LENGTH(codigo_iata) = 3);


-- EMPLEADOS
-- Todos los empleados deben ser mayores de 18 años
ALTER TABLE piloto
    ADD CONSTRAINT ck_piloto_edad CHECK (fecha_de_nacimiento <= CURRENT_DATE - INTERVAL '18 years');

ALTER TABLE controlador
    ADD CONSTRAINT ck_controlador_edad CHECK (fecha_de_nacimiento <= CURRENT_DATE - INTERVAL '18 years');

ALTER TABLE sobrecargo
    ADD CONSTRAINT ck_sobrecargo_edad CHECK (fecha_de_nacimiento <= CURRENT_DATE - INTERVAL '18 years');

ALTER TABLE tecnico
    ADD CONSTRAINT ck_tecnico_edad CHECK (fecha_de_nacimiento <= CURRENT_DATE - INTERVAL '18 years');

ALTER TABLE atencionalpasajero
    ADD CONSTRAINT ck_atencionalpasajero_edad CHECK (fecha_de_nacimiento <= CURRENT_DATE - INTERVAL '18 years');

ALTER TABLE ingeniero
    ADD CONSTRAINT ck_ingeniero_edad CHECK (fecha_de_nacimiento <= CURRENT_DATE - INTERVAL '18 years');


-- Definición de turnos del controlador
ALTER TABLE controlador
    ADD CONSTRAINT ck_turno_controlador
    CHECK (turno IN ('Matutino','Vespertino','Nocturno'));


-- TARIFA_VUELO
-- Clase válida de tarifa
ALTER TABLE tarifa_vuelo
    ADD CONSTRAINT ck_tarifa_clase
    CHECK (clase IN ('ECONOMICA','EJECUTIVA','PREMIUM'));

-- id_vuelo no puede ser NULL
ALTER TABLE tarifa_vuelo
    ALTER COLUMN id_vuelo SET NOT NULL;


-- BOLETO
-- id_vuelo y id_tarifa no pueden ser NULL
ALTER TABLE boleto
    ALTER COLUMN id_vuelo SET NOT NULL;

ALTER TABLE boleto
    ALTER COLUMN id_tarifa SET NOT NULL;



-- RELACIONES Y ACCIONES ON DELETE / ON UPDATE
--------------------------------------------------------------------------------------------------------------------

-- TERMINAL
-- Cambio del aeropuerto donde pertenece
ALTER TABLE terminal
    DROP CONSTRAINT fk_terminal_aeropuerto;
ALTER TABLE terminal
    ADD CONSTRAINT fk_terminal_aeropuerto
    FOREIGN KEY (id_aeropuerto) REFERENCES aeropuerto(id_aeropuerto)
    ON DELETE CASCADE  -- Si se borra el aeropuerto, borrar terminales
    ON UPDATE CASCADE; -- Si cambia el id_aeropuerto, actualizarlo en terminal


-- AVION
-- Cambio en aeropuerto de ubicación
ALTER TABLE avion
    DROP CONSTRAINT fk_avion_aeropuerto;
ALTER TABLE avion
    ADD CONSTRAINT fk_avion_aeropuerto
    FOREIGN KEY (id_aeropuerto) REFERENCES aeropuerto(id_aeropuerto)
    ON DELETE SET NULL  -- Mantener avión pero sin aeropuerto
    ON UPDATE CASCADE;  -- Actualizar aeropuerto si cambia su id

-- Cambio en aerolínea propietaria
ALTER TABLE avion
    DROP CONSTRAINT fk_avion_aerolinea;
ALTER TABLE avion
    ADD CONSTRAINT fk_avion_aerolinea
    FOREIGN KEY (id_aerolinea) REFERENCES aerolinea(id_aerolinea)
    ON DELETE CASCADE  -- Borrar avión si aerolínea se elimina
    ON UPDATE CASCADE; -- Actualizar id_aerolinea si cambia


-- EMPLEADOS
-- Ubicación aeropuerto
ALTER TABLE piloto
    DROP CONSTRAINT fk_piloto_aeropuerto;
ALTER TABLE piloto
    ADD CONSTRAINT fk_piloto_aeropuerto
    FOREIGN KEY (id_aeropuerto) REFERENCES aeropuerto(id_aeropuerto)
    ON DELETE SET NULL -- Para no perder al empleado
    ON UPDATE CASCADE; --  Actualizar id_aeropuerti si cambia

ALTER TABLE controlador
    DROP CONSTRAINT fk_controlador_aeropuerto;
ALTER TABLE controlador
    ADD CONSTRAINT fk_controlador_aeropuerto
    FOREIGN KEY (id_aeropuerto) REFERENCES aeropuerto(id_aeropuerto)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE sobrecargo
    DROP CONSTRAINT fk_sobrecargo_aeropuerto;
ALTER TABLE sobrecargo
    ADD CONSTRAINT fk_sobrecargo_aeropuerto
    FOREIGN KEY (id_aeropuerto) REFERENCES aeropuerto(id_aeropuerto)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE tecnico
    DROP CONSTRAINT fk_tecnico_aeropuerto;
ALTER TABLE tecnico
    ADD CONSTRAINT fk_tecnico_aeropuerto
    FOREIGN KEY (id_aeropuerto) REFERENCES aeropuerto(id_aeropuerto)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE atencionalpasajero
    DROP CONSTRAINT fk_atencionpasajero_aeropuerto;
ALTER TABLE atencionalpasajero
    ADD CONSTRAINT fk_atencionpasajero_aeropuerto
    FOREIGN KEY (id_aeropuerto) REFERENCES aeropuerto(id_aeropuerto)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE ingeniero
    DROP CONSTRAINT fk_ingeniero_aeropuerto;
ALTER TABLE ingeniero
    ADD CONSTRAINT fk_ingeniero_aeropuerto
    FOREIGN KEY (id_aeropuerto) REFERENCES aeropuerto(id_aeropuerto)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Al cambia aerolínea
ALTER TABLE piloto
    DROP CONSTRAINT fk_piloto_aerolinea;
ALTER TABLE piloto
    ADD CONSTRAINT fk_piloto_aerolinea
    FOREIGN KEY (id_aerolinea) REFERENCES aerolinea(id_aerolinea)
    ON DELETE CASCADE   -- Borrar al personal también
    ON UPDATE CASCADE;  -- Actualizar id_aerolínea

ALTER TABLE controlador
    DROP CONSTRAINT fk_controlador_aerolinea;
ALTER TABLE controlador
    ADD CONSTRAINT fk_controlador_aerolinea
    FOREIGN KEY (id_aerolinea) REFERENCES aerolinea(id_aerolinea)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE sobrecargo
    DROP CONSTRAINT fk_sobrecargo_aerolinea;
ALTER TABLE sobrecargo
    ADD CONSTRAINT fk_sobrecargo_aerolinea
    FOREIGN KEY (id_aerolinea) REFERENCES aerolinea(id_aerolinea)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE tecnico
    DROP CONSTRAINT fk_tecnico_aerolinea;
ALTER TABLE tecnico
    ADD CONSTRAINT fk_tecnico_aerolinea
    FOREIGN KEY (id_aerolinea) REFERENCES aerolinea(id_aerolinea)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE atencionalpasajero
    DROP CONSTRAINT fk_atencionpasajero_aerolinea;
ALTER TABLE atencionalpasajero
    ADD CONSTRAINT fk_atencionpasajero_aerolinea
    FOREIGN KEY (id_aerolinea) REFERENCES aerolinea(id_aerolinea)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE ingeniero
    DROP CONSTRAINT fk_ingeniero_aerolinea;
ALTER TABLE ingeniero
    ADD CONSTRAINT fk_ingeniero_aerolinea
    FOREIGN KEY (id_aerolinea) REFERENCES aerolinea(id_aerolinea)
    ON DELETE CASCADE
    ON UPDATE CASCADE;


-- VUELO
-- Nos gustaría mantener el registro de los vuelos FINALIZADOS, pues en esto la inexistencia de valores
-- no supondrían un riesgo en la lógica, pero no ecnontramos forma de implementar esto más que usando 
-- valores comodines, de momento optamos pro cascada y proximamente ver alguna implementación posible para
-- preservar el registro.
ALTER TABLE vuelo
    DROP CONSTRAINT fk_avion_vuelo;
ALTER TABLE vuelo
    ADD CONSTRAINT fk_avion_vuelo
    FOREIGN KEY (id_avion) REFERENCES avion(id_avion)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE vuelo
    DROP CONSTRAINT fk_piloto_vuelo;
ALTER TABLE vuelo
    ADD CONSTRAINT fk_piloto_vuelo
    FOREIGN KEY (piloto) REFERENCES piloto(id_empleado)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE vuelo
    DROP CONSTRAINT fk_origen_vuelo;
ALTER TABLE vuelo
    ADD CONSTRAINT fk_origen_vuelo
    FOREIGN KEY (origen) REFERENCES aeropuerto(id_aeropuerto)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE vuelo
    DROP CONSTRAINT fk_destino_vuelo;
ALTER TABLE vuelo
    ADD CONSTRAINT fk_destino_vuelo
    FOREIGN KEY (destino) REFERENCES aeropuerto(id_aeropuerto)
    ON DELETE CASCADEL
    ON UPDATE CASCADE;


-- TARIFA_VUELO
ALTER TABLE tarifa_vuelo
    DROP CONSTRAINT fk_tarifa_vuelo;
ALTER TABLE tarifa_vuelo
    ADD CONSTRAINT fk_tarifa_vuelo
    FOREIGN KEY (id_vuelo) REFERENCES vuelo(id_vuelo)
    ON DELETE CASCADE
    ON UPDATE CASCADE;


-- BOLETO
ALTER TABLE boleto
    DROP CONSTRAINT fk_boleto_vuelo;
ALTER TABLE boleto
    ADD CONSTRAINT fk_boleto_vuelo
    FOREIGN KEY (id_vuelo) REFERENCES vuelo(id_vuelo)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE boleto
    DROP CONSTRAINT fk_boleto_tarifa;
ALTER TABLE boleto
    ADD CONSTRAINT fk_boleto_tarifa
    FOREIGN KEY (id_tarifa) REFERENCES tarifa_vuelo(id_tarifa)
    ON DELETE CASCADE
    ON UPDATE CASCADE;




--------------------------------------------------------------------------------------------------------------------
-- 2. Definir al menos:
--    2 llaves primarias.
--    2 llaves foráneas (una básica y una con acciones).
--    2 restricciones de dominio (CHECK, NOT NULL, tipos de datos).

-- 4. Probar la eliminación de restricciones.
--------------------------------------------------------------------------------------------------------------------

-- Para abordar estos puntos aprovecharemos lo que se pide para expandir nuestra base de datos agregando 
-- un nuevo atributo multivaluado para los sobrecargos y personal de atención al pasajero, dicho atributo
-- hace referencia al idioma que dominan.

-- Haremos unas modificaciones para hacer más especificos los nombres de las PK de cada elemento de tipo empleado
-- Haremos drop de las Constraint de la antigua PK

-- PILOTO
ALTER TABLE piloto
    RENAME COLUMN id_empleado TO id_piloto;

-- Quitamos la anterior CONSTRAINT que definia la anterior pk, pues a pesar de que en teoría es el mismo atributo,
-- en la constraint se señala a id_empleado, pero ese atributo ya no se encuentra en la tabla.
ALTER TABLE piloto
    DROP CONSTRAINT pk_piloto;

-- Agregar nueva PK
ALTER TABLE piloto
    ADD CONSTRAINT pk_piloto PRIMARY KEY (id_piloto);

COMMENT ON COLUMN piloto.id_piloto IS 'Identificador único del piloto';


-- CONTROLADOR
ALTER TABLE controlador
    RENAME COLUMN id_empleado TO id_controlador;

ALTER TABLE controlador
    DROP CONSTRAINT pk_controlador;

ALTER TABLE controlador
    ADD CONSTRAINT pk_controlador PRIMARY KEY (id_controlador);

COMMENT ON COLUMN controlador.id_controlador IS 'Identificador único del controlador de tráfico aéreo';


-- SOBRECARGO
ALTER TABLE sobrecargo
    RENAME COLUMN id_empleado TO id_sobrecargo;

ALTER TABLE sobrecargo
    DROP CONSTRAINT pk_sobrecargo;

ALTER TABLE sobrecargo
    ADD CONSTRAINT pk_sobrecargo PRIMARY KEY (id_sobrecargo);

COMMENT ON COLUMN sobrecargo.id_sobrecargo IS 'Identificador único del sobrecargo o auxiliar de vuelo';


-- TECNICO
ALTER TABLE tecnico
    RENAME COLUMN id_empleado TO id_tecnico;

ALTER TABLE tecnico
    DROP CONSTRAINT pk_tecnico;

ALTER TABLE tecnico
    ADD CONSTRAINT pk_tecnico PRIMARY KEY (id_tecnico);

COMMENT ON COLUMN tecnico.id_tecnico IS 'Identificador único del técnico aeronáutico';


-- INGENIERO
ALTER TABLE ingeniero
    RENAME COLUMN id_empleado TO id_ingeniero;

ALTER TABLE ingeniero
    DROP CONSTRAINT pk_ingeniero;

ALTER TABLE ingeniero
    ADD CONSTRAINT pk_ingeniero PRIMARY KEY (id_ingeniero);

COMMENT ON COLUMN ingeniero.id_ingeniero IS 'Identificador único del ingeniero aeronáutico';


-- ATENCIÓN AL PASAJERO
ALTER TABLE atencionalpasajero
    RENAME COLUMN id_empleado TO id_atencion;

ALTER TABLE atencionalpasajero
    DROP CONSTRAINT pk_atencionpasajero;

ALTER TABLE atencionalpasajero
    ADD CONSTRAINT pk_atencion PRIMARY KEY (id_atencion);

COMMENT ON COLUMN atencionalpasajero.id_atencion IS 'Identificador único del empleado de atención al pasajero';


--------------------------------------------------------------------------------------------------------------------
-- AGREGADO DE LAS RELACIONES PARA IDIOMAS DEL PERSONAL
-- TABLA DE IDIOMAS
CREATE TABLE idioma (
    id_idioma INT,
    nombre VARCHAR(50)
);

ALTER TABLE idioma
    ADD CONSTRAINT pk_idioma PRIMARY KEY (id_idioma);

-- Se agrega la restricción NOT NULL ya que es un valor totalmente necesario de señalar, pues el nombre del idioma es lo más
-- representativo de la entidad o lo representativo en su totalidad.
ALTER TABLE idioma
    ALTER COLUMN nombre SET NOT NULL;

COMMENT ON TABLE idioma IS 'Catálogo de idiomas manejados por el personal de sobrecargos y atención al pasajero';
COMMENT ON COLUMN idioma.id_idioma IS 'Identificador único del idioma';
COMMENT ON COLUMN idioma.nombre IS 'Nombre del idioma (Español, Inglés, Francés, etc.)';


-- Tabla de la relacipn SOBRECARGO – IDIOMA
CREATE TABLE sobrecargo_idioma (
    id_sobrecargo INT,
    id_idioma INT
);

ALTER TABLE sobrecargo_idioma
    ADD CONSTRAINT pk_sobrecargo_idioma PRIMARY KEY (id_sobrecargo, id_idioma);

ALTER TABLE sobrecargo_idioma
    ADD CONSTRAINT fk_sobrecargo_idioma_sobrecargo FOREIGN KEY (id_sobrecargo)
    REFERENCES sobrecargo(id_sobrecargo);

ALTER TABLE sobrecargo_idioma
    ADD CONSTRAINT fk_sobrecargo_idioma_idioma FOREIGN KEY (id_idioma)
    REFERENCES idioma(id_idioma);

COMMENT ON TABLE sobrecargo_idioma IS 'Relación entre sobrecargos y los idiomas que dominan';
COMMENT ON COLUMN sobrecargo_idioma.id_sobrecargo IS 'Identificador del sobrecargo que domina el idioma';
COMMENT ON COLUMN sobrecargo_idioma.id_idioma IS 'Identificador del idioma que domina el sobrecargo';


-- Tabla de la relación ATENCIÓN AL PASAJERO – IDIOMA
CREATE TABLE atencion_idioma (
    id_atencion INT,
    id_idioma INT
);

ALTER TABLE atencion_idioma
    ADD CONSTRAINT pk_atencion_idioma PRIMARY KEY (id_atencion, id_idioma);

ALTER TABLE atencion_idioma
    ADD CONSTRAINT fk_atencion_idioma_atencion FOREIGN KEY (id_atencion)
    REFERENCES atencionalpasajero(id_atencion);

ALTER TABLE atencion_idioma
    ADD CONSTRAINT fk_atencion_idioma_idioma FOREIGN KEY (id_idioma)
    REFERENCES idioma(id_idioma);

COMMENT ON TABLE atencion_idioma IS 'Relación entre empleados de atención al pasajero y los idiomas que manejan';
COMMENT ON COLUMN atencion_idioma.id_atencion IS 'Identificador del empleado de atención al pasajero que domina el idioma';
COMMENT ON COLUMN atencion_idioma.id_idioma IS 'Identificador del idioma que domina el empleado';

--------------------------------------------------------------------------------------------------------------------
-- 3. Modificar al menos una tabla agregando y eliminando columnas, y cambiando tipos de datos.
-- Para este punto agregaremos una nueva columna a la tabla idioma, la nueva columna será para indicar
-- el grado de dominio del idioma
--------------------------------------------------------------------------------------------------------------------

-- Agregado de columna: Se agrega la columna grado_dominio con la restricciones NOT NULL y un valor por DEFAULT que es INTERMEDIO
ALTER TABLE idioma
    ADD COLUMN grado_dominio VARCHAR(20) NOT NULL DEFAULT 'INTERMEDIO';

-- Se señalan los grados admitidos
ALTER TABLE idioma
    ADD CONSTRAINT chk_grado_dominio
    CHECK (grado_dominio IN ('BÁSICO', 'INTERMEDIO', 'AVANZADO', 'NATIVO'));

COMMENT ON COLUMN idioma.grado_dominio IS
    'Grado o nivel de dominio del idioma (BÁSICO, INTERMEDIO, AVANZADO, NATIVO)';


-- Cambiar tipo y borrar columna: Para esto agregaremos una nueva columna, clave_certificado, dentro de las relaciones de empleado-idioma para 
-- señalar la clave del certificado que lo avala, además debe ser NOT NULL

ALTER TABLE sobrecargo_idioma
    ADD COLUMN clave_certificado VARCHAR(30) NOT NULL;;

COMMENT ON COLUMN sobrecargo_idioma.clave_certificado IS
    'Clave o identificador del certificado que avala el dominio del idioma por parte del sobrecargo';


ALTER TABLE atencionpasajero_idioma
    ADD COLUMN clave_certificado VARCHAR(30) NOT NULL;;

COMMENT ON COLUMN atencionpasajero_idioma.clave_certificado IS
    'Clave o identificador del certificado que avala el dominio del idioma por parte del empleado de atención al pasajero';


-- Se modifica el tipo, solo se expandió la capacidad del VARCHAR
ALTER TABLE sobrecargo_idioma
    ALTER COLUMN clave_certificado TYPE VARCHAR(50);

COMMENT ON COLUMN sobrecargo_idioma.clave_certificado IS
    'Clave o identificador del certificado (extendido a 50 caracteres para mayor flexibilidad)';


ALTER TABLE atencionpasajero_idioma
    ALTER COLUMN clave_certificado TYPE VARCHAR(50);

COMMENT ON COLUMN atencionpasajero_idioma.clave_certificado IS
    'Clave o identificador del certificado (extendido a 50 caracteres para mayor flexibilidad)';


-- Prueba de dropeo de restricción NOT NULL
-- Se elimina la columna recién creada

ALTER TABLE sobrecargo_idioma
    ALTER COLUMN clave_certificado DROP NOT NULL;

ALTER TABLE atencionpasajero_idioma
    ALTER COLUMN clave_certificado DROP NOT NULL;

ALTER TABLE sobrecargo_idioma
    DROP COLUMN clave_certificado;

ALTER TABLE atencionpasajero_idioma
    DROP COLUMN clave_certificado;




