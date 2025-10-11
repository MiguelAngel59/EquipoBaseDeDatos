--INSERT

--AEROPUERTOS
-- México 🇲🇽
INSERT INTO aeropuerto VALUES (1, 'Aeropuerto Internacional de la Ciudad de México', 'INTERNACIONAL', 'México', 'Ciudad de México', 'MEX');
INSERT INTO aeropuerto VALUES (2, 'Aeropuerto Internacional de Guadalajara', 'INTERNACIONAL', 'México', 'Guadalajara', 'GDL');
INSERT INTO aeropuerto VALUES (3, 'Aeropuerto Internacional de Monterrey', 'INTERNACIONAL', 'México', 'Monterrey', 'MTY');
INSERT INTO aeropuerto VALUES (4, 'Aeropuerto Internacional de Cancún', 'INTERNACIONAL', 'México', 'Cancún', 'CUN');
INSERT INTO aeropuerto VALUES (5, 'Nuevo Aeropuerto Internacional de México', 'INTERNACIONAL', 'México', 'Ciudad de México', null);               --BORRAR
INSERT INTO aeropuerto VALUES (6, 'Aeropuerto Internacional de Mérida', 'NACIONAL', 'México', 'Mérida', 'MID');
INSERT INTO aeropuerto VALUES (7, 'Aeropuerto Nacional de Oaxaca', 'NACIONAL', 'México', 'Oaxaca', 'OAX');
INSERT INTO aeropuerto VALUES (8, 'Aeropuerto Internacional de Querétaro', 'NACIONAL', 'México', 'Querétaro', 'QRO');
INSERT INTO aeropuerto VALUES (9, 'Aeropuerto Internacional de León-Bajío', 'NACIONAL', 'México', 'León', 'BJX');

-- Estados Unidos 🇺🇸
INSERT INTO aeropuerto VALUES (10, 'Los Angeles International Airport', 'INTERNACIONAL', 'Estados Unidos', 'Los Ángeles', 'LAX');
INSERT INTO aeropuerto VALUES (11, 'John F. Kennedy International Airport', 'INTERNACIONAL', 'Estados Unidos', 'Nueva York', 'JFK');
INSERT INTO aeropuerto VALUES (12, 'Dallas/Fort Worth International Airport', 'INTERNACIONAL', 'Estados Unidos', 'Dallas', 'DFW');
INSERT INTO aeropuerto VALUES (13, 'Chicago Midway Airport', 'NACIONAL', 'Estados Unidos', 'Chicago', 'MDW');
INSERT INTO aeropuerto VALUES (14, 'Denver International Airport', 'INTERNACIONAL', 'Estados Unidos', 'Denver', 'DEN');
INSERT INTO aeropuerto VALUES (15, 'Orlando International Airport', 'INTERNACIONAL', 'Estados Unidos', 'Orlando', 'MCO');

-- Brasil 🇧🇷
INSERT INTO aeropuerto VALUES (16, 'Aeroporto Internacional de São Paulo-Guarulhos', 'INTERNACIONAL', 'Brasil', 'São Paulo', 'GRU');
INSERT INTO aeropuerto VALUES (17, 'Aeroporto Internacional de Brasília', 'INTERNACIONAL', 'Brasil', 'Brasília', 'BSB');
INSERT INTO aeropuerto VALUES (18, 'Aeroporto Santos Dumont', 'NACIONAL', 'Brasil', 'Río de Janeiro', 'SDU');
INSERT INTO aeropuerto VALUES (19, 'Aeroporto Internacional Tancredo Neves', 'NACIONAL', 'Brasil', 'Belo Horizonte', 'CNF');

-- España 🇪🇸
INSERT INTO aeropuerto VALUES (20, 'Aeropuerto Adolfo Suárez Madrid-Barajas', 'INTERNACIONAL', 'España', 'Madrid', 'MAD');
INSERT INTO aeropuerto VALUES (21, 'Aeropuerto de Barcelona-El Prat', 'INTERNACIONAL', 'España', 'Barcelona', 'BCN');
INSERT INTO aeropuerto VALUES (22, 'Aeropuerto de Málaga-Costa del Sol', 'NACIONAL', 'España', 'Málaga', 'AGP');
INSERT INTO aeropuerto VALUES (23, 'Aeropuerto de Valencia', 'NACIONAL', 'España', 'Valencia', 'VLC');

-- Japón 🇯🇵
INSERT INTO aeropuerto VALUES (24, 'Tokyo Haneda International Airport', 'INTERNACIONAL', 'Japón', 'Tokio', 'HND');
INSERT INTO aeropuerto VALUES (25, 'Kansai International Airport', 'INTERNACIONAL', 'Japón', 'Osaka', 'KIX');
INSERT INTO aeropuerto VALUES (26, 'New Chitose Airport', 'NACIONAL', 'Japón', 'Sapporo', 'CTS');
INSERT INTO aeropuerto VALUES (27, 'Fukuoka Airport', 'NACIONAL', 'Japón', 'Fukuoka', 'FUK');



-- TERMINALES
-- México (Terminales de MEX)
-- Aeropuerto MEX (id = 1) — tiene 2 terminales reales. :contentReference[oaicite:0]{index=0}
INSERT INTO terminal VALUES (1, 1, 50, 20000);  -- Terminal 1 en MEX: capacidad estimada de aviones 50, público 20 000
INSERT INTO terminal VALUES (1, 2, 40, 15000);  -- Terminal 2 en MEX: capacidad de 40 aviones, público 15 000
-- Guadalajara (GDL, id = 2)
INSERT INTO terminal VALUES (2, 1, 20, 8000);
INSERT INTO terminal VALUES (2, 2, 10, 4000);
-- Monterrey (MTY, id = 3)
INSERT INTO terminal VALUES (3, 1, 18, 7000);
-- Cancún (CUN, id = 4)
INSERT INTO terminal VALUES (4, 1, 25, 10000);
INSERT INTO terminal VALUES (4, 2, 15, 6000);
-- NAIM (TIJ, id = 5)
--       NO HAY
-- Mérida (MID, id = 6)
INSERT INTO terminal VALUES (6, 1, 8, 3000);
-- Oaxaca (OAX, id = 7)
INSERT INTO terminal VALUES (7, 1, 6, 2000);
-- Querétaro (QRO, id = 8)
INSERT INTO terminal VALUES (8, 1, 10, 4000);
-- León-Bajío (BJX, id = 9)
INSERT INTO terminal VALUES (9, 1, 10, 4000);

-- Estados Unidos
-- LAX (Los Ángeles, id = 10) — tiene 9 terminales según datos reales :contentReference[oaicite:1]{index=1}
INSERT INTO terminal VALUES (10, 1, 20, 8000);
INSERT INTO terminal VALUES (10, 2, 18, 7000);
INSERT INTO terminal VALUES (10, 3, 22, 9000);
INSERT INTO terminal VALUES (10, 4, 16, 6000);
INSERT INTO terminal VALUES (10, 5, 15, 6000);
INSERT INTO terminal VALUES (10, 6, 12, 5000);
INSERT INTO terminal VALUES (10, 7, 14, 5500);
INSERT INTO terminal VALUES (10, 8, 14, 5500);
INSERT INTO terminal VALUES (10, 9, 25, 10000);
-- JFK (Nueva York, id = 11)
INSERT INTO terminal VALUES (11, 1, 30, 12000);
INSERT INTO terminal VALUES (11, 2, 25, 10000);
INSERT INTO terminal VALUES (11, 3, 20, 8000);
-- DFW (Dallas/Fort Worth, id = 12)
INSERT INTO terminal VALUES (12, 1, 28, 11000);
INSERT INTO terminal VALUES (12, 2, 22, 9000);
INSERT INTO terminal VALUES (12, 3, 18, 7000);
-- MDW (Chicago Midway, id = 13)
INSERT INTO terminal VALUES (13, 1, 10, 4000);
-- DEN (Denver, id = 14)
INSERT INTO terminal VALUES (14, 1, 15, 6000);
INSERT INTO terminal VALUES (14, 2, 10, 4000);
-- MCO (Orlando, id = 15)
INSERT INTO terminal VALUES (15, 1, 20, 8000);
INSERT INTO terminal VALUES (15, 2, 15, 6000);
INSERT INTO terminal VALUES (15, 3, 12, 5000);

-- Brasil
-- GRU (São Paulo-Guarulhos, id = 16)
INSERT INTO terminal VALUES (16, 1, 35, 14000);
INSERT INTO terminal VALUES (16, 2, 25, 10000);
INSERT INTO terminal VALUES (16, 3, 20, 8000);
-- BSB (Brasilia, id = 17)
INSERT INTO terminal VALUES (17, 1, 20, 8000);
-- SDU (Rio de Janeiro, id = 18)
INSERT INTO terminal VALUES (18, 1, 15, 6000);
-- CNF (Belo Horizonte, id = 19)
INSERT INTO terminal VALUES (19, 1, 12, 5000);

-- España
-- MAD (Madrid-Barajas, id = 20)
INSERT INTO terminal VALUES (20, 1, 30, 12000);
INSERT INTO terminal VALUES (20, 2, 25, 10000);
INSERT INTO terminal VALUES (20, 3, 18, 7000);
INSERT INTO terminal VALUES (20, 4, 15, 5000);
-- BCN (Barcelona, id = 21)
INSERT INTO terminal VALUES (21, 1, 22, 9000);
INSERT INTO terminal VALUES (21, 2, 18, 7000);
-- AGP (Málaga, id = 22)
INSERT INTO terminal VALUES (22, 1, 12, 5000);
-- VLC (Valencia, id = 23)
INSERT INTO terminal VALUES (23, 1, 10, 4000);

-- Japón
-- HND (Tokio Haneda, id = 24) — tiene 3 terminales reales :contentReference[oaicite:2]{index=2}
INSERT INTO terminal VALUES (24, 1, 20, 8000);
INSERT INTO terminal VALUES (24, 2, 18, 7000);
INSERT INTO terminal VALUES (24, 3, 25, 10000);
-- KIX (Osaka Kansai, id = 25)
INSERT INTO terminal VALUES (25, 1, 15, 6000);
-- CTS (Sapporo New Chitose, id = 26)
INSERT INTO terminal VALUES (26, 1, 12, 5000);
-- FUK (Fukuoka, id = 27)
INSERT INTO terminal VALUES (27, 1, 10, 4000);






-- AEROLÍNEAS
-- México
INSERT INTO aerolinea VALUES (1,  'Aerolíneas Mexicanas', 'México', 'AMX', '1934-09-14');  -- Aeroméxico
INSERT INTO aerolinea VALUES (2,  'Volaris',               'México', 'VOI', '2005-03-13');
INSERT INTO aerolinea VALUES (3,  'Viva Aerobus',          'México', 'VIV', '2006-11-30');
INSERT INTO aerolinea VALUES (4,  'Interjet',              'México', 'AIJ', '2005-12-01');
INSERT INTO aerolinea VALUES (5,  'Calafia Airlines',      'México', 'CFV', '1993-01-01');
INSERT INTO aerolinea VALUES (6,  'Aeromar',               'México', 'TAO', '1987-01-29');
INSERT INTO aerolinea VALUES (7,  'Aerus',                 'México', 'NCS', '2023-04-27');
INSERT INTO aerolinea VALUES (8,  'Magnicharters',         'México', 'GMT', '1994-01-01');
INSERT INTO aerolinea VALUES (9,  'Mexicana de Aviación',  'México', 'MXA', '1921-07-12');

-- Estados Unidos
INSERT INTO aerolinea VALUES (10, 'American Airlines',     'Estados Unidos', 'AAL', '1930-04-15');
INSERT INTO aerolinea VALUES (11, 'Delta Air Lines',       'Estados Unidos', 'DAL', '1925-03-02');
INSERT INTO aerolinea VALUES (12, 'United Airlines',       'Estados Unidos', 'UAL', '1926-04-06');
INSERT INTO aerolinea VALUES (13, 'Southwest Airlines',    'Estados Unidos', 'SWA', '1967-03-15');
INSERT INTO aerolinea VALUES (14, 'JetBlue Airways',       'Estados Unidos', 'JBU', '1998-08-01');
INSERT INTO aerolinea VALUES (15, 'Alaska Airlines',       'Estados Unidos', 'ASA', '1932-04-14');
INSERT INTO aerolinea VALUES (16, 'Spirit Airlines',       'Estados Unidos', 'NKS', '1983-06-01');
INSERT INTO aerolinea VALUES (17, 'Frontier Airlines',     'Estados Unidos', 'FFT', '1994-02-08');

-- Brasil
INSERT INTO aerolinea VALUES (18, 'LATAM Brasil',          'Brasil', 'TAM', '1976-01-01');
INSERT INTO aerolinea VALUES (19, 'Gol Linhas Aéreas',     'Brasil', 'GLO', '2001-01-15');
INSERT INTO aerolinea VALUES (20, 'Azul Linhas Aéreas',    'Brasil', 'AZU', '2008-05-05');

-- España
INSERT INTO aerolinea VALUES (21, 'Iberia',                'España', 'IBE', '1927-06-28');
INSERT INTO aerolinea VALUES (22, 'Air Europa',            'España', 'AEA', '1986-02-21');
INSERT INTO aerolinea VALUES (23, 'Vueling',               'España', 'VLG', '2004-07-01');

-- Japón
INSERT INTO aerolinea VALUES (24, 'Japan Airlines',        'Japón', 'JAL', '1951-08-01');
INSERT INTO aerolinea VALUES (25, 'All Nippon Airways',    'Japón', 'ANA', '1952-12-27');          --BORRAR



-- AVIONES
---------------MEXICO------------------
-- Aeroméxico
INSERT INTO avion VALUES
(1, 1, 1, 'Boeing 737-800', 160),
(2, 1, 1, 'Boeing 737 MAX 9', 180),
(3, 2, 1, 'Boeing 787-9 Dreamliner', 290),
(4, 3, 1, 'Embraer 190', 99),
(5, 4, 1, 'Boeing 737-700', 144),
(6, 1, 1, 'Boeing 737 MAX 8', 175),
(7, 2, 1, 'Boeing 787-8 Dreamliner', 250);

-- Volaris
INSERT INTO avion VALUES
(8, 2, 2, 'Airbus A320neo', 186),
(9, 3, 2, 'Airbus A321neo', 230),
(10, 4, 2, 'Airbus A319', 144),
(11, 1, 2, 'Airbus A320', 174),
(12, 2, 2, 'Airbus A320neo', 186),
(13, 3, 2, 'Airbus A321', 220),
(14, 4, 2, 'Airbus A320neo', 186);

-- Viva Aerobus
INSERT INTO avion VALUES
(15, 1, 3, 'Airbus A320', 180),
(16, 2, 3, 'Airbus A321neo', 230),
(17, 3, 3, 'Airbus A320neo', 186),
(18, 4, 3, 'Airbus A321', 220),
(19, 2, 3, 'Airbus A320', 180),
(20, 3, 3, 'Airbus A321neo', 230),
(21, 4, 3, 'Airbus A320', 180);

-- Interjet
INSERT INTO avion VALUES
(22, 1, 4, 'Sukhoi Superjet 100', 93),
(23, 2, 4, 'Airbus A320', 174),
(24, 3, 4, 'Airbus A321', 220),
(25, 4, 4, 'Airbus A320neo', 186),
(26, 1, 4, 'Sukhoi Superjet 100', 98),
(27, 2, 4, 'Airbus A320', 180),
(28, 3, 4, 'Airbus A320neo', 186);

-- Calafia Airlines
INSERT INTO avion VALUES
(29, 4, 5, 'Embraer ERJ-145', 50),
(30, 3, 5, 'Cessna 208 Caravan', 12),
(31, 4, 5, 'Embraer EMB-120', 30),
(32, 2, 5, 'Embraer ERJ-145', 50),
(33, 3, 5, 'Cessna 208 Caravan', 12),
(34, 1, 5, 'Embraer ERJ-135', 37),
(35, 4, 5, 'Embraer EMB-120', 30);

-- Aeromar
INSERT INTO avion VALUES
(36, 4, 6, 'ATR 72-600', 70),
(37, 3, 6, 'ATR 42-500', 50),
(38, 1, 6, 'ATR 72-600', 70),
(39, 2, 6, 'ATR 42-300', 48),
(40, 4, 6, 'ATR 72-600', 70),
(41, 3, 6, 'ATR 42-500', 50),
(42, 1, 6, 'ATR 72-600', 70);

-- Aerus
INSERT INTO avion VALUES
(43, 3, 7, 'Cessna 408 SkyCourier', 19),
(44, 4, 7, 'Pilatus PC-12', 9),
(45, 2, 7, 'Cessna 208 Caravan', 12),
(46, 1, 7, 'Cessna 408 SkyCourier', 19),
(47, 3, 7, 'Pilatus PC-12', 9),
(48, 4, 7, 'Cessna 208 Caravan', 12),
(49, 1, 7, 'Cessna 408 SkyCourier', 19);

-- Magnicharters
INSERT INTO avion VALUES
(50, 1, 8, 'Boeing 737-300', 148),
(51, 2, 8, 'Boeing 737-200', 130),
(52, 3, 8, 'Boeing 737-300', 148),
(53, 4, 8, 'Boeing 737-400', 159),
(54, 1, 8, 'Boeing 737-300', 148),
(55, 2, 8, 'Boeing 737-200', 130),
(56, 3, 8, 'Boeing 737-400', 159);

-- Mexicana de Aviación
INSERT INTO avion VALUES
(57, 1, 9, 'Airbus A320', 174),
(58, 2, 9, 'Airbus A319', 144),
(59, 3, 9, 'Boeing 757-200', 200),
(60, 4, 9, 'Airbus A320neo', 186),
(61, 1, 9, 'Airbus A320', 174),
(62, 2, 9, 'Boeing 737-800', 160),
(63, 3, 9, 'Airbus A321', 220);

---------------EU------------------
-- American Airlines
INSERT INTO avion VALUES
(64, 6, 10, 'Boeing 737-800', 160),
(65, 7, 10, 'Airbus A321', 220),
(66, 8, 10, 'Boeing 777-200ER', 305),
(67, 9, 10, 'Boeing 787-8 Dreamliner', 248),
(68, 10, 10, 'Airbus A319', 144),
(69, 11, 10, 'Boeing 737 MAX 8', 172),
(70, 12, 10, 'Airbus A320', 174);

-- Delta Airlines
INSERT INTO avion VALUES
(71, 6, 11, 'Boeing 737-900ER', 180),
(72, 7, 11, 'Airbus A321', 220),
(73, 8, 11, 'Airbus A350-900', 315),
(74, 9, 11, 'Boeing 767-400ER', 245),
(75, 10, 11, 'Airbus A220-100', 120),
(76, 11, 11, 'Boeing 757-300', 243),
(77, 12, 11, 'Airbus A321neo', 228);

-- United Airlines
INSERT INTO avion VALUES
(78, 6, 12, 'Boeing 737 MAX 9', 179),
(79, 7, 12, 'Boeing 757-200', 200),
(80, 8, 12, 'Boeing 787-9 Dreamliner', 290),
(81, 9, 12, 'Airbus A320', 174),
(82, 10, 12, 'Boeing 767-300ER', 218),
(83, 11, 12, 'Airbus A321', 220),
(84, 12, 12, 'Boeing 777-200', 312);

-- Southwest Airlines
INSERT INTO avion VALUES
(85, 6, 13, 'Boeing 737-700', 143),
(86, 7, 13, 'Boeing 737-800', 175),
(87, 8, 13, 'Boeing 737 MAX 8', 175),
(88, 9, 13, 'Boeing 737-700', 143),
(89, 10, 13, 'Boeing 737-800', 175),
(90, 11, 13, 'Boeing 737 MAX 8', 175),
(91, 12, 13, 'Boeing 737-700', 143);

-- JetBlue Airways
INSERT INTO avion VALUES
(92, 6, 14, 'Airbus A320', 162),
(93, 7, 14, 'Airbus A321neo', 200),
(94, 8, 14, 'Airbus A220-300', 140),
(95, 9, 14, 'Airbus A320neo', 174),
(96, 10, 14, 'Airbus A321LR', 200),
(97, 11, 14, 'Embraer E190', 100),
(98, 12, 14, 'Airbus A321', 220);

-- Alaska Airlines
INSERT INTO avion VALUES
(99, 6, 15, 'Boeing 737-800', 160),
(100, 7, 15, 'Boeing 737-900ER', 178),
(101, 8, 15, 'Boeing 737 MAX 9', 178),
(102, 9, 15, 'Embraer 175', 76),
(103, 10, 15, 'Boeing 737-800', 160),
(104, 11, 15, 'Boeing 737-900ER', 178),
(105, 12, 15, 'Embraer 175', 76);

-- Spirit Airlines
INSERT INTO avion VALUES
(106, 6, 16, 'Airbus A320', 174),
(107, 7, 16, 'Airbus A321', 220),
(108, 8, 16, 'Airbus A320neo', 186),
(109, 9, 16, 'Airbus A319', 144),
(110, 10, 16, 'Airbus A320neo', 186),
(111, 11, 16, 'Airbus A321neo', 230),
(112, 12, 16, 'Airbus A320', 174);

-- Frontier Airlines
INSERT INTO avion VALUES
(113, 6, 17, 'Airbus A320neo', 186),
(114, 7, 17, 'Airbus A321', 220),
(115, 8, 17, 'Airbus A320', 180),
(116, 9, 17, 'Airbus A321neo', 230),
(117, 10, 17, 'Airbus A320', 174),
(118, 11, 17, 'Airbus A321', 220),
(119, 12, 17, 'Airbus A320neo', 186);

----------BRASIL------------
-- LATAM Brasil
INSERT INTO avion VALUES
(120, 14, 18, 'Airbus A321', 220),
(121, 15, 18, 'Boeing 767-300ER', 238),
(122, 16, 18, 'Airbus A320', 174),
(123, 14, 18, 'Airbus A319', 144),
(124, 15, 18, 'Boeing 787-9 Dreamliner', 296),
(125, 16, 18, 'Airbus A321neo', 230),
(126, 15, 18, 'Airbus A320neo', 186);

-- GOL Linhas Aéreas
INSERT INTO avion VALUES
(127, 14, 19, 'Boeing 737-800', 176),
(128, 15, 19, 'Boeing 737 MAX 8', 186),
(129, 16, 19, 'Boeing 737-700', 144),
(130, 14, 19, 'Boeing 737-800', 176),
(131, 15, 19, 'Boeing 737 MAX 8', 186),
(132, 16, 19, 'Boeing 737-800', 176),
(133, 15, 19, 'Boeing 737 MAX 8', 186);

-- Azul Linhas Aéreas Brasileiras
INSERT INTO avion VALUES
(134, 14, 20, 'Airbus A320neo', 174),
(135, 15, 20, 'Embraer 195-E2', 136),
(136, 16, 20, 'Airbus A321neo', 220),
(137, 14, 20, 'ATR 72-600', 70),
(138, 15, 20, 'Airbus A320', 174),
(139, 16, 20, 'Airbus A320neo', 186),
(140, 15, 20, 'Embraer 190', 114);

-------------ESPAÑA-------------
-- Iberia
INSERT INTO avion VALUES
(155, 19, 23, 'Airbus A320neo', 186),
(156, 20, 23, 'Airbus A321', 220),
(157, 19, 23, 'Airbus A330-300', 288),
(158, 20, 23, 'Airbus A350-900', 348),
(159, 19, 23, 'Airbus A319', 144),
(160, 20, 23, 'Airbus A321neo', 230),
(161, 19, 23, 'Airbus A320', 174);

-- Vueling Airlines
INSERT INTO avion VALUES
(162, 19, 24, 'Airbus A320', 180),
(163, 20, 24, 'Airbus A321', 220),
(164, 19, 24, 'Airbus A320neo', 186),
(165, 20, 24, 'Airbus A319', 144),
(166, 19, 24, 'Airbus A320', 174),
(167, 20, 24, 'Airbus A321neo', 230),
(168, 19, 24, 'Airbus A320neo', 186);

-------------JAPÓN------------
-- Aviones de Japan Airlines
INSERT INTO avion VALUES
(169, 24, 24, 'Boeing 787-9 Dreamliner', 296),
(170, 25, 24, 'Boeing 777-300ER', 396),
(171, 26, 24, 'Airbus A350-900', 325),
(172, 27, 24, 'Boeing 737-800', 189),
(173, 24, 24, 'Boeing 767-300ER', 218);

















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
