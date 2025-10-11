--INSERT

-- Aeropuerto
INSERT INTO aeropuerto (id_aeropuerto,nombre,tipo,capacidad_terminales,pais,ciudad) VALUES

   
(1,'Aeropuerto Internacional de Acapulco','INTERNACIONAL',2,'México','Acapulco'),
(2,'Aeropuerto Internacional de Aguascalientes','INTERNACIONAL',3,'México','Aguascalientes'),
(3,'Aeropuerto Internacional de São Paulo-Guarulhos','INTERNACIONAL',4,'Brasil','São Paulo'),
(4,'Ing. Alberto Acuña Ongay','NACIONAL',1,'México','Campeche'),
(5,'Aeropuerto Internacional El Dorado','INTERNACIONAL',1,'Colombia','Bogotá'),
(6,'Aeropuerto Internacional de Chetumal','INTERNACIONAL',2,'México','Chetumal'),
(7,'Aeropuerto Internacional General Roberto Fierro Villalobos','INTERNACIONAL',4,'México','Chihuahua'),
(8,'Aeropuerto Internacional de Ciudad del Carmen','INTERNACIONAL',3,'México','Ciudad del Carmen'),
(9,'Aeropuerto Internacional de Cozumel','INTERNACIONAL',2,'México','Cozumel'),
(10,'Aeropuerto Internacional de Hermosillo','INTERNACIONAL',3,'México','Hermosillo'),
(11,'Aeropuerto Internacional Felipe Ángeles','INTERNACIONAL',2,'México','Santa Lucía'),
(12,'Aeropuerto Internacional de Veracruz','INTERNACIONAL',2,'México','Veracruz'),
(13,'AICM Benito Juárez','INTERNACIONAL',2,'México','Ciudad de México'),
(14,'Aeropuerto Internacional de Cancún','INTERNACIONAL',3,'México','Cancún'),
(15,'Aeropuerto Internacional de Guadalajara','INTERNACIONAL',2,'México','Guadalajara'),
(16,'Aeropuerto Internacional de Monterrey','INTERNACIONAL',3,'México','Monterrey'),
(17,'Aeropuerto Nacional de Toluca','NACIONAL',1,'México','Toluca'),
(18,'Aeropuerto Nacional de Puebla','NACIONAL',1,'México','Puebla'),
(19,'Aeropuerto Internacional de Los Ángeles (LAX)','INTERNACIONAL',4,'Estados Unidos','Los Ángeles'),
(20,'Aeropuerto Internacional Dallas/Fort Worth (DFW)','INTERNACIONAL',5,'Estados Unidos','Dallas'),
(21,'Toronto Pearson International','INTERNACIONAL',4,'Canadá','Toronto'),
(22,'Aeropuerto Nacional de Mérida','NACIONAL',1,'México','Mérida'),
(23,'Aeropuerto Nacional de Oaxaca','NACIONAL',1,'México','Oaxaca'),
(24,'Aeropuerto Internacional de Tijuana','INTERNACIONAL',2,'México','Tijuana'),
(25,'Aeropuerto Nacional de León','NACIONAL',NULL,'México','León');

-- Aerolínea
INSERT INTO aerolinea (id_aerolinea,nombre,pais_origen,codigo_internacional,fecha_fundacion) VALUES


(1,'Aerus','México','ZV','2022-05-30'),
(2,'Azul Linhas Aéreas','Brasil','AD','2008-05-05'),
(3,'British Airways','Reino Unido','BA','1974-03-31'),
(4,'Flybondi','Argentina','FO','2016-09-16'),
(5,'LATAM Colombia','Colombia','4C','2010-05-01'),
(6,'Viva Air Colombia','Colombia','VH','2009-10-22'),
(7,'Southwest Airlines','Estados Unidos','WN','1967-03-15'),
(8,'JetBlue Airways','Estados Unidos','B6','1998-08-03'),
(9,'Spirit Airlines','Estados Unidos','NK','1980-05-21'),
(10,'Frontier Airlines','Estados Unidos','F9','1994-03-05'),
(11,'Hawaiian Airlines','Estados Unidos','HA','1929-01-30'),
(12,'Copa Airlines','Panamá','CM','1944-06-21'),
(13,'AeroMéxico','México','AMX','1934-09-15'),
(14,'Volaris','México','VOI','2004-08-05'),
(15,'VivaAerobus','México','VIV','2006-11-30'),
(16,'Interjet','México','ITJ',NULL),
(17,'American Airlines','Estados Unidos','AAL','1930-04-15'),
(18,'Delta Air Lines','Estados Unidos','DAL','1929-05-03'),
(19,'Air Canada','Canadá','ACA','1937-04-10'),
(20,'United Airlines','Estados Unidos','UAL','1931-04-06'),
(21,'Aeromar','México','AEM','1987-01-29'),
(22,'Calafia Airlines','México','CAF',NULL),
(23,'Magnicharters','México','MAG',NULL),
(24,'Alaska Airlines','Estados Unidos','ASA','1932-05-15'),
(25,'WestJet','Canadá','WJA','1996-02-29');

-- Avión
INSERT INTO avion (id_avion,id_aeropuerto,id_aerolinea,modelo,capacidad) VALUES

(1,7,7,'Boeing 737-700',143),
(2,17,17,'Airbus A321neo',196),
(3,18,18,'Airbus A350-900',306),
(4,20,17,'Boeing 777-300ER',350),
(5,24,24,'Airbus A320neo',178),
(6,8,13,'Embraer E190',100),
(7,19,19,'Airbus A220-300',137),
(8,2,2,'Embraer E195-E2',136),
(9,3,3,'Airbus A380-800',469),
(10,14,14,'Airbus A321neo',230),
(11,15,15,'Airbus A320-200',186),
(12,5,5,'Airbus A319',144),
(13,13,13,'Boeing 737-800',160),
(14,14,14,'Airbus A320',170),
(15,NULL,15,'Airbus A320neo',180),
(16,13,15,'Superjet 100',100),
(17,19,17,'Boeing 777-200',300),
(18,20,18,'Airbus A321',190),
(19,21,19,'Boeing 787-9',250),
(20,13,20,'Boeing 737 MAX',189),
(21,17,21,'ATR 72-600',68),
(22,24,22,'Boeing 787-9',178),
(23,23,23,'Boeing 737-700',150),
(24,19,24,'Airbus A320',170),
(25,21,24,'Boeing 737-800',160);


-- Piloto
INSERT INTO piloto (id_piloto,id_aeropuerto,id_aerolinea,licencia,nacionalidad,nombre,apellido_paterno,apellido_materno,fecha_de_nacimiento) VALUES


(1,16,1,'ZV-1001','Mexicana','Ana','García','Martínez','1992-08-22'),
(2,3,2,'AD-2002','Brasileña','Lucas','Silva',NULL,'1988-11-15'),
(3,19,3,'BA-3003','Británica','Oliver','Jones','Smith','1979-04-18'),
(4,5,4,'FO-4004','Argentina','Mateo','Fernández',NULL,'1986-09-03'),
(5,5,5,'4C-5005','Colombiana','Sofia','Rodríguez','García','1990-01-25'),
(6,5,6,'VH-6006','Colombiana','Santiago','González','Pérez','1991-07-12'),
(7,20,7,'WN-7007','Estadounidense','Michael','Brown','Davis','1981-06-20'),
(8,19,8,'B6-8008','Estadounidense','Jessica','Miller',NULL,'1989-03-30'),
(9,19,9,'NK-9009','Estadounidense','Christopher','Wilson','Moore','1984-05-14'),
(10,20,10,'F9-1010','Estadounidense','Amanda','Taylor',NULL,'1993-02-09'),
(11,19,11,'HA-1111','Estadounidense','Daniel','Anderson','Thomas','1980-12-21'),
(12,14,12,'CM-1212','Panameña','Isabella','Martínez','López','1987-10-01'),
(13,13,13,'AMX-1001','Mexicana','Carlos','Ramírez','López','1980-05-10'),
(14,14,14,'VOI-2002','Mexicana','Luis','Hernández','García','1985-07-20'),
(15,NULL,15,'VIV-3003','Mexicana','María','Gómez',NULL,'1990-01-15'),
(16,16,17,'ITJ-4004','Mexicana','José','Pérez','Sánchez','1978-09-25'),
(17,19,17,'AAL-5005','Estadounidense','John','Smith','Johnson','1975-03-12'),
(18,20,18,'DAL-6006','Estadounidense','Robert','Williams','Brown','1982-11-08'),
(19,21,19,'ACA-7007','Canadiense','Anne','Taylor',NULL,'1987-04-05'),
(20,13,20,'UAL-8008','Estadounidense','David','Anderson','Lee','1979-06-30'),
(21,17,21,'AEM-9009','Mexicana','Fernando','Castillo','Hernández','1983-10-10'),
(22,24,22,'CAF-1010','Mexicana','Jorge','Núñez','Santos','1991-02-28'),
(23,23,23,'MAG-1111','Mexicana','Ricardo','Vega','Torres','1984-08-14'),
(24,19,24,'ASA-1212','Estadounidense','Kevin','Moore','Davis','1977-12-01'),
(25,21,24,'WJA-1313','Canadiense','Emily','Miller','Scott','1992-03-19');


-- Vuelo
INSERT INTO vuelo (id_vuelo,id_avion,id_piloto,id_origen,id_destino,estado,etd,eta,precio) VALUES
-- FINALIZADOS
(1,1,7,20,19,'FINALIZADO','2025-09-25 08:00:00','2025-09-25 12:00:00',3200.50),
(7,2,17,20,14,'FINALIZADO','2025-09-20 14:30:00','2025-09-20 18:00:00',4800.00),
(11,5,24,19,20,'FINALIZADO','2025-09-27 06:45:00','2025-09-27 11:15:00',2950.00),
(17,17,17,19,20,'FINALIZADO','2025-10-05 09:00:00','2025-10-05 13:30:00',760.00),
(19,18,18,13,20,'FINALIZADO','2025-10-07 15:00:00','2025-10-07 19:30:00',5400.75),

-- EN_VUELO (etd < now < eta)
(3,9,3,3,21,'EN_VUELO','2025-10-10 15:00:00','2025-10-10 19:00:00',9800.00),
(15,15,15,15,16,'EN_VUELO','2025-10-10 14:30:00','2025-10-10 20:00:00',1850.50),

-- CANCELADOS
(4,8,2,3,5,'CANCELADO','2025-10-09 07:00:00','2025-10-09 11:00:00',2500.00),
(16,1,1,16,17,'CANCELADO','2025-10-10 10:00:00','2025-10-10 14:00:00',1300.00),

-- PROGRAMADOS (futuros)
(2,10,14,14,13,'PROGRAMADO','2025-10-11 08:00:00','2025-10-11 12:00:00',1950.00),
(5,12,5,5,14,'PROGRAMADO','2025-10-15 09:30:00','2025-10-15 13:30:00',3100.00),
(6,7,7,21,13,'PROGRAMADO','2025-11-01 07:00:00','2025-11-01 11:00:00',6550.70),
(8,3,18,19,20,'PROGRAMADO','2025-10-22 06:00:00','2025-10-22 10:00:00',3900.00),
(9,11,15,15,24,'PROGRAMADO','2025-10-12 13:00:00','2025-10-12 17:00:00',1550.25),
(10,13,13,14,5,'PROGRAMADO','2025-10-18 08:30:00','2025-10-18 12:30:00',4100.00),
(12,13,13,5,14,'PROGRAMADO','2025-10-20 09:00:00','2025-10-20 13:00:00',2800.00),
(13,13,13,13,19,'PROGRAMADO','2025-10-13 07:00:00','2025-10-13 11:00:00',5200.00),
(14,14,14,14,15,'PROGRAMADO','2025-10-14 06:30:00','2025-10-14 10:30:00',2100.00),
(18,18,18,20,13,'PROGRAMADO','2025-10-16 08:00:00','2025-10-16 12:00:00',8800.00),
(20,20,20,13,24,'PROGRAMADO','2025-10-17 07:45:00','2025-10-17 11:45:00',1850.00),
(21,21,21,17,18,'PROGRAMADO','2025-10-18 09:00:00','2025-10-18 13:00:00',720.00),
(22,21,21,18,19,'PROGRAMADO','2025-10-19 10:00:00','2025-10-19 14:00:00',450.00),
(23,23,23,23,22,'PROGRAMADO','2025-10-20 11:00:00','2025-10-20 15:00:00',950.00),
(24,24,24,19,13,'PROGRAMADO','2025-10-21 12:00:00','2025-10-21 16:00:00',7200.00),
(25,25,25,21,13,'PROGRAMADO','2025-10-22 13:00:00','2025-10-22 17:00:00',6200.00);


--UPDATE

-- Cambiar capacidad de un aeropuerto
-- Aeropuerto Nacional de León ahora tiene 3 terminales.
UPDATE aeropuerto
SET capacidad_terminales = 3
WHERE id_aeropuerto = 25; 

-- Actualizar última ubicación de avión
-- Avión de VivaAerobus ahora está en el Aeropuerto Internacional de Los Ángeles. 
UPDATE avion
SET id_aeropuerto = 19
WHERE id_avion = 15; 

-- Cambiar nacionalidad del piloto 20
-- Piloto de United ahora con nacionalidad canadiense.
UPDATE piloto
SET nacionalidad = 'Canadiense'
WHERE id_piloto = 20;

-- Cambiar precio y horario a vuelo 18
-- Vuelo Delta DFW->CDMX ahora con precio = 9200 y nuevo horario.
UPDATE vuelo 
SET etd = '2025-10-16 07:00:00', eta = '2025-10-16 11:00:00', precio = 9200
WHERE id_vuelo = 18;

-- Actualizar estado de vuelo
-- El vuelo 9 de VivaAerobus ha despegado.
UPDATE vuelo
SET estado = 'EN_VUELO'
WHERE id_vuelo = 9;

-- Reasignar aeropuerto base de un piloto
-- La piloto Ana García de Aerus ahora tiene base en Cancún.
UPDATE piloto
SET id_aeropuerto = 14
WHERE id_piloto = 1;

-- Corregir la capacidad de avión 
-- El avión 22 es muy grande y se debe cambiar su capacidad.
UPDATE avion
SET capacidad = 290
WHERE id_avion = 22;

-- Incrementar precio de vuelo 
-- Aumentar el precio del vuelo 6 de Air Canada.
UPDATE vuelo
SET precio = 7150.00
WHERE id_vuelo = 6;



--DELETE

-- Eliminar un aeropuerto, no tiene elementos dependietes
-- Eliminado Aeropuerto Nacional de León.
DELETE FROM aeropuerto
WHERE id_aeropuerto = 25;

-- Eliminar una aerolínea
DELETE FROM aerolinea
WHERE id_aerolinea = 25;

-- Eliminar un avión
-- Eliminado avión De Havilland Dash 8 Q400 de Calafia.
DELETE FROM avion
WHERE id_avion = 22;

-- Eliminar un piloto
-- Eliminado piloto Anne Taylor de Air Canada.
DELETE FROM piloto
WHERE id_piloto = 19;

-- Eliminar un piloto de una aerolínea que será borrada
-- Eliminado piloto José Pérez de Interjet.
DELETE FROM piloto
WHERE id_piloto = 16;

-- Eliminar un avión de la aerolínea que será borrada
-- Eliminado avión Superjet 100 de Interjet.
DELETE FROM avion
WHERE id_avion = 16;

-- Eliminar una aerolínea 
-- Eliminada aerolínea Interjet.
DELETE FROM aerolinea
WHERE id_aerolinea = 16;



--SELECT

-- Listar todos los aeropuertos internacionales en México
SELECT id_aeropuerto, nombre, ciudad
FROM aeropuerto
WHERE tipo = 'INTERNACIONAL' AND pais = 'México';

-- Ver pilotos y su aerolínea
SELECT p.id_piloto, p.nombre, p.apellido_paterno, a.nombre AS aerolinea
FROM piloto p
JOIN aerolinea a ON p.id_aerolinea = a.id_aerolinea
ORDER BY a.nombre;

-- Contar vuelos por estado de vuelo
SELECT estado, COUNT(*) AS total_vuelos
FROM vuelo
GROUP BY estado;

-- Listar aviones con capacidad mayor a 150 asientos
SELECT id_avion, modelo, capacidad
FROM avion
WHERE capacidad > 150;

-- Listar vuelos (origen y destino) que salen desde LAX
SELECT v.id_vuelo, a_origen.nombre AS origen, a_destino.nombre AS destino, v.estado
FROM vuelo v
JOIN aeropuerto a_origen ON v.id_origen = a_origen.id_aeropuerto
JOIN aeropuerto a_destino ON v.id_destino = a_destino.id_aeropuerto
WHERE a_origen.id_aeropuerto = 19;

-- Calcular el precio promedio de los vuelos por aerolínea
SELECT ae.nombre AS aerolinea, AVG(v.precio) AS precio_promedio
FROM vuelo v
JOIN avion av ON v.id_avion = av.id_avion
JOIN aerolinea ae ON av.id_aerolinea = ae.id_aerolinea
GROUP BY ae.nombre
ORDER BY precio_promedio DESC;

-- Encontrar qué pilotos vuelan el modelo 'Boeing 737-800'
SELECT DISTINCT p.nombre, p.apellido_paterno, a.modelo
FROM piloto p
JOIN vuelo v ON p.id_piloto = v.id_piloto
JOIN avion a ON v.id_avion = a.id_avion
WHERE a.modelo = 'Boeing 737-800';

-- Encontrar el vuelo programado más caro
SELECT id_vuelo, precio
FROM vuelo
WHERE estado = 'PROGRAMADO'
ORDER BY precio DESC
LIMIT 1;
