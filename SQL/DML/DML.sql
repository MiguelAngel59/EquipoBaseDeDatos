--INSERT

--AEROPUERTOS
INSERT INTO aeropuerto (id_aeropuerto, nombre, tipo, pais, ciudad, codigo_iata) VALUES
-- México
(1, 'Aeropuerto Internacional de la Ciudad de México', 'INTERNACIONAL', 'México', 'Ciudad de México', 'MEX'),
(2, 'Aeropuerto Internacional de Guadalajara', 'INTERNACIONAL', 'México', 'Guadalajara', 'GDL'),
(3, 'Aeropuerto Internacional de Monterrey', 'INTERNACIONAL', 'México', 'Monterrey', 'MTY'),
(4, 'Aeropuerto Internacional de Cancún', 'INTERNACIONAL', 'México', 'Cancún', 'CUN'),
(5, 'Nuevo Aeropuerto Internacional de México', 'INTERNACIONAL', 'México', 'Ciudad de México', null),
(6, 'Aeropuerto Internacional de Mérida', 'NACIONAL', 'México', 'Mérida', 'MID'),
(7, 'Aeropuerto Nacional de Oaxaca', 'NACIONAL', 'México', 'Oaxaca', 'OAX'),
(8, 'Aeropuerto Internacional de Querétaro', 'NACIONAL', 'México', 'Querétaro', 'QRO'),
(9, 'Aeropuerto Internacional de León-Bajío', 'NACIONAL', 'México', 'León', 'BJX'),

-- Estados Unidos
(10, 'Los Angeles International Airport', 'INTERNACIONAL', 'Estados Unidos', 'Los Ángeles', 'LAX'),
(11, 'John F. Kennedy International Airport', 'INTERNACIONAL', 'Estados Unidos', 'Nueva York', 'JFK'),
(12, 'Dallas/Fort Worth International Airport', 'INTERNACIONAL', 'Estados Unidos', 'Dallas', 'DFW'),
(13, 'Chicago Midway Airport', 'NACIONAL', 'Estados Unidos', 'Chicago', 'MDW'),
(14, 'Denver International Airport', 'INTERNACIONAL', 'Estados Unidos', 'Denver', 'DEN'),
(15, 'Orlando International Airport', 'INTERNACIONAL', 'Estados Unidos', 'Orlando', 'MCO'),

-- Brasil
(16, 'Aeroporto Internacional de São Paulo-Guarulhos', 'INTERNACIONAL', 'Brasil', 'São Paulo', 'GRU'),
(17, 'Aeroporto Internacional de Brasília', 'INTERNACIONAL', 'Brasil', 'Brasília', 'BSB'),
(18, 'Aeroporto Santos Dumont', 'NACIONAL', 'Brasil', 'Río de Janeiro', 'SDU'),
(19, 'Aeroporto Internacional Tancredo Neves', 'NACIONAL', 'Brasil', 'Belo Horizonte', 'CNF'),

-- España
(20, 'Aeropuerto Adolfo Suárez Madrid-Barajas', 'INTERNACIONAL', 'España', 'Madrid', 'MAD'),
(21, 'Aeropuerto de Barcelona-El Prat', 'INTERNACIONAL', 'España', 'Barcelona', 'BCN'),
(22, 'Aeropuerto de Málaga-Costa del Sol', 'NACIONAL', 'España', 'Málaga', 'AGP'),
(23, 'Aeropuerto de Valencia', 'NACIONAL', 'España', 'Valencia', 'VLC'),

-- Japón
(24, 'Tokyo Haneda International Airport', 'INTERNACIONAL', 'Japón', 'Tokio', 'HND'),
(25, 'Kansai International Airport', 'INTERNACIONAL', 'Japón', 'Osaka', 'KIX'),
(26, 'New Chitose Airport', 'NACIONAL', 'Japón', 'Sapporo', 'CTS'),
(27, 'Fukuoka Airport', 'NACIONAL', 'Japón', 'Fukuoka', 'FUK');




-- TERMINALES
INSERT INTO terminal (id_aeropuerto, numero_terminal, capacidadd_aviones, capacidadd_publico) VALUES
-- México
-- Aeropuerto MEX (id = 1)
(1, 1, 50, 20000),
(1, 2, 40, 15000),
-- Guadalajara (GDL, id = 2)
(2, 1, 20, 8000),
(2, 2, 10, 4000),
-- Monterrey (MTY, id = 3)
(3, 1, 18, 7000),
-- Cancún (CUN, id = 4)
(4, 1, 25, 10000),
(4, 2, 15, 6000),
-- NAIM (NULL, id = 5) 
  -- no hay
-- Mérida (MID, id = 6)
(6, 1, 8, 3000),
-- Oaxaca (OAX, id = 7)
(7, 1, 6, 2000),
-- Querétaro (QRO, id = 8)
(8, 1, 10, 4000),
-- León-Bajío (BJX, id = 9)
(9, 1, 10, 4000),

-- Estados Unidos
-- LAX (Los Ángeles, id = 10)
(10, 1, 20, 8000),
(10, 2, 18, 7000),
(10, 3, 22, 9000),
(10, 4, 16, 6000),
(10, 5, 15, 6000),
(10, 6, 12, 5000),
(10, 7, 14, 5500),
(10, 8, 14, 5500),
(10, 9, 25, 10000),
-- JFK (Nueva York, id = 11)
(11, 1, 30, 12000),
(11, 2, 25, 10000),
(11, 3, 20, 8000),
-- DFW (Dallas/Fort Worth, id = 12)
(12, 1, 28, 11000),
(12, 2, 22, 9000),
(12, 3, 18, 7000),
-- MDW (Chicago Midway, id = 13)
(13, 1, 10, 4000),
-- DEN (Denver, id = 14)
(14, 1, 15, 6000),
(14, 2, 10, 4000),
-- MCO (Orlando, id = 15)
(15, 1, 20, 8000),
(15, 2, 15, 6000),
(15, 3, 12, 5000),

-- Brasil
-- GRU (São Paulo-Guarulhos, id = 16)
(16, 1, 35, 14000),
(16, 2, 25, 10000),
(16, 3, 20, 8000),
-- BSB (Brasilia, id = 17)
(17, 1, 20, 8000),
-- SDU (Rio de Janeiro, id = 18)
(18, 1, 15, 6000),
-- CNF (Belo Horizonte, id = 19)
(19, 1, 12, 5000),

-- España
-- MAD (Madrid-Barajas, id = 20)
(20, 1, 30, 12000),
(20, 2, 25, 10000),
(20, 3, 18, 7000),
(20, 4, 15, 5000),
-- BCN (Barcelona, id = 21)
(21, 1, 22, 9000),
(21, 2, 18, 7000),
-- AGP (Málaga, id = 22)
(22, 1, 12, 5000),
-- VLC (Valencia, id = 23)
(23, 1, 10, 4000),

-- Japón
-- HND (Tokio Haneda, id = 24)
(24, 1, 20, 8000),
(24, 2, 18, 7000),
(24, 3, 25, 10000),
-- KIX (Osaka Kansai, id = 25)
(25, 1, 15, 6000),
-- CTS (Sapporo New Chitose, id = 26)
(26, 1, 12, 5000),
-- FUK (Fukuoka, id = 27)
(27, 1, 10, 4000);




-- AEROLÍNEAS
INSERT INTO aerolinea (id_aerolinea, nombre, pais_origen, codigo_internacional, fecha_fundacion) VALUES
-- México
(1,  'Aerolíneas Mexicanas', 'México', 'AMX', '1934-09-14'),
(2,  'Volaris',               'México', 'VOI', '2005-03-13'),
(3,  'Viva Aerobus',          'México', 'VIV', '2006-11-30'),
(4,  'Interjet',              'México', 'AIJ', '2005-12-01'),
(5,  'Calafia Airlines',      'México', 'CFV', '1993-01-01'),
(6,  'Aeromar',               'México', 'TAO', '1987-01-29'),
(7,  'Aerus',                 'México', 'NCS', '2023-04-27'),
(8,  'Magnicharters',         'México', 'GMT', '1994-01-01'),
(9,  'Mexicana de Aviación',  'México', 'MXA', '1921-07-12'),

-- Estados Unidos
(10, 'American Airlines',     'Estados Unidos', 'AAL', '1930-04-15'),
(11, 'Delta Air Lines',       'Estados Unidos', 'DAL', '1925-03-02'),
(12, 'United Airlines',       'Estados Unidos', 'UAL', '1926-04-06'),
(13, 'Southwest Airlines',    'Estados Unidos', 'SWA', '1967-03-15'),
(14, 'JetBlue Airways',       'Estados Unidos', 'JBU', '1998-08-01'),
(15, 'Alaska Airlines',       'Estados Unidos', 'ASA', '1932-04-14'),
(16, 'Spirit Airlines',       'Estados Unidos', 'NKS', '1983-06-01'),
(17, 'Frontier Airlines',     'Estados Unidos', 'FFT', '1994-02-08'),

-- Brasil
(18, 'LATAM Brasil',          'Brasil', 'TAM', '1976-01-01'),
(19, 'Gol Linhas Aéreas',     'Brasil', 'GLO', '2001-01-15'),
(20, 'Azul Linhas Aéreas',    'Brasil', 'AZU', '2008-05-05'),

-- España
(21, 'Iberia',                'España', 'IBE', '1927-06-28'),
(22, 'Air Europa',            'España', 'AEA', '1986-02-21'),
(23, 'Vueling',               'España', 'VLG', '2004-07-01'),

-- Japón
(24, 'Japan Airlines',        'Japón', 'JAL', '1951-08-01'),
(25, 'All Nippon Airways',    'Japón', 'ANA', '1952-12-27');          --BORRAR




-- AVIONES
INSERT INTO avion (id_avion, id_aeropuerto, id_aerolinea, modelo, capacidad_pasajeros) VALUES
---------------MEXICO------------------
-- Aeroméxico
(1, 1, 1, 'Boeing 737-800', 160),
(2, 1, 1, 'Boeing 737 MAX 9', 180),
(3, 2, 1, 'Boeing 787-9 Dreamliner', 290),
(4, 3, 1, 'Embraer 190', 99),
(5, 4, 1, 'Boeing 737-700', 144),
(6, 1, 1, 'Boeing 737 MAX 8', 175),
(7, 2, 1, 'Boeing 787-8 Dreamliner', 250),

-- Volaris
(8, 2, 2, 'Airbus A320neo', 186),
(9, 3, 2, 'Airbus A321neo', 230),
(10, 4, 2, 'Airbus A319', 144),
(11, 1, 2, 'Airbus A320', 174),
(12, 2, 2, 'Airbus A320neo', 186),
(13, 3, 2, 'Airbus A321', 220),
(14, 4, 2, 'Airbus A320neo', 186),

-- Viva Aerobus
(15, 1, 3, 'Airbus A320', 180),
(16, 2, 3, 'Airbus A321neo', 230),
(17, 3, 3, 'Airbus A320neo', 186),
(18, 4, 3, 'Airbus A321', 220),
(19, 2, 3, 'Airbus A320', 180),
(20, 3, 3, 'Airbus A321neo', 230),
(21, 4, 3, 'Airbus A320', 180),

-- Interjet
(22, 1, 4, 'Sukhoi Superjet 100', 93),
(23, 2, 4, 'Airbus A320', 174),
(24, 3, 4, 'Airbus A321', 220),
(25, 4, 4, 'Airbus A320neo', 186),
(26, 1, 4, 'Sukhoi Superjet 100', 98),
(27, 2, 4, 'Airbus A320', 180),
(28, 3, 4, 'Airbus A320neo', 186),

-- Calafia Airlines
(29, 4, 5, 'Embraer ERJ-145', 50),
(30, 3, 5, 'Cessna 208 Caravan', 12),
(31, 4, 5, 'Embraer EMB-120', 30),
(32, 2, 5, 'Embraer ERJ-145', 50),
(33, 3, 5, 'Cessna 208 Caravan', 12),
(34, 1, 5, 'Embraer ERJ-135', 37),
(35, 4, 5, 'Embraer EMB-120', 30),

-- Aeromar
(36, 4, 6, 'ATR 72-600', 70),
(37, 3, 6, 'ATR 42-500', 50),
(38, 1, 6, 'ATR 72-600', 70),
(39, 2, 6, 'ATR 42-300', 48),
(40, 4, 6, 'ATR 72-600', 70),
(41, 3, 6, 'ATR 42-500', 50),
(42, 1, 6, 'ATR 72-600', 70),

-- Aerus
(43, 3, 7, 'Cessna 408 SkyCourier', 19),
(44, 4, 7, 'Pilatus PC-12', 9),
(45, 2, 7, 'Cessna 208 Caravan', 12),
(46, 1, 7, 'Cessna 408 SkyCourier', 19),
(47, 3, 7, 'Pilatus PC-12', 9),
(48, 4, 7, 'Cessna 208 Caravan', 12),
(49, 1, 7, 'Cessna 408 SkyCourier', 19),

-- Magnicharters
(50, 1, 8, 'Boeing 737-300', 148),
(51, 2, 8, 'Boeing 737-200', 130),
(52, 3, 8, 'Boeing 737-300', 148),
(53, 4, 8, 'Boeing 737-400', 159),
(54, 1, 8, 'Boeing 737-300', 148),
(55, 2, 8, 'Boeing 737-200', 130),
(56, 3, 8, 'Boeing 737-400', 159),

-- Mexicana de Aviación
(57, 1, 9, 'Airbus A320', 174),
(58, 2, 9, 'Airbus A319', 144),
(59, 3, 9, 'Boeing 757-200', 200),
(60, 4, 9, 'Airbus A320neo', 186),
(61, 1, 9, 'Airbus A320', 174),
(62, 2, 9, 'Boeing 737-800', 160),
(63, 3, 9, 'Airbus A321', 220);

---------------EU------------------
-- American Airlines
(64, 6, 10, 'Boeing 737-800', 160),
(65, 7, 10, 'Airbus A321', 220),
(66, 8, 10, 'Boeing 777-200ER', 305),
(67, 9, 10, 'Boeing 787-8 Dreamliner', 248),
(68, 10, 10, 'Airbus A319', 144),
(69, 11, 10, 'Boeing 737 MAX 8', 172),
(70, 12, 10, 'Airbus A320', 174),

-- Delta Airlines
(71, 6, 11, 'Boeing 737-900ER', 180),
(72, 7, 11, 'Airbus A321', 220),
(73, 8, 11, 'Airbus A350-900', 315),
(74, 9, 11, 'Boeing 767-400ER', 245),
(75, 10, 11, 'Airbus A220-100', 120),
(76, 11, 11, 'Boeing 757-300', 243),
(77, 12, 11, 'Airbus A321neo', 228),

-- United Airlines
(78, 6, 12, 'Boeing 737 MAX 9', 179),
(79, 7, 12, 'Boeing 757-200', 200),
(80, 8, 12, 'Boeing 787-9 Dreamliner', 290),
(81, 9, 12, 'Airbus A320', 174),
(82, 10, 12, 'Boeing 767-300ER', 218),
(83, 11, 12, 'Airbus A321', 220),
(84, 12, 12, 'Boeing 777-200', 312),

-- Southwest Airlines
(85, 6, 13, 'Boeing 737-700', 143),
(86, 7, 13, 'Boeing 737-800', 175),
(87, 8, 13, 'Boeing 737 MAX 8', 175),
(88, 9, 13, 'Boeing 737-700', 143),
(89, 10, 13, 'Boeing 737-800', 175),
(90, 11, 13, 'Boeing 737 MAX 8', 175),
(91, 12, 13, 'Boeing 737-700', 143),

-- JetBlue Airways
(92, 6, 14, 'Airbus A320', 162),
(93, 7, 14, 'Airbus A321neo', 200),
(94, 8, 14, 'Airbus A220-300', 140),
(95, 9, 14, 'Airbus A320neo', 174),
(96, 10, 14, 'Airbus A321LR', 200),
(97, 11, 14, 'Embraer E190', 100),
(98, 12, 14, 'Airbus A321', 220),

-- Alaska Airlines
(99, 6, 15, 'Boeing 737-800', 160),
(100, 7, 15, 'Boeing 737-900ER', 178),
(101, 8, 15, 'Boeing 737 MAX 9', 178),
(102, 9, 15, 'Embraer 175', 76),
(103, 10, 15, 'Boeing 737-800', 160),
(104, 11, 15, 'Boeing 737-900ER', 178),
(105, 12, 15, 'Embraer 175', 76),

-- Spirit Airlines
(106, 6, 16, 'Airbus A320', 174),
(107, 7, 16, 'Airbus A321', 220),
(108, 8, 16, 'Airbus A320neo', 186),
(109, 9, 16, 'Airbus A319', 144),
(110, 10, 16, 'Airbus A320neo', 186),
(111, 11, 16, 'Airbus A321neo', 230),
(112, 12, 16, 'Airbus A320', 174),

-- Frontier Airlines
(113, 6, 17, 'Airbus A320neo', 186),
(114, 7, 17, 'Airbus A321', 220),
(115, 8, 17, 'Airbus A320', 180),
(116, 9, 17, 'Airbus A321neo', 230),
(117, 10, 17, 'Airbus A320', 174),
(118, 11, 17, 'Airbus A321', 220),
(119, 12, 17, 'Airbus A320neo', 186);

----------BRASIL------------
-- LATAM Brasil
(120, 14, 18, 'Airbus A321', 220),
(121, 15, 18, 'Boeing 767-300ER', 238),
(122, 16, 18, 'Airbus A320', 174),
(123, 14, 18, 'Airbus A319', 144),
(124, 15, 18, 'Boeing 787-9 Dreamliner', 296),
(125, 16, 18, 'Airbus A321neo', 230),
(126, 15, 18, 'Airbus A320neo', 186),

-- GOL Linhas Aéreas
(127, 14, 19, 'Boeing 737-800', 176),
(128, 15, 19, 'Boeing 737 MAX 8', 186),
(129, 16, 19, 'Boeing 737-700', 144),
(130, 14, 19, 'Boeing 737-800', 176),
(131, 15, 19, 'Boeing 737 MAX 8', 186),
(132, 16, 19, 'Boeing 737-800', 176),
(133, 15, 19, 'Boeing 737 MAX 8', 186),

-- Azul Linhas Aéreas Brasileiras
(134, 14, 20, 'Airbus A320neo', 174),
(135, 15, 20, 'Embraer 195-E2', 136),
(136, 16, 20, 'Airbus A321neo', 220),
(137, 14, 20, 'ATR 72-600', 70),
(138, 15, 20, 'Airbus A320', 174),
(139, 16, 20, 'Airbus A320neo', 186),
(140, 15, 20, 'Embraer 190', 114);

-------------ESPAÑA-------------
-- Iberia
(155, 19, 23, 'Airbus A320neo', 186),
(156, 20, 23, 'Airbus A321', 220),
(157, 19, 23, 'Airbus A330-300', 288),
(158, 20, 23, 'Airbus A350-900', 348),
(159, 19, 23, 'Airbus A319', 144),
(160, 20, 23, 'Airbus A321neo', 230),
(161, 19, 23, 'Airbus A320', 174),

-- Vueling Airlines
(162, 19, 24, 'Airbus A320', 180),
(163, 20, 24, 'Airbus A321', 220),
(164, 19, 24, 'Airbus A320neo', 186),
(165, 20, 24, 'Airbus A319', 144),
(166, 19, 24, 'Airbus A320', 174),
(167, 20, 24, 'Airbus A321neo', 230),
(168, 19, 24, 'Airbus A320neo', 186);

-------------JAPÓN------------
-- Japan Airlines
(169, 24, 24, 'Boeing 787-9 Dreamliner', 296),
(170, 25, 24, 'Boeing 777-300ER', 396),
(171, 26, 24, 'Airbus A350-900', 325),
(172, 27, 24, 'Boeing 737-800', 189),
(173, 24, 24, 'Boeing 767-300ER', 218);




--PILOTOS
INSERT INTO piloto (id_empleado, id_aeropuerto, id_aerolinea, nombre, apellido_paterno, apellido_materno, fecha_de_nacimiento, nacionalidad, licencia, tipo_licencia, esta_certificado, horas_de_vuelo) VALUES
--------Mexico----------
-- Aerolíneas Mexicanas (Aeroméxico)
(1, 1, 1, 'Juan', 'Pérez', 'López', '1980-03-15', 'Mexicana', 'AMX001', 'ATPL', TRUE, 5200),
(2, 2, 1, 'María', 'González', 'Hernández', '1985-07-22', 'Mexicana', 'AMX002', 'CPL', TRUE, 4800),
(3, 3, 1, 'Carlos', 'Ramírez', 'Vega', '1978-11-03', 'Mexicana', 'AMX003', 'ATPL', TRUE, 6100),
(4, 1, 1, 'Ana', 'Sánchez', 'Morales', '1990-01-18', 'Mexicana', 'AMX004', 'PPL', FALSE, 1200),

-- Volaris
(5, 2, 2, 'Luis', 'Torres', 'Reyes', '1982-05-27', 'Mexicana', 'VOI001', 'ATPL', TRUE, 4200),
(6, 3, 2, 'Fernanda', 'Vázquez', 'Cruz', '1991-09-12', 'Mexicana', 'VOI002', 'CPL', TRUE, 3900),
(7, 4, 2, 'Miguel', 'Castillo', 'Ríos', '1987-12-09', 'Mexicana', 'VOI003', 'PPL', FALSE, 800),

-- Viva Aerobus
(8, 3, 3, 'Paola', 'Flores', 'Jiménez', '1984-04-30', 'Mexicana', 'VIV001', 'ATPL', TRUE, 4300),
(9, 6, 3, 'Roberto', 'Mendoza', 'Soto', '1979-08-11', 'Mexicana', 'VIV002', 'CPL', TRUE, 5600),
(10, 7, 3, 'Lorena', 'Romero', 'Gutiérrez', '1986-06-21', 'Mexicana', 'VIV003', 'ATPL', TRUE, 4100),

-- Interjet
(11, 6, 4, 'Jorge', 'Ortega', 'Navarro', '1983-02-14', 'Mexicana', 'AIJ001', 'ATPL', TRUE, 5000),
(12, 7, 4, 'Claudia', 'Domínguez', 'Ramos', '1992-10-05', 'Mexicana', 'AIJ002', 'CPL', TRUE, 3600),
(13, 8, 4, 'Diego', 'Martínez', 'Pérez', '1985-07-12', 'Mexicana', 'AIJ003', 'PPL', FALSE, 900),

-- Calafia Airlines
(14, 8, 5, 'Alejandra', 'Ramírez', 'Soto', '1989-11-19', 'Mexicana', 'CFV001', 'ATPL', TRUE, 4000),
(15, 9, 5, 'Eduardo', 'Vega', 'García', '1979-05-30', 'Mexicana', 'CFV002', 'CPL', TRUE, 5600),
(16, 6, 5, 'Paula', 'Morales', 'Díaz', '1984-10-05', 'Mexicana', 'CFV003', 'PPL', FALSE, 1000),

-- Aeromar
(17, 1, 6, 'Santiago', 'Mendoza', 'López', '1980-12-21', 'Mexicana', 'TAO001', 'ATPL', TRUE, 4700),
(18, 2, 6, 'Valeria', 'Hernández', 'Torres', '1987-03-13', 'Mexicana', 'TAO002', 'CPL', TRUE, 4200),
(19, 3, 6, 'Jorge', 'Ortiz', 'Navarro', '1982-07-04', 'Mexicana', 'TAO003', 'PPL', FALSE, 900),

-- Aerus
(20, 1, 7, 'Claudia', 'Domínguez', 'Ramos', '1992-10-05', 'Mexicana', 'NCS001', 'ATPL', TRUE, 3600),
(21, 2, 7, 'Luis', 'Ramírez', 'Vega', '1987-12-09', 'Mexicana', 'NCS002', 'CPL', TRUE, 4200),
(22, 3, 7, 'Mariana', 'Gómez', 'Pérez', '1985-02-20', 'Mexicana', 'NCS003', 'PPL', FALSE, 1100),

-- Magnicharters
(23, 4, 8, 'Eduardo', 'Santos', 'López', '1982-05-10', 'Mexicana', 'GMT001', 'ATPL', TRUE, 5000),
(24, 1, 8, 'Paola', 'Hernández', 'Morales', '1990-01-18', 'Mexicana', 'GMT002', 'CPL', TRUE, 3500),
(25, 2, 8, 'Diego', 'Castillo', 'Ríos', '1987-12-09', 'Mexicana', 'GMT003', 'PPL', FALSE, 800),

-- Mexicana de Aviación
(26, 1, 9, 'Juan', 'Ramírez', 'Torres', '1980-03-15', 'Mexicana', 'MXA001', 'ATPL', TRUE, 5200),
(27, 2, 9, 'María', 'González', 'Hernández', '1985-07-22', 'Mexicana', 'MXA002', 'CPL', TRUE, 4800),
(28, 3, 9, 'Carlos', 'Ramírez', 'Vega', '1978-11-03', 'Mexicana', 'MXA003', 'PPL', FALSE, 1200),

-----Estados Unidos-------
-- American Airlines
(29, 10, 10, 'John', 'Smith', 'Johnson', '1978-04-15', 'Estadounidense', 'AAL001', 'ATPL', TRUE, 7200),
(30, 12, 10, 'Emily', 'Davis', 'Brown', '1985-09-20', 'Estadounidense', 'AAL002', 'CPL', TRUE, 4800),
(31, 11, 10, 'Michael', 'Wilson', 'Taylor', '1982-01-11', 'Estadounidense', 'AAL003', 'PPL', FALSE, 1200),

-- Delta Air Lines
(32, 11, 11, 'Sarah', 'Moore', 'Clark', '1983-05-07', 'Estadounidense', 'DAL001', 'ATPL', TRUE, 6500),
(33, 12, 11, 'James', 'White', 'Hall', '1980-11-23', 'Estadounidense', 'DAL002', 'CPL', TRUE, 5100),
(34, 14, 11, 'Anna', 'Young', 'Allen', '1990-02-28', 'Estadounidense', 'DAL003', 'PPL', FALSE, 900),

-- United Airlines
(35, 12, 12, 'Robert', 'Hernandez', 'King', '1979-08-14', 'Estadounidense', 'UAL001', 'ATPL', TRUE, 7000),
(36, 13, 12, 'Jessica', 'Wright', 'Lopez', '1987-06-30', 'Estadounidense', 'UAL002', 'CPL', TRUE, 4600),
(37, 10, 12, 'William', 'Hill', 'Scott', '1985-12-05', 'Estadounidense', 'UAL003', 'PPL', FALSE, 1000),

-- Southwest Airlines
(38, 12, 13, 'Daniel', 'Green', 'Adams', '1984-03-21', 'Estadounidense', 'SWA001', 'ATPL', TRUE, 6000),
(39, 13, 13, 'Laura', 'Baker', 'Nelson', '1990-07-19', 'Estadounidense', 'SWA002', 'CPL', TRUE, 4200),
(40, 15, 13, 'Kevin', 'Carter', 'Mitchell', '1988-09-12', 'Estadounidense', 'SWA003', 'PPL', FALSE, 1100),

-- JetBlue Airways
(41, 11, 14, 'Stephanie', 'Perez', 'Roberts', '1985-10-05', 'Estadounidense', 'JBU001', 'ATPL', TRUE, 5000),
(42, 15, 14, 'Brian', 'Turner', 'Phillips', '1982-03-18', 'Estadounidense', 'JBU002', 'CPL', TRUE, 4700),
(43, 10, 14, 'Rachel', 'Campbell', 'Parker', '1991-01-22', 'Estadounidense', 'JBU003', 'PPL', FALSE, 900),

-- Alaska Airlines
(44, 10, 15, 'Mark', 'Evans', 'Edwards', '1980-07-14', 'Estadounidense', 'ASA001', 'ATPL', TRUE, 6900),
(45, 14, 15, 'Olivia', 'Collins', 'Stewart', '1986-11-09', 'Estadounidense', 'ASA002', 'CPL', TRUE, 4500),
(46, 12, 15, 'Nathan', 'Sanchez', 'Morris', '1983-05-25', 'Estadounidense', 'ASA003', 'PPL', FALSE, 1200),

-- Spirit Airlines
(47, 15, 16, 'Amanda', 'Rogers', 'Reed', '1988-02-13', 'Estadounidense', 'NKS001', 'ATPL', TRUE, 5200),
(48, 12, 16, 'Joshua', 'Cook', 'Morgan', '1985-08-30', 'Estadounidense', 'NKS002', 'CPL', TRUE, 4600),
(49, 13, 16, 'Megan', 'Bell', 'Murphy', '1990-06-17', 'Estadounidense', 'NKS003', 'PPL', FALSE, 800),

-- Frontier Airlines
(50, 14, 17, 'Tyler', 'Bailey', 'Rivera', '1982-09-22', 'Estadounidense', 'FFT001', 'ATPL', TRUE, 6100),
(51, 15, 17, 'Samantha', 'Cooper', 'Cook', '1987-12-10', 'Estadounidense', 'FFT002', 'CPL', TRUE, 4300),
(52, 12, 17, 'Brandon', 'Ward', 'Morgan', '1991-04-03', 'Estadounidense', 'FFT003', 'PPL', FALSE, 950),

---------Brasil--------
-- LATAM Brasil
(53, 16, 18, 'Lucas', 'Silva', 'Souza', '1980-03-11', 'Brasileña', 'TAM001', 'ATPL', TRUE, 6200),
(54, 17, 18, 'Mariana', 'Costa', 'Lima', '1985-07-24', 'Brasileña', 'TAM002', 'CPL', TRUE, 4800),
(55, 18, 18, 'Pedro', 'Oliveira', 'Mendes', '1982-11-03', 'Brasileña', 'TAM003', 'PPL', FALSE, 900),

-- Gol Linhas Aéreas
(56, 16, 19, 'Fernanda', 'Almeida', 'Ribeiro', '1983-05-17', 'Brasileña', 'GLO001', 'ATPL', TRUE, 5600),
(57, 19, 19, 'Rafael', 'Santos', 'Gomes', '1987-09-09', 'Brasileña', 'GLO002', 'CPL', TRUE, 4300),
(58, 18, 19, 'Juliana', 'Ferreira', 'Costa', '1990-02-25', 'Brasileña', 'GLO003', 'PPL', FALSE, 800),

-- Azul Linhas Aéreas
(59, 16, 20, 'Mateus', 'Rodrigues', 'Silva', '1984-04-12', 'Brasileña', 'AZU001', 'ATPL', TRUE, 5100),
(60, 17, 20, 'Camila', 'Martins', 'Pereira', '1988-08-30', 'Brasileña', 'AZU002', 'CPL', TRUE, 4200),
(61, 19, 20, 'Gustavo', 'Lima', 'Santos', '1982-12-18', 'Brasileña', 'AZU003', 'PPL', FALSE, 1000),

----------ESPAÑA-------
-- Iberia
(62, 20, 21, 'Carlos', 'García', 'Fernández', '1978-05-14', 'Española', 'IBE001', 'ATPL', TRUE, 7200),
(63, 21, 21, 'Laura', 'Martínez', 'López', '1985-11-22', 'Española', 'IBE002', 'CPL', TRUE, 4800),
(64, 22, 21, 'Javier', 'Sánchez', 'Gómez', '1983-03-03', 'Española', 'IBE003', 'PPL', FALSE, 900),

-- Air Europa
(65, 20, 22, 'Ana', 'Pérez', 'Hernández', '1984-07-10', 'Española', 'AEA001', 'ATPL', TRUE, 6100),
(66, 21, 22, 'Miguel', 'Rodríguez', 'Torres', '1987-09-25', 'Española', 'AEA002', 'CPL', TRUE, 4300),
(67, 23, 22, 'Lucía', 'Gómez', 'Vargas', '1990-01-15', 'Española', 'AEA003', 'PPL', FALSE, 850),

-- Vueling
(68, 21, 23, 'David', 'Ramírez', 'Santos', '1982-02-12', 'Española', 'VLG001', 'ATPL', TRUE, 5000),
(69, 22, 23, 'Elena', 'Torres', 'Jiménez', '1989-06-21', 'Española', 'VLG002', 'CPL', TRUE, 4200),
(70, 23, 23, 'Sergio', 'Castillo', 'Moreno', '1985-10-09', 'Española', 'VLG003', 'PPL', FALSE, 900),

---------JAPÓN-----------
-- Japan Airlines
(71, 24, 24, 'Takashi', 'Yamamoto', 'Sato', '1978-04-20', 'Japonesa', 'JAL001', 'ATPL', TRUE, 7000),
(72, 25, 24, 'Yuki', 'Tanaka', 'Kobayashi', '1985-09-18', 'Japonesa', 'JAL002', 'CPL', TRUE, 4800),
(73, 26, 24, 'Hiroshi', 'Nakamura', 'Fujimoto', '1982-01-11', 'Japonesa', 'JAL003', 'PPL', FALSE, 1000),
(74, 27, 24, 'Miyuki', 'Ito', 'Kawasaki', '1990-06-25', 'Japonesa', 'JAL004', 'ATPL', TRUE, 5200);





-- CONTROLADORES
INSERT INTO controlador (id_empleado, id_aeropuerto, id_aerolinea, nombre, apellido_paterno, apellido_materno, fecha_de_nacimiento, nacionalidad, numero_torre_asignada, licencia_controlador, turno) VALUES

--------MÉXICO--------
-- Aerolíneas Mexicanas
(1, 1, 1, 'Arturo', 'Pérez', 'Gómez', '1975-02-14', 'Mexicana', 1, 'CTL001', 'Matutino'),
(2, 3, 1, 'Lucía', 'Ramírez', 'Morales', '1980-06-20', 'Mexicana', 2, 'CTL002', 'Vespertino'),

-- Volaris
(3, 2, 2, 'Fernando', 'Torres', 'Hernández', '1978-11-03', 'Mexicana', 1, 'CTL003', 'Nocturno'),
(4, 4, 2, 'Isabel', 'Mendoza', 'López', '1982-08-11', 'Mexicana', 2, 'CTL004', 'Matutino'),

-- Viva Aerobus
(5, 3, 3, 'Miguel', 'Soto', 'Ramírez', '1979-05-17', 'Mexicana', 1, 'CTL005', 'Vespertino'),
(6, 4, 3, 'Ana', 'Flores', 'Gómez', '1985-01-25', 'Mexicana', 2, 'CTL006', 'Nocturno'),

-- Interjet
(7, 6, 4, 'Jorge', 'Hernández', 'Pérez', '1980-12-10', 'Mexicana', 1, 'CTL007', 'Matutino'),
(8, 7, 4, 'Claudia', 'González', 'Martínez', '1983-07-18', 'Mexicana', 2, 'CTL008', 'Vespertino'),

-- Calafia Airlines
(9, 6, 5, 'Eduardo', 'Vega', 'Santos', '1978-03-22', 'Mexicana', 1, 'CTL009', 'Nocturno'),
(10, 7, 5, 'Paola', 'Morales', 'Ríos', '1981-09-30', 'Mexicana', 2, 'CTL010', 'Matutino'),

-- Aeromar
(11, 1, 6, 'Santiago', 'Ortiz', 'López', '1979-11-05', 'Mexicana', 1, 'CTL011', 'Vespertino'),
(12, 2, 6, 'Valeria', 'Ramírez', 'Torres', '1984-02-19', 'Mexicana', 2, 'CTL012', 'Nocturno'),

-- Aerus
(13, 1, 7, 'Luis', 'Domínguez', 'Vega', '1980-08-14', 'Mexicana', 1, 'CTL013', 'Matutino'),
(14, 3, 7, 'Mariana', 'Gómez', 'Pérez', '1985-04-27', 'Mexicana', 2, 'CTL014', 'Vespertino'),

-- Magnicharters
(15, 4, 8, 'Eduardo', 'Santos', 'López', '1978-06-09', 'Mexicana', 1, 'CTL015', 'Nocturno'),
(16, 8, 8, 'Paola', 'Hernández', 'Morales', '1983-12-12', 'Mexicana', 2, 'CTL016', 'Matutino'),

-- Mexicana de Aviación
(17, 1, 9, 'Juan', 'Ramírez', 'Torres', '1977-01-23', 'Mexicana', 1, 'CTL017', 'Vespertino'),
(18, 3, 9, 'María', 'González', 'Hernández', '1982-09-30', 'Mexicana', 2, 'CTL018', 'Nocturno');

--------ESTADOS UNIDOS--------
-- American Airlines
(19, 10, 10, 'John', 'Smith', 'Johnson', '1975-05-14', 'Estadounidense', 1, 'CTL019', 'Matutino'),
(20, 11, 10, 'Emily', 'Davis', 'Brown', '1980-12-01', 'Estadounidense', 2, 'CTL020', 'Vespertino'),

-- Delta Air Lines
(21, 12, 11, 'Sarah', 'Moore', 'Clark', '1982-03-07', 'Estadounidense', 1, 'CTL021', 'Nocturno'),
(22, 14, 11, 'James', 'White', 'Hall', '1978-09-19', 'Estadounidense', 2, 'CTL022', 'Matutino'),

-- United Airlines
(23, 12, 12, 'Robert', 'Hernandez', 'King', '1980-08-14', 'Estadounidense', 1, 'CTL023', 'Vespertino'),
(24, 13, 12, 'Jessica', 'Wright', 'Lopez', '1985-06-30', 'Estadounidense', 2, 'CTL024', 'Nocturno'),

-- Southwest Airlines
(25, 12, 13, 'Daniel', 'Green', 'Adams', '1979-03-21', 'Estadounidense', 1, 'CTL025', 'Matutino'),
(26, 15, 13, 'Laura', 'Baker', 'Nelson', '1983-07-19', 'Estadounidense', 2, 'CTL026', 'Vespertino'),

-- JetBlue Airways
(27, 11, 14, 'Stephanie', 'Perez', 'Roberts', '1980-10-05', 'Estadounidense', 1, 'CTL027', 'Nocturno'),
(28, 15, 14, 'Brian', 'Turner', 'Phillips', '1985-03-18', 'Estadounidense', 2, 'CTL028', 'Matutino'),

-- Alaska Airlines
(29, 10, 15, 'Mark', 'Evans', 'Edwards', '1978-07-14', 'Estadounidense', 1, 'CTL029', 'Vespertino'),
(30, 14, 15, 'Olivia', 'Collins', 'Stewart', '1983-11-09', 'Estadounidense', 2, 'CTL030', 'Nocturno'),

-- Spirit Airlines
(31, 12, 16, 'Amanda', 'Rogers', 'Reed', '1982-02-13', 'Estadounidense', 1, 'CTL031', 'Matutino'),
(32, 15, 16, 'Joshua', 'Cook', 'Morgan', '1986-08-30', 'Estadounidense', 2, 'CTL032', 'Vespertino'),

-- Frontier Airlines
(33, 14, 17, 'Tyler', 'Bailey', 'Rivera', '1980-09-22', 'Estadounidense', 1, 'CTL033', 'Nocturno'),
(34, 15, 17, 'Samantha', 'Cooper', 'Cook', '1985-12-10', 'Estadounidense', 2, 'CTL034', 'Matutino');

--------BRASIL--------
-- LATAM Brasil
(35, 16, 18, 'Lucas', 'Silva', 'Souza', '1978-03-11', 'Brasileña', 1, 'CTL035', 'Matutino'),
(36, 17, 18, 'Mariana', 'Costa', 'Lima', '1982-07-24', 'Brasileña', 2, 'CTL036', 'Vespertino'),

-- Gol Linhas Aéreas
(37, 16, 19, 'Fernanda', 'Almeida', 'Ribeiro', '1980-05-17', 'Brasileña', 1, 'CTL037', 'Nocturno'),
(38, 19, 19, 'Rafael', 'Santos', 'Gomes', '1983-09-09', 'Brasileña', 2, 'CTL038', 'Matutino'),

-- Azul Linhas Aéreas
(39, 16, 20, 'Mateus', 'Rodrigues', 'Silva', '1979-04-12', 'Brasileña', 1, 'CTL039', 'Vespertino'),
(40, 17, 20, 'Camila', 'Martins', 'Pereira', '1985-08-30', 'Brasileña', 2, 'CTL040', 'Nocturno');

--------ESPAÑA--------
-- Iberia
(41, 20, 21, 'Carlos', 'García', 'Fernández', '1977-05-14', 'Española', 1, 'CTL041', 'Matutino'),
(42, 21, 21, 'Laura', 'Martínez', 'López', '1983-11-22', 'Española', 2, 'CTL042', 'Vespertino'),

-- Air Europa
(43, 20, 22, 'Ana', 'Pérez', 'Hernández', '1980-07-10', 'Española', 1, 'CTL043', 'Nocturno'),
(44, 21, 22, 'Miguel', 'Rodríguez', 'Torres', '1985-09-25', 'Española', 2, 'CTL044', 'Matutino'),

-- Vueling
(45, 22, 23, 'David', 'Ramírez', 'Santos', '1982-02-12', 'Española', 1, 'CTL045', 'Vespertino'),
(46, 23, 23, 'Elena', 'Torres', 'Jiménez', '1986-06-21', 'Española', 2, 'CTL046', 'Nocturno');

--------JAPÓN--------
-- Japan Airlines
(47, 24, 24, 'Takashi', 'Yamamoto', 'Sato', '1978-04-20', 'Japonesa', 1, 'CTL047', 'Matutino'),
(48, 26, 24, 'Hiroshi', 'Nakamura', 'Fujimoto', '1982-01-11', 'Japonesa', 1, 'CTL049', 'Nocturno');





--SOBRECARGO
INSERT INTO sobrecargo (id_empleado, id_aeropuerto, id_aerolinea, nombre, apellido_paterno, apellido_materno, fecha_de_nacimiento, nacionalidad, años_experiencia) VALUES
--------MÉXICO--------
--------Aerolineas Mexicanas (Aeroméxico)
(1, 1, 1, 'Sofía', 'Ramírez', 'Gómez', '1985-03-12', 'Mexicana', 10),
(2, 2, 1, 'Diego', 'Hernández', 'Pérez', '1982-07-20', 'Mexicana', 12),
(3, 3, 1, 'Valentina', 'López', 'Santos', '1990-11-05', 'Mexicana', 8),

--------Volaris
(4, 2, 2, 'Mariana', 'Torres', 'Hernández', '1986-09-14', 'Mexicana', 7),
(5, 3, 2, 'Javier', 'Flores', 'Ramos', '1983-05-22', 'Mexicana', 11),
(6, 4, 2, 'Lucía', 'Vega', 'Martínez', '1991-12-03', 'Mexicana', 6),

--------Viva Aerobus
(7, 1, 3, 'Andrés', 'Cruz', 'López', '1984-02-28', 'Mexicana', 10),
(8, 2, 3, 'Paola', 'Soto', 'Ramírez', '1989-06-15', 'Mexicana', 7),
(9, 3, 3, 'Eduardo', 'Morales', 'Gómez', '1992-10-21', 'Mexicana', 5),

--------Interjet
(10, 4, 4, 'Ana', 'Hernández', 'Torres', '1985-11-19', 'Mexicana', 9),
(11, 6, 4, 'Miguel', 'Gómez', 'Vega', '1981-07-30', 'Mexicana', 12),
(12, 7, 4, 'Sofía', 'Ramírez', 'Mendoza', '1988-04-05', 'Mexicana', 6),

--------Calafia Airlines
(13, 6, 5, 'Laura', 'Santos', 'Vega', '1983-01-12', 'Mexicana', 8),
(14, 7, 5, 'Diego', 'Ramos', 'Morales', '1987-09-21', 'Mexicana', 9),
(15, 8, 5, 'Paola', 'Hernández', 'Gómez', '1990-03-30', 'Mexicana', 6),

--------Aeromar
(16, 1, 6, 'Javier', 'Martínez', 'Torres', '1982-08-10', 'Mexicana', 11),
(17, 2, 6, 'Lucía', 'Gómez', 'Ramírez', '1985-02-17', 'Mexicana', 9),
(18, 3, 6, 'Carlos', 'López', 'Santos', '1988-06-04', 'Mexicana', 7),

--------Aerus
(19, 1, 7, 'Ana', 'Cruz', 'Morales', '1984-09-25', 'Mexicana', 8),
(20, 2, 7, 'Luis', 'Torres', 'Vega', '1987-03-13', 'Mexicana', 7),
(21, 3, 7, 'Mariana', 'Ramírez', 'Gómez', '1990-12-05', 'Mexicana', 6),

--------Magnicharters
(22, 4, 8, 'Eduardo', 'Hernández', 'Soto', '1983-04-18', 'Mexicana', 9),
(23, 1, 8, 'Paola', 'Morales', 'Ramírez', '1986-08-22', 'Mexicana', 7),
(24, 2, 8, 'Diego', 'Vega', 'González', '1989-11-11', 'Mexicana', 6),

--------Mexicana de Aviación
(25, 1, 9, 'Juan', 'Ramírez', 'Torres', '1981-05-16', 'Mexicana', 12),
(26, 2, 9, 'María', 'González', 'Hernández', '1984-09-23', 'Mexicana', 10),
(27, 3, 9, 'Carlos', 'Ramírez', 'Vega', '1987-12-07', 'Mexicana', 8),

--------ESTADOS UNIDOS--------
--------American Airlines
(28, 10, 10, 'John', 'Smith', 'Johnson', '1982-03-15', 'Estadounidense', 12),
(29, 11, 10, 'Emily', 'Davis', 'Brown', '1985-07-20', 'Estadounidense', 10),
(30, 12, 10, 'Michael', 'Wilson', 'Taylor', '1983-11-05', 'Estadounidense', 8),

--------Delta Air Lines
(31, 11, 11, 'Sarah', 'Moore', 'Clark', '1984-05-07', 'Estadounidense', 11),
(32, 12, 11, 'James', 'White', 'Hall', '1980-11-23', 'Estadounidense', 13),
(33, 14, 11, 'Anna', 'Young', 'Allen', '1990-02-28', 'Estadounidense', 7),

--------United Airlines
(34, 12, 12, 'Robert', 'Hernandez', 'King', '1979-08-14', 'Estadounidense', 14),
(35, 13, 12, 'Jessica', 'Wright', 'Lopez', '1987-06-30', 'Estadounidense', 9),
(36, 10, 12, 'William', 'Hill', 'Scott', '1985-12-05', 'Estadounidense', 8),

--------Southwest Airlines
(37, 12, 13, 'Daniel', 'Green', 'Adams', '1984-03-21', 'Estadounidense', 12),
(38, 13, 13, 'Laura', 'Baker', 'Nelson', '1990-07-19', 'Estadounidense', 9),
(39, 15, 13, 'Kevin', 'Carter', 'Mitchell', '1988-09-12', 'Estadounidense', 7),

--------JetBlue Airways
(40, 11, 14, 'Stephanie', 'Perez', 'Roberts', '1985-10-05', 'Estadounidense', 11),
(41, 15, 14, 'Brian', 'Turner', 'Phillips', '1982-03-18', 'Estadounidense', 12),
(42, 10, 14, 'Rachel', 'Campbell', 'Parker', '1991-01-22', 'Estadounidense', 7),

--------Alaska Airlines
(43, 10, 15, 'Mark', 'Evans', 'Edwards', '1980-07-14', 'Estadounidense', 13),
(44, 14, 15, 'Olivia', 'Collins', 'Stewart', '1986-11-09', 'Estadounidense', 10),
(45, 12, 15, 'Nathan', 'Sanchez', 'Morris', '1983-05-25', 'Estadounidense', 11),

--------Spirit Airlines
(46, 15, 16, 'Amanda', 'Rogers', 'Reed', '1988-02-13', 'Estadounidense', 9),
(47, 12, 16, 'Joshua', 'Cook', 'Morgan', '1985-08-30', 'Estadounidense', 11),
(48, 13, 16, 'Megan', 'Bell', 'Murphy', '1990-06-17', 'Estadounidense', 7),

--------Frontier Airlines
(49, 14, 17, 'Tyler', 'Bailey', 'Rivera', '1982-09-22', 'Estadounidense', 12),
(50, 15, 17, 'Samantha', 'Cooper', 'Cook', '1987-12-10', 'Estadounidense', 9),
(51, 12, 17, 'Brandon', 'Ward', 'Morgan', '1991-04-03', 'Estadounidense', 8),


--------BRASIL--------
--------LATAM Brasil
(52, 16, 18, 'Lucas', 'Silva', 'Souza', '1980-03-11', 'Brasileña', 12),
(53, 17, 18, 'Mariana', 'Costa', 'Lima', '1985-07-24', 'Brasileña', 10),
(54, 18, 18, 'Pedro', 'Oliveira', 'Mendes', '1982-11-03', 'Brasileña', 8),

--------Gol Linhas Aéreas
(55, 16, 19, 'Fernanda', 'Almeida', 'Ribeiro', '1983-05-17', 'Brasileña', 11),
(56, 19, 19, 'Rafael', 'Santos', 'Gomes', '1987-09-09', 'Brasileña', 9),
(57, 18, 19, 'Juliana', 'Ferreira', 'Costa', '1990-02-25', 'Brasileña', 7),

--------Azul Linhas Aéreas
(58, 16, 20, 'Mateus', 'Rodrigues', 'Silva', '1984-04-12', 'Brasileña', 10),
(59, 17, 20, 'Camila', 'Martins', 'Pereira', '1988-08-30', 'Brasileña', 8),
(60, 19, 20, 'Gustavo', 'Lima', 'Santos', '1982-12-18', 'Brasileña', 9),

--------ESPAÑA--------
--------Iberia
(61, 20, 21, 'Carlos', 'García', 'Fernández', '1978-05-14', 'Española', 14),
(62, 21, 21, 'Laura', 'Martínez', 'López', '1985-11-22', 'Española', 10),
(63, 22, 21, 'Javier', 'Sánchez', 'Gómez', '1983-03-03', 'Española', 9),

--------Air Europa
(64, 20, 22, 'Ana', 'Pérez', 'Hernández', '1984-07-10', 'Española', 11),
(65, 21, 22, 'Miguel', 'Rodríguez', 'Torres', '1987-09-25', 'Española', 9),
(66, 23, 22, 'Lucía', 'Gómez', 'Vargas', '1990-01-15', 'Española', 8),

--------Vueling
(67, 21, 23, 'David', 'Ramírez', 'Santos', '1982-02-12', 'Española', 12),
(68, 22, 23, 'Elena', 'Torres', 'Jiménez', '1989-06-21', 'Española', 9),
(69, 23, 23, 'Sergio', 'Castillo', 'Moreno', '1985-10-09', 'Española', 8),

--------JAPÓN--------
--------Japan Airlines
(70, 24, 24, 'Takashi', 'Yamamoto', 'Sato', '1978-04-20', 'Japonesa', 14),
(71, 25, 24, 'Yuki', 'Tanaka', 'Kobayashi', '1985-09-18', 'Japonesa', 10),
(72, 26, 24, 'Hiroshi', 'Nakamura', 'Fujimoto', '1982-01-11', 'Japonesa', 11),
(73, 27, 24, 'Miyuki', 'Ito', 'Kawasaki', '1990-06-25', 'Japonesa', 9);
















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
