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
INSERT INTO terminal (id_terminal, id_aeropuerto, numero_terminal, nombre, capacidad_aviones) VALUES
-- México -------------------------------------------------
-- Aeropuerto MEX (id = 1)
(1, 1, 1, 'Terminal 1', 50),
(2, 1, 2, 'Terminal 2', 40),
-- Guadalajara (GDL, id = 2)
(3, 2, 1, 'Terminal 1', 20),
(4, 2, 2, 'Terminal 2', 10),
-- Monterrey (MTY, id = 3)
(5, 3, 1, 'Terminal 1', 18),
-- Cancún (CUN, id = 4)
(6, 4, 1, 'Terminal 1', 25),
(7, 4, 2, 'Terminal 2', 15),
-- NAIM (id = 5)
-- No se insertan terminales
-- Mérida (MID, id = 6)
(8, 6, 1, 'Terminal 1', 8),
-- Oaxaca (OAX, id = 7)
(9, 7, 1, 'Terminal 1', 6),
-- Querétaro (QRO, id = 8)
(10, 8, 1, 'Terminal 1', 10),
-- León-Bajío (BJX, id = 9)
(11, 9, 1, 'Terminal 1', 10),

-- Estados Unidos -----------------------------------------
-- LAX (id = 10) — 9 terminales
(12, 10, 1, 'Terminal 1', 20),
(13, 10, 2, 'Terminal 2', 18),
(14, 10, 3, 'Terminal 3', 22),
(15, 10, 4, 'Terminal 4', 16),
(16, 10, 5, 'Terminal 5', 15),
(17, 10, 6, 'Terminal 6', 12),
(18, 10, 7, 'Terminal 7', 14),
(19, 10, 8, 'Terminal 8', 14),
(20, 10, 9, 'Terminal Tom Bradley', 25),
-- JFK (id = 11)
(21, 11, 1, 'Terminal 1', 30),
(22, 11, 2, 'Terminal 2', 25),
(23, 11, 3, 'Terminal 3', 20),
-- DFW (id = 12)
(24, 12, 1, 'Terminal A', 28),
(25, 12, 2, 'Terminal B', 22),
(26, 12, 3, 'Terminal C', 18),
-- MDW (id = 13)
(27, 13, 1, 'Terminal Única', 10),
-- DEN (id = 14)
(28, 14, 1, 'Terminal A', 15),
(29, 14, 2, 'Terminal B', 10),
-- MCO (id = 15)
(30, 15, 1, 'Terminal A', 20),
(31, 15, 2, 'Terminal B', 15),
(32, 15, 3, 'Terminal C', 12),

-- Brasil ---------------------------------------------------
-- GRU (id = 16)
(33, 16, 1, 'Terminal 1', 35),
(34, 16, 2, 'Terminal 2', 25),
(35, 16, 3, 'Terminal 3', 20),
-- BSB (id = 17)
(36, 17, 1, 'Terminal 1', 20),
-- SDU (id = 18)
(37, 18, 1, 'Terminal 1', 15),
-- CNF (id = 19)
(38, 19, 1, 'Terminal 1', 12),

-- España ---------------------------------------------------
-- MAD (id = 20)
(39, 20, 1, 'Terminal 1', 30),
(40, 20, 2, 'Terminal 2', 25),
(41, 20, 3, 'Terminal 3', 18),
(42, 20, 4, 'Terminal 4', 15),
-- BCN (id = 21)
(43, 21, 1, 'Terminal 1', 22),
(44, 21, 2, 'Terminal 2', 18),
-- AGP (id = 22)
(45, 22, 1, 'Terminal 1', 12),
-- VLC (id = 23)
(46, 23, 1, 'Terminal 1', 10),

-- Japón ----------------------------------------------------
-- HND (id = 24)
(47, 24, 1, 'Terminal 1', 20),
(48, 24, 2, 'Terminal 2', 18),
(49, 24, 3, 'Terminal 3', 25),
-- KIX (id = 25)
(50, 25, 1, 'Terminal 1', 15),
-- CTS (id = 26)
(51, 26, 1, 'Terminal 1', 12),
-- FUK (id = 27)
(52, 27, 1, 'Terminal 1', 10);





-- PUERTAS
INSERT INTO puerta (id_puerta, id_terminal, numero_puerta, codigo, capacidad_publico) VALUES
-- México -------------------------------------------------
-- Aeropuerto MEX (terminales 1 y 2)
(1, 1, 1, 'MEX-T1-1', 300),
(2, 1, 2, 'MEX-T1-2', 300),
(3, 1, 3, 'MEX-T1-3', 300),
(4, 2, 1, 'MEX-T2-1', 250),
(5, 2, 2, 'MEX-T2-2', 250),
(6, 2, 3, 'MEX-T2-3', 250),
-- Guadalajara (GDL)
(7, 3, 1, 'GDL-T1-1', 150),
(8, 3, 2, 'GDL-T1-2', 150),
(9, 4, 1, 'GDL-T2-1', 120),
(10, 4, 2, 'GDL-T2-2', 120),
-- Monterrey
(11, 5, 1, 'MTY-T1-1', 150),
(12, 5, 2, 'MTY-T1-2', 150),
-- Cancún
(13, 6, 1, 'CUN-T1-1', 200),
(14, 6, 2, 'CUN-T1-2', 200),
(15, 7, 1, 'CUN-T2-1', 180),
(16, 7, 2, 'CUN-T2-2', 180),
-- Mérida
(17, 8, 1, 'MID-T1-1', 100),
(18, 8, 2, 'MID-T1-2', 100),
-- Oaxaca
(19, 9, 1, 'OAX-T1-1', 80),
(20, 9, 2, 'OAX-T1-2', 80),
-- Querétaro
(21, 10, 1, 'QRO-T1-1', 120),
(22, 10, 2, 'QRO-T1-2', 120),
-- León-Bajío
(23, 11, 1, 'BJX-T1-1', 150),
(24, 11, 2, 'BJX-T1-2', 150),

-- Estados Unidos -----------------------------------------
-- LAX (terminals 1..9 + TB)
(25, 12, 1, 'LAX-T1-1', 300),
(26, 12, 2, 'LAX-T1-2', 300),
(27, 13, 1, 'LAX-T2-1', 300),
(28, 13, 2, 'LAX-T2-2', 300),
(29, 14, 1, 'LAX-T3-1', 320),
(30, 14, 2, 'LAX-T3-2', 320),
(31, 15, 1, 'LAX-T4-1', 250),
(32, 15, 2, 'LAX-T4-2', 250),
(33, 16, 1, 'LAX-T5-1', 240),
(34, 16, 2, 'LAX-T5-2', 240),
(35, 17, 1, 'LAX-T6-1', 200),
(36, 17, 2, 'LAX-T6-2', 200),
(37, 18, 1, 'LAX-T7-1', 220),
(38, 18, 2, 'LAX-T7-2', 220),
(39, 19, 1, 'LAX-T8-1', 220),
(40, 19, 2, 'LAX-T8-2', 220),
(41, 20, 1, 'LAX-TB-1', 400),
(42, 20, 2, 'LAX-TB-2', 400),
-- JFK
(43, 21, 1, 'JFK-T1-1', 300),
(44, 21, 2, 'JFK-T1-2', 300),
(45, 22, 1, 'JFK-T2-1', 250),
(46, 22, 2, 'JFK-T2-2', 250),
(47, 23, 1, 'JFK-T3-1', 250),
(48, 23, 2, 'JFK-T3-2', 250),
-- DFW
(49, 24, 1, 'DFW-A-1', 300),
(50, 24, 2, 'DFW-A-2', 300),
(51, 25, 1, 'DFW-B-1', 260),
(52, 25, 2, 'DFW-B-2', 260),
(53, 26, 1, 'DFW-C-1', 240),
(54, 26, 2, 'DFW-C-2', 240),
-- MDW
(55, 27, 1, 'MDW-T1-1', 150),
(56, 27, 2, 'MDW-T1-2', 150),
-- DEN
(57, 28, 1, 'DEN-A-1', 200),
(58, 28, 2, 'DEN-A-2', 200),
(59, 29, 1, 'DEN-B-1', 180),
(60, 29, 2, 'DEN-B-2', 180),
-- MCO
(61, 30, 1, 'MCO-A-1', 250),
(62, 30, 2, 'MCO-A-2', 250),
(63, 31, 1, 'MCO-B-1', 220),
(64, 31, 2, 'MCO-B-2', 220),
(65, 32, 1, 'MCO-C-1', 200),
(66, 32, 2, 'MCO-C-2', 200),

-- Brasil ---------------------------------------------------
-- GRU
(67, 33, 1, 'GRU-T1-1', 300),
(68, 33, 2, 'GRU-T1-2', 300),
(69, 34, 1, 'GRU-T2-1', 260),
(70, 34, 2, 'GRU-T2-2', 260),
(71, 35, 1, 'GRU-T3-1', 240),
(72, 35, 2, 'GRU-T3-2', 240),
-- BSB
(73, 36, 1, 'BSB-T1-1', 200),
(74, 36, 2, 'BSB-T1-2', 200),
-- SDU
(75, 37, 1, 'SDU-T1-1', 160),
(76, 37, 2, 'SDU-T1-2', 160),
-- CNF
(77, 38, 1, 'CNF-T1-1', 180),
(78, 38, 2, 'CNF-T1-2', 180

-- España ---------------------------------------------------
-- MAD
(79, 39, 1, 'MAD-T1-1', 300),
(80, 39, 2, 'MAD-T1-2', 300),
(81, 40, 1, 'MAD-T2-1', 280),
(82, 40, 2, 'MAD-T2-2', 280),
(83, 41, 1, 'MAD-T3-1', 260),
(84, 41, 2, 'MAD-T3-2', 260),
(85, 42, 1, 'MAD-T4-1', 300),
(86, 42, 2, 'MAD-T4-2', 300),
-- BCN
(87, 43, 1, 'BCN-T1-1', 260),
(88, 43, 2, 'BCN-T1-2', 260),
(89, 44, 1, 'BCN-T2-1', 220),
(90, 44, 2, 'BCN-T2-2', 220),
-- AGP
(91, 45, 1, 'AGP-T1-1', 200),
(92, 45, 2, 'AGP-T1-2', 200),
-- VLC
(93, 46, 1, 'VLC-T1-1', 160),
(94, 46, 2, 'VLC-T1-2', 160),

-- Japón ----------------------------------------------------
-- HND
(95, 47, 1, 'HND-T1-1', 280),
(96, 47, 2, 'HND-T1-2', 280),
(97, 48, 1, 'HND-T2-1', 250),
(98, 48, 2, 'HND-T2-2', 250),
(99, 49, 1, 'HND-T3-1', 300),
(100, 49, 2, 'HND-T3-2', 300),
-- KIX
(101, 50, 1, 'KIX-T1-1', 240),
(102, 50, 2, 'KIX-T1-2', 240),
-- CTS
(103, 51, 1, 'CTS-T1-1', 200),
(104, 51, 2, 'CTS-T1-2', 200),
-- FUK
(105, 52, 1, 'FUK-T1-1', 180),
(106, 52, 2, 'FUK-T1-2', 180



-- PISTAS
INSERT INTO pista (id_pista, id_aeropuerto, codigo, longitud_m, estado) VALUES
-- México -------------------------------------------------
-- Aeropuerto MEX (id = 1) — 2 pistas principales
(1, 1, '05L/23R', 3880, 'OPERATIVA'),
(2, 1, '05R/23L', 3880, 'OPERATIVA'),
(3, 1, '05N/23L', 4000, 'OPERATIVA'),
-- Guadalajara (GDL, id = 2) — 2 pistas
(4, 2, '11L/29R', 3500, 'OPERATIVA'),
(5, 2, '11R/29L', 3600, 'OPERATIVA'),
-- Monterrey (MTY, id = 3) — 2 pistas
(6, 3, '11/29', 3400, 'OPERATIVA'),
(7, 3, '18/36', 3000, 'OPERATIVA'),
-- Cancún (CUN, id = 4) — 2 pistas
(8, 4, '12/30', 3800, 'OPERATIVA'),
(9, 4, '06/24', 3000, 'OPERATIVA'),
-- Mérida (MID, id = 6) — 1 pista
(10, 6, '08/26', 3000, 'OPERATIVA'),
-- Oaxaca (OAX, id = 7) — 1 pista
(11, 7, '07/25', 2800, 'OPERATIVA'),
-- Querétaro (QRO, id = 8) — 1 pista
(12, 8, '09/27', 3600, 'OPERATIVA'),
-- León-Bajío (BJX, id = 9) — 1 pista
(13, 9, '14/32', 3200, 'OPERATIVA'),

-- Estados Unidos -----------------------------------------
-- LAX (id = 10) — grandes aeropuertos: 3 pistas en este dataset (simplificado)
(14, 10, '06L/24R', 3682, 'OPERATIVA'),
(15, 10, '06R/24L', 3682, 'OPERATIVA'),
(16, 10, '07/25', 3350, 'OPERATIVA'),
-- JFK (id = 11) — 3 pistas (simplificado)
(17, 11, '04L/22R', 2560, 'OPERATIVA'),
(18, 11, '04R/22L', 2560, 'OPERATIVA'),
(19, 11, '13/31', 4000, 'OPERATIVA'),
-- DFW (id = 12) — 3 pistas (DFW tiene muchas; aquí simplificadas a 3)
(20, 12, '18L/36R', 2743, 'OPERATIVA'),
(21, 12, '18R/36L', 2743, 'OPERATIVA'),
(22, 12, '13/31', 3340, 'OPERATIVA'),
-- MDW (id = 13) — 1 pista (aeropuerto más pequeño)
(23, 13, '13/31', 2134, 'OPERATIVA'),
-- DEN (id = 14) — 3 pistas (simplificado)
(24, 14, '16R/34L', 4200, 'OPERATIVA'),
(25, 14, '16L/34R', 3800, 'OPERATIVA'),
(26, 14, '07/25', 3300, 'OPERATIVA'),
-- MCO (id = 15) — 2 pistas
(27, 15, '18L/36R', 3750, 'OPERATIVA'),
(28, 15, '18R/36L', 3400, 'OPERATIVA'),

-- Brasil ---------------------------------------------------
-- GRU (id = 16) — 3 pistas (gran hub)
(29, 16, '09L/27R', 3500, 'OPERATIVA'),
(30, 16, '09R/27L', 3700, 'OPERATIVA'),
(31, 16, '10/28', 3400, 'OPERATIVA'),
-- BSB (id = 17) — 2 pistas
(32, 17, '11/29', 3200, 'OPERATIVA'),
(33, 17, '04/22', 3000, 'OPERATIVA'),
-- SDU (id = 18) — 1 pista (santos dumont sobre la bahía, pistas cortas)
(34, 18, '02/20', 1335, 'OPERATIVA'),
-- CNF (id = 19) — 1 pista
(35, 19, '12/30', 3400, 'OPERATIVA'),

-- España ---------------------------------------------------
-- MAD (id = 20) — 3 pistas (simplificado)
(36, 20, '18L/36R', 4200, 'OPERATIVA'),
(37, 20, '18R/36L', 4200, 'OPERATIVA'),
(38, 20, '14/32', 3500, 'OPERATIVA'),
-- BCN (id = 21) — 2 pistas
(39, 21, '02/20', 3200, 'OPERATIVA'),
(40, 21, '07/25', 3500, 'OPERATIVA'),
-- AGP (id = 22) — 1 pista
(41, 22, '13/31', 3300, 'OPERATIVA'),
-- VLC (id = 23) — 1 pista
(42, 23, '02/20', 3000, 'OPERATIVA'),

-- Japón ----------------------------------------------------
-- HND (id = 24) — 3 pistas (Haneda es grande; simplificado a 3)
(43, 24, '04/22', 3000, 'OPERATIVA'),
(44, 24, '16/34', 3000, 'OPERATIVA'),
(45, 24, '05/23', 2500, 'OPERATIVA'),
-- KIX (id = 25) — 2 pistas (Kansai sobre isla artificial)
(46, 25, '06/24', 3500, 'OPERATIVA'),
(47, 25, '09/27', 3500, 'OPERATIVA'),
-- CTS (id = 26) — 2 pistas
(48, 26, '01/19', 3200, 'OPERATIVA'),
(49, 26, '07/25', 3000, 'OPERATIVA'),
-- FUK (id = 27) — 2 pistas
(50, 27, '16/34', 3200, 'OPERATIVA'),
(51, 27, '05/23', 2800, 'OPERATIVA');


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
(1, 1, 1, 'Boeing 737-800', 160, 'MX-A0001', 'OPERATIVO'),
(2, 1, 1, 'Boeing 737 MAX 9', 180, 'MX-A0002', 'OPERATIVO'),
(3, 2, 1, 'Boeing 787-9 Dreamliner', 290, 'MX-A0003', 'MANTENIMIENTO'),
(4, 3, 1, 'Embraer 190', 99, 'MX-A0004', 'OPERATIVO'),
(5, 4, 1, 'Boeing 737-700', 144, 'MX-A0005', 'RETIRADO'),
(6, 1, 1, 'Boeing 737 MAX 8', 175, 'MX-A0006', 'OPERATIVO'),
(7, 2, 1, 'Boeing 787-8 Dreamliner', 250, 'MX-A0007', 'OPERATIVO'),
-- Volaris
(8, 2, 2, 'Airbus A320neo', 186, 'MX-A0008', 'OPERATIVO'),
(9, 3, 2, 'Airbus A321neo', 230, 'MX-A0009', 'OPERATIVO'),
(10, 4, 2, 'Airbus A319', 144, 'MX-A0010', 'RETIRADO'),
(11, 1, 2, 'Airbus A320', 174, 'MX-A0011', 'OPERATIVO'),
(12, 2, 2, 'Airbus A320neo', 186, 'MX-A0012', 'OPERATIVO'),
(13, 3, 2, 'Airbus A321', 220, 'MX-A0013', 'MANTENIMIENTO'),
(14, 4, 2, 'Airbus A320neo', 186, 'MX-A0014', 'OPERATIVO'),
-- Viva Aerobus
(15, 1, 3, 'Airbus A320', 180, 'MX-A0015', 'OPERATIVO'),
(16, 2, 3, 'Airbus A321neo', 230, 'MX-A0016', 'OPERATIVO'),
(17, 3, 3, 'Airbus A320neo', 186, 'MX-A0017', 'MANTENIMIENTO'),
(18, 4, 3, 'Airbus A321', 220, 'MX-A0018', 'OPERATIVO'),
(19, 2, 3, 'Airbus A320', 180, 'MX-A0019', 'OPERATIVO'),
(20, 3, 3, 'Airbus A321neo', 230, 'MX-A0020', 'OPERATIVO'),
(21, 4, 3, 'Airbus A320', 180, 'MX-A0021', 'RETIRADO'),
-- Interjet
(22, 1, 4, 'Sukhoi Superjet 100', 93, 'MX-A0022', 'OPERATIVO'),
(23, 2, 4, 'Airbus A320', 174, 'MX-A0023', 'OPERATIVO'),
(24, 3, 4, 'Airbus A321', 220, 'MX-A0024', 'MANTENIMIENTO'),
(25, 4, 4, 'Airbus A320neo', 186, 'MX-A0025', 'OPERATIVO'),
(26, 1, 4, 'Sukhoi Superjet 100', 98, 'MX-A0026', 'RETIRADO'),
(27, 2, 4, 'Airbus A320', 180, 'MX-A0027', 'OPERATIVO'),
(28, 3, 4, 'Airbus A320neo', 186, 'MX-A0028', 'OPERATIVO'),
-- Calafia Airlines
(29, 4, 5, 'Embraer ERJ-145', 50, 'MX-A0029', 'OPERATIVO'),
(30, 3, 5, 'Cessna 208 Caravan', 12, 'MX-A0030', 'OPERATIVO'),
(31, 4, 5, 'Embraer EMB-120', 30, 'MX-A0031', 'RETIRADO'),
(32, 2, 5, 'Embraer ERJ-145', 50, 'MX-A0032', 'OPERATIVO'),
(33, 3, 5, 'Cessna 208 Caravan', 12, 'MX-A0033', 'OPERATIVO'),
(34, 1, 5, 'Embraer ERJ-135', 37, 'MX-A0034', 'MANTENIMIENTO'),
(35, 4, 5, 'Embraer EMB-120', 30, 'MX-A0035', 'OPERATIVO'),
-- Aeromar
(36, 4, 6, 'ATR 72-600', 70, 'MX-A0036', 'OPERATIVO'),
(37, 3, 6, 'ATR 42-500', 50, 'MX-A0037', 'OPERATIVO'),
(38, 1, 6, 'ATR 72-600', 70, 'MX-A0038', 'MANTENIMIENTO'),
(39, 2, 6, 'ATR 42-300', 48, 'MX-A0039', 'OPERATIVO'),
(40, 4, 6, 'ATR 72-600', 70, 'MX-A0040', 'OPERATIVO'),
(41, 3, 6, 'ATR 42-500', 50, 'MX-A0041', 'RETIRADO'),
(42, 1, 6, 'ATR 72-600', 70, 'MX-A0042', 'OPERATIVO'),
-- Aerus
(43, 3, 7, 'Cessna 408 SkyCourier', 19, 'MX-A0043', 'OPERATIVO'),
(44, 4, 7, 'Pilatus PC-12', 9, 'MX-A0044', 'OPERATIVO'),
(45, 2, 7, 'Cessna 208 Caravan', 12, 'MX-A0045', 'MANTENIMIENTO'),
(46, 1, 7, 'Cessna 408 SkyCourier', 19, 'MX-A0046', 'OPERATIVO'),
(47, 3, 7, 'Pilatus PC-12', 9, 'MX-A0047', 'OPERATIVO'),
(48, 4, 7, 'Cessna 208 Caravan', 12, 'MX-A0048', 'OPERATIVO'),
(49, 1, 7, 'Cessna 408 SkyCourier', 19, 'MX-A0049', 'RETIRADO'),
-- Magnicharters
(50, 1, 8, 'Boeing 737-300', 148, 'MX-A0050', 'OPERATIVO'),
(51, 2, 8, 'Boeing 737-200', 130, 'MX-A0051', 'RETIRADO'),
(52, 3, 8, 'Boeing 737-300', 148, 'MX-A0052', 'OPERATIVO'),
(53, 4, 8, 'Boeing 737-400', 159, 'MX-A0053', 'OPERATIVO'),
(54, 1, 8, 'Boeing 737-300', 148, 'MX-A0054', 'OPERATIVO'),
(55, 2, 8, 'Boeing 737-200', 130, 'MX-A0055', 'MANTENIMIENTO'),
(56, 3, 8, 'Boeing 737-400', 159, 'MX-A0056', 'OPERATIVO'
-- Mexicana de Aviación
(57, 1, 9, 'Airbus A320', 174, 'MX-A0057', 'OPERATIVO'),
(58, 2, 9, 'Airbus A319', 144, 'MX-A0058', 'OPERATIVO'),
(59, 3, 9, 'Boeing 757-200', 200, 'MX-A0059', 'OPERATIVO'),
(60, 4, 9, 'Airbus A320neo', 186, 'MX-A0060', 'OPERATIVO'),
(61, 1, 9, 'Airbus A320', 174, 'MX-A0061', 'MANTENIMIENTO'),
(62, 2, 9, 'Boeing 737-800', 160, 'MX-A0062', 'OPERATIVO'),
(63, 3, 9, 'Airbus A321', 220, 'MX-A0063', 'OPERATIVO'),

---------------EU------------------
-- American Airlines
(64, 6, 10, 'Boeing 737-800', 160, 'US-A0064', 'OPERATIVO'),
(65, 7, 10, 'Airbus A321', 220, 'US-A0065', 'OPERATIVO'),
(66, 8, 10, 'Boeing 777-200ER', 305, 'US-A0066', 'MANTENIMIENTO'),
(67, 9, 10, 'Boeing 787-8 Dreamliner', 248, 'US-A0067', 'OPERATIVO'),
(68, 10, 10, 'Airbus A319', 144, 'US-A0068', 'OPERATIVO'),
(69, 11, 10, 'Boeing 737 MAX 8', 172, 'US-A0069', 'OPERATIVO'),
(70, 12, 10, 'Airbus A320', 174, 'US-A0070', 'RETIRADO'),
-- Delta Airlines
(71, 6, 11, 'Boeing 737-900ER', 180, 'US-A0071', 'OPERATIVO'),
(72, 7, 11, 'Airbus A321', 220, 'US-A0072', 'OPERATIVO'),
(73, 8, 11, 'Airbus A350-900', 315, 'US-A0073', 'OPERATIVO'),
(74, 9, 11, 'Boeing 767-400ER', 245, 'US-A0074', 'MANTENIMIENTO'),
(75, 10, 11, 'Airbus A220-100', 120, 'US-A0075', 'OPERATIVO'),
(76, 11, 11, 'Boeing 757-300', 243, 'US-A0076', 'OPERATIVO'),
(77, 12, 11, 'Airbus A321neo', 228, 'US-A0077', 'OPERATIVO'),
-- United Airlines
(78, 6, 12, 'Boeing 737 MAX 9', 179, 'US-A0078', 'OPERATIVO'),
(79, 7, 12, 'Boeing 757-200', 200, 'US-A0079', 'OPERATIVO'),
(80, 8, 12, 'Boeing 787-9 Dreamliner', 290, 'US-A0080', 'MANTENIMIENTO'),
(81, 9, 12, 'Airbus A320', 174, 'US-A0081', 'OPERATIVO'),
(82, 10, 12, 'Boeing 767-300ER', 218, 'US-A0082', 'OPERATIVO'),
(83, 11, 12, 'Airbus A321', 220, 'US-A0083', 'OPERATIVO'),
(84, 12, 12, 'Boeing 777-200', 312, 'US-A0084', 'RETIRADO'),
-- Southwest Airlines
(85, 6, 13, 'Boeing 737-700', 143, 'US-A0085', 'OPERATIVO'),
(86, 7, 13, 'Boeing 737-800', 175, 'US-A0086', 'OPERATIVO'),
(87, 8, 13, 'Boeing 737 MAX 8', 175, 'US-A0087', 'OPERATIVO'),
(88, 9, 13, 'Boeing 737-700', 143, 'US-A0088', 'MANTENIMIENTO'),
(89, 10, 13, 'Boeing 737-800', 175, 'US-A0089', 'OPERATIVO'),
(90, 11, 13, 'Boeing 737 MAX 8', 175, 'US-A0090', 'OPERATIVO'),
(91, 12, 13, 'Boeing 737-700', 143, 'US-A0091', 'RETIRADO'),
-- JetBlue Airways
(92, 6, 14, 'Airbus A320', 162, 'US-A0092', 'OPERATIVO'),
(93, 7, 14, 'Airbus A321neo', 200, 'US-A0093', 'OPERATIVO'),
(94, 8, 14, 'Airbus A220-300', 140, 'US-A0094', 'OPERATIVO'),
(95, 9, 14, 'Airbus A320neo', 174, 'US-A0095', 'MANTENIMIENTO'),
(96, 10, 14, 'Airbus A321LR', 200, 'US-A0096', 'OPERATIVO'),
(97, 11, 14, 'Embraer E190', 100, 'US-A0097', 'OPERATIVO'),
(98, 12, 14, 'Airbus A321', 220, 'US-A0098', 'OPERATIVO'),
-- Alaska Airlines
(99, 6, 15, 'Boeing 737-800', 160, 'US-A0099', 'OPERATIVO'),
(100, 7, 15, 'Boeing 737-900ER', 178, 'US-A0100', 'OPERATIVO'),
(101, 8, 15, 'Boeing 737 MAX 9', 178, 'US-A0101', 'OPERATIVO'),
(102, 9, 15, 'Embraer 175', 76, 'US-A0102', 'MANTENIMIENTO'),
(103, 10, 15, 'Boeing 737-800', 160, 'US-A0103', 'OPERATIVO'),
(104, 11, 15, 'Boeing 737-900ER', 178, 'US-A0104', 'OPERATIVO'),
(105, 12, 15, 'Embraer 175', 76, 'US-A0105', 'RETIRADO'),
-- Spirit Airlines
(106, 6, 16, 'Airbus A320', 174, 'US-A0106', 'OPERATIVO'),
(107, 7, 16, 'Airbus A321', 220, 'US-A0107', 'OPERATIVO'),
(108, 8, 16, 'Airbus A320neo', 186, 'US-A0108', 'OPERATIVO'),
(109, 9, 16, 'Airbus A319', 144, 'US-A0109', 'OPERATIVO'),
(110, 10, 16, 'Airbus A320neo', 186, 'US-A0110', 'MANTENIMIENTO'),
(111, 11, 16, 'Airbus A321neo', 230, 'US-A0111', 'OPERATIVO'),
(112, 12, 16, 'Airbus A320', 174, 'US-A0112', 'OPERATIVO'),
-- Frontier Airlines
(113, 6, 17, 'Airbus A320neo', 186, 'US-A0113', 'OPERATIVO'),
(114, 7, 17, 'Airbus A321', 220, 'US-A0114', 'OPERATIVO'),
(115, 8, 17, 'Airbus A320', 180, 'US-A0115', 'OPERATIVO'),
(116, 9, 17, 'Airbus A321neo', 230, 'US-A0116', 'OPERATIVO'),
(117, 10, 17, 'Airbus A320', 174, 'US-A0117', 'MANTENIMIENTO'),
(118, 11, 17, 'Airbus A321', 220, 'US-A0118', 'OPERATIVO'),
(119, 12, 17, 'Airbus A320neo', 186, 'US-A0119', 'RETIRADO'),

----------BRASIL------------
-- LATAM Brasil
(120, 14, 18, 'Airbus A321', 220, 'BR-A0120', 'OPERATIVO'),
(121, 15, 18, 'Boeing 767-300ER', 238, 'BR-A0121', 'OPERATIVO'),
(122, 16, 18, 'Airbus A320', 174, 'BR-A0122', 'OPERATIVO'),
(123, 14, 18, 'Airbus A319', 144, 'BR-A0123', 'OPERATIVO'),
(124, 15, 18, 'Boeing 787-9 Dreamliner', 296, 'BR-A0124', 'MANTENIMIENTO'),
(125, 16, 18, 'Airbus A321neo', 230, 'BR-A0125', 'OPERATIVO'),
(126, 15, 18, 'Airbus A320neo', 186, 'BR-A0126', 'OPERATIVO'),
-- GOL Linhas Aéreas
(127, 14, 19, 'Boeing 737-800', 176, 'BR-A0127', 'OPERATIVO'),
(128, 15, 19, 'Boeing 737 MAX 8', 186, 'BR-A0128', 'OPERATIVO'),
(129, 16, 19, 'Boeing 737-700', 144, 'BR-A0129', 'RETIRADO'),
(130, 14, 19, 'Boeing 737-800', 176, 'BR-A0130', 'OPERATIVO'),
(131, 15, 19, 'Boeing 737 MAX 8', 186, 'BR-A0131', 'OPERATIVO'),
(132, 16, 19, 'Boeing 737-800', 176, 'BR-A0132', 'MANTENIMIENTO'),
(133, 15, 19, 'Boeing 737 MAX 8', 186, 'BR-A0133', 'OPERATIVO'),
-- Azul Linhas Aéreas Brasileiras
(134, 14, 20, 'Airbus A320neo', 174, 'BR-A0134', 'OPERATIVO'),
(135, 15, 20, 'Embraer 195-E2', 136, 'BR-A0135', 'OPERATIVO'),
(136, 16, 20, 'Airbus A321neo', 220, 'BR-A0136', 'OPERATIVO'),
(137, 14, 20, 'ATR 72-600', 70, 'BR-A0137', 'OPERATIVO'),
(138, 15, 20, 'Airbus A320', 174, 'BR-A0138', 'MANTENIMIENTO'),
(139, 16, 20, 'Airbus A320neo', 186, 'BR-A0139', 'OPERATIVO'),
(140, 15, 20, 'Embraer 190', 114, 'BR-A0140', 'RETIRADO'),

-------------ESPAÑA-------------
-- Iberia
(155, 19, 21, 'Airbus A320neo', 186, 'ES-A0155', 'OPERATIVO'),
(156, 20, 21, 'Airbus A321', 220, 'ES-A0156', 'OPERATIVO'),
(157, 19, 21, 'Airbus A330-300', 288, 'ES-A0157', 'MANTENIMIENTO'),
(158, 20, 21, 'Airbus A350-900', 348, 'ES-A0158', 'OPERATIVO'),
(159, 19, 21, 'Airbus A319', 144, 'ES-A0159', 'OPERATIVO'),
(160, 20, 21, 'Airbus A321neo', 230, 'ES-A0160', 'OPERATIVO'),
(161, 19, 21, 'Airbus A320', 174, 'ES-A0161', 'RETIRADO'),
-- Air Europa
(162, 19, 22, 'Boeing 787-9 Dreamliner', 296, 'ES-A0162', 'OPERATIVO'),
(163, 20, 22, 'Boeing 737-800', 189, 'ES-A0163', 'OPERATIVO'),
(164, 19, 22, 'Airbus A330-200', 275, 'ES-A0164', 'OPERATIVO'),
(165, 20, 22, 'Boeing 737 MAX 8', 186, 'ES-A0165', 'MANTENIMIENTO'),
(166, 19, 22, 'Embraer E195', 122, 'ES-A0166', 'OPERATIVO'),
(167, 20, 22, 'Boeing 787-8 Dreamliner', 296, 'ES-A0167', 'OPERATIVO'),
(168, 19, 22, 'Boeing 737-800', 189, 'ES-A0168', 'RETIRADO'),
-- Vueling Airlines
(169, 19, 23, 'Airbus A320', 180, 'ES-A0169', 'OPERATIVO'),
(170, 20, 23, 'Airbus A321', 220, 'ES-A0170', 'OPERATIVO'),
(171, 19, 23, 'Airbus A320neo', 186, 'ES-A0171', 'OPERATIVO'),
(172, 20, 23, 'Airbus A319', 144, 'ES-A0172', 'MANTENIMIENTO'),
(173, 19, 23, 'Airbus A320', 174, 'ES-A0173', 'OPERATIVO'),
(174, 20, 23, 'Airbus A321neo', 230, 'ES-A0174', 'OPERATIVO'),
(175, 19, 23, 'Airbus A320neo', 186, 'ES-A0175', 'RETIRADO'),

-------------JAPÓN------------
-- Japan Airlines
(176, 24, 24, 'Boeing 787-9 Dreamliner', 296, 'JP-A0176', 'OPERATIVO'),
(177, 25, 24, 'Boeing 777-300ER', 396, 'JP-A0177', 'OPERATIVO'),
(178, 26, 24, 'Airbus A350-900', 325, 'JP-A0178', 'MANTENIMIENTO'),
(179, 27, 24, 'Boeing 737-800', 189, 'JP-A0179', 'OPERATIVO'),
(180, 24, 24, 'Boeing 767-300ER', 218, 'JP-A0180', 'RETIRADO');



-- EMPLEADOS
INSERT INTO empleado (id_empleado, id_aerolinea, id_aeropuerto, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, nacionalidad) VALUES
--------------------------PILOTOS------------------------------------------------------
--------Mexico----------
-- Aeroméxico
(1, 1, 1, 'Juan', 'Pérez', 'López', '1980-03-15', 'Mexicana'),
(2, 1, 2, 'María', 'González', 'Hernández', '1985-07-22', 'Mexicana'),
(3, 1, 3, 'Carlos', 'Ramírez', 'Vega', '1978-11-03', 'Mexicana'),
(4, 1, 1, 'Ana', 'Sánchez', 'Morales', '1990-01-18', 'Mexicana'),
-- Volaris
(5, 2, 2, 'Luis', 'Torres', 'Reyes', '1982-05-27', 'Mexicana'),
(6, 2, 3, 'Fernanda', 'Vázquez', 'Cruz', '1991-09-12', 'Mexicana'),
(7, 2, 4, 'Miguel', 'Castillo', 'Ríos', '1987-12-09', 'Mexicana'),
-- Viva Aerobus
(8, 3, 3, 'Paola', 'Flores', 'Jiménez', '1984-04-30', 'Mexicana'),
(9, 3, 6, 'Roberto', 'Mendoza', 'Soto', '1979-08-11', 'Mexicana'),
(10, 3, 7, 'Lorena', 'Romero', 'Gutiérrez', '1986-06-21', 'Mexicana'),
-- Interjet
(11, 4, 6, 'Jorge', 'Ortega', 'Navarro', '1983-02-14', 'Mexicana'),
(12, 4, 7, 'Claudia', 'Domínguez', 'Ramos', '1992-10-05', 'Mexicana'),
(13, 4, 8, 'Diego', 'Martínez', 'Pérez', '1985-07-12', 'Mexicana'),
-- Calafia Airlines
(14, 5, 8, 'Alejandra', 'Ramírez', 'Soto', '1989-11-19', 'Mexicana'),
(15, 5, 9, 'Eduardo', 'Vega', 'García', '1979-05-30', 'Mexicana'),
(16, 5, 6, 'Paula', 'Morales', 'Díaz', '1984-10-05', 'Mexicana'),
-- Aeromar
(17, 6, 1, 'Santiago', 'Mendoza', 'López', '1980-12-21', 'Mexicana'),
(18, 6, 2, 'Valeria', 'Hernández', 'Torres', '1987-03-13', 'Mexicana'),
(19, 6, 3, 'Jorge', 'Ortiz', 'Navarro', '1982-07-04', 'Mexicana'),
-- Aerus
(20, 7, 1, 'Claudia', 'Domínguez', 'Ramos', '1992-10-05', 'Mexicana'),
(21, 7, 2, 'Luis', 'Ramírez', 'Vega', '1987-12-09', 'Mexicana'),
(22, 7, 3, 'Mariana', 'Gómez', 'Pérez', '1985-02-20', 'Mexicana'),
-- Magnicharters
(23, 8, 4, 'Eduardo', 'Santos', 'López', '1982-05-10', 'Mexicana'),
(24, 8, 1, 'Paola', 'Hernández', 'Morales', '1990-01-18', 'Mexicana'),
(25, 8, 2, 'Diego', 'Castillo', 'Ríos', '1987-12-09', 'Mexicana'),
-- Mexicana de Aviación
(26, 9, 1, 'Juan', 'Ramírez', 'Torres', '1980-03-15', 'Mexicana'),
(27, 9, 2, 'María', 'González', 'Hernández', '1985-07-22', 'Mexicana'),
(28, 9, 3, 'Carlos', 'Ramírez', 'Vega', '1978-11-03', 'Mexicana'),
-----Estados Unidos-------
-- American Airlines
(29, 10, 10, 'John', 'Smith', 'Johnson', '1978-04-15', 'Estadounidense'),
(30, 10, 12, 'Emily', 'Davis', 'Brown', '1985-09-20', 'Estadounidense'),
(31, 10, 11, 'Michael', 'Wilson', 'Taylor', '1982-01-11', 'Estadounidense'),
-- Delta Air Lines
(32, 11, 11, 'Sarah', 'Moore', 'Clark', '1983-05-07', 'Estadounidense'),
(33, 11, 12, 'James', 'White', 'Hall', '1980-11-23', 'Estadounidense'),
(34, 11, 14, 'Anna', 'Young', 'Allen', '1990-02-28', 'Estadounidense'),
-- United Airlines
(35, 12, 12, 'Robert', 'Hernandez', 'King', '1979-08-14', 'Estadounidense'),
(36, 12, 13, 'Jessica', 'Wright', 'Lopez', '1987-06-30', 'Estadounidense'),
(37, 12, 10, 'William', 'Hill', 'Scott', '1985-12-05', 'Estadounidense'),
-- Southwest Airlines
(38, 13, 12, 'Daniel', 'Green', 'Adams', '1984-03-21', 'Estadounidense'),
(39, 13, 13, 'Laura', 'Baker', 'Nelson', '1990-07-19', 'Estadounidense'),
(40, 13, 15, 'Kevin', 'Carter', 'Mitchell', '1988-09-12', 'Estadounidense'),
-- JetBlue Airways
(41, 14, 11, 'Stephanie', 'Perez', 'Roberts', '1985-10-05', 'Estadounidense'),
(42, 14, 15, 'Brian', 'Turner', 'Phillips', '1982-03-18', 'Estadounidense'),
(43, 14, 10, 'Rachel', 'Campbell', 'Parker', '1991-01-22', 'Estadounidense'),
-- Alaska Airlines
(44, 15, 10, 'Mark', 'Evans', 'Edwards', '1980-07-14', 'Estadounidense'),
(45, 15, 14, 'Olivia', 'Collins', 'Stewart', '1986-11-09', 'Estadounidense'),
(46, 15, 12, 'Nathan', 'Sanchez', 'Morris', '1983-05-25', 'Estadounidense'),
-- Spirit Airlines
(47, 16, 15, 'Amanda', 'Rogers', 'Reed', '1988-02-13', 'Estadounidense'),
(48, 16, 12, 'Joshua', 'Cook', 'Morgan', '1985-08-30', 'Estadounidense'),
(49, 16, 13, 'Megan', 'Bell', 'Murphy', '1990-06-17', 'Estadounidense'),
-- Frontier Airlines
(50, 17, 14, 'Tyler', 'Bailey', 'Rivera', '1982-09-22', 'Estadounidense'),
(51, 17, 15, 'Samantha', 'Cooper', 'Cook', '1987-12-10', 'Estadounidense'),
(52, 17, 12, 'Brandon', 'Ward', 'Morgan', '1991-04-03', 'Estadounidense'),
---------Brasil--------
-- LATAM Brasil
(53, 18, 16, 'Lucas', 'Silva', 'Souza', '1980-03-11', 'Brasileña'),
(54, 18, 17, 'Mariana', 'Costa', 'Lima', '1985-07-24', 'Brasileña'),
(55, 18, 18, 'Pedro', 'Oliveira', 'Mendes', '1982-11-03', 'Brasileña'),
-- Gol Linhas Aéreas
(56, 19, 16, 'Fernanda', 'Almeida', 'Ribeiro', '1983-05-17', 'Brasileña'),
(57, 19, 19, 'Rafael', 'Santos', 'Gomes', '1987-09-09', 'Brasileña'),
(58, 19, 18, 'Juliana', 'Ferreira', 'Costa', '1990-02-25', 'Brasileña'),
-- Azul Linhas Aéreas
(59, 20, 16, 'Mateus', 'Rodrigues', 'Silva', '1984-04-12', 'Brasileña'),
(60, 20, 17, 'Camila', 'Martins', 'Pereira', '1988-08-30', 'Brasileña'),
(61, 20, 19, 'Gustavo', 'Lima', 'Santos', '1982-12-18', 'Brasileña'),
----------ESPAÑA-------
-- Iberia
(62, 21, 20, 'Carlos', 'García', 'Fernández', '1978-05-14', 'Española'),
(63, 21, 21, 'Laura', 'Martínez', 'López', '1985-11-22', 'Española'),
(64, 21, 22, 'Javier', 'Sánchez', 'Gómez', '1983-03-03', 'Española'),
-- Air Europa
(65, 22, 20, 'Ana', 'Pérez', 'Hernández', '1984-07-10', 'Española'),
(66, 22, 21, 'Miguel', 'Rodríguez', 'Torres', '1987-09-25', 'Española'),
(67, 22, 23, 'Lucía', 'Gómez', 'Vargas', '1990-01-15', 'Española'),
-- Vueling
(68, 23, 21, 'David', 'Ramírez', 'Santos', '1982-02-12', 'Española'),
(69, 23, 22, 'Elena', 'Torres', 'Jiménez', '1989-06-21', 'Española'),
(70, 23, 23, 'Sergio', 'Castillo', 'Moreno', '1985-10-09', 'Española'),
---------JAPÓN-----------
-- Japan Airlines
(71, 24, 24, 'Takashi', 'Yamamoto', 'Sato', '1978-04-20', 'Japonesa'),
(72, 24, 25, 'Yuki', 'Tanaka', 'Kobayashi', '1985-09-18', 'Japonesa'),
(73, 24, 26, 'Hiroshi', 'Nakamura', 'Fujimoto', '1982-01-11', 'Japonesa'),
(74, 24, 27, 'Miyuki', 'Ito', 'Kawasaki', '1990-06-25', 'Japonesa'),
  
--------------------------CONTROLADORES------------------------------------------------------
--------MÉXICO--------
-- Aerolíneas Mexicanas
(75, 1, 1, 'Arturo', 'Pérez', 'Gómez', '1975-02-14', 'Mexicana'),
(76, 1, 3, 'Lucía', 'Ramírez', 'Morales', '1980-06-20', 'Mexicana'),
-- Volaris
(77, 2, 2, 'Fernando', 'Torres', 'Hernández', '1978-11-03', 'Mexicana'),
(78, 2, 4, 'Isabel', 'Mendoza', 'López', '1982-08-11', 'Mexicana'),
-- Viva Aerobus
(79, 3, 3, 'Miguel', 'Soto', 'Ramírez', '1979-05-17', 'Mexicana'),
(80, 3, 4, 'Ana', 'Flores', 'Gómez', '1985-01-25', 'Mexicana'),
-- Interjet
(81, 4, 6, 'Jorge', 'Hernández', 'Pérez', '1980-12-10', 'Mexicana'),
(82, 4, 7, 'Claudia', 'González', 'Martínez', '1983-07-18', 'Mexicana'),
-- Calafia Airlines
(83, 5, 6, 'Eduardo', 'Vega', 'Santos', '1978-03-22', 'Mexicana'),
(84, 5, 7, 'Paola', 'Morales', 'Ríos', '1981-09-30', 'Mexicana'),
-- Aeromar
(85, 6, 1, 'Santiago', 'Ortiz', 'López', '1979-11-05', 'Mexicana'),
(86, 6, 2, 'Valeria', 'Ramírez', 'Torres', '1984-02-19', 'Mexicana'),
-- Aerus
(87, 7, 1, 'Luis', 'Domínguez', 'Vega', '1980-08-14', 'Mexicana'),
(88, 7, 3, 'Mariana', 'Gómez', 'Pérez', '1985-04-27', 'Mexicana'),
-- Magnicharters
(89, 8, 4, 'Eduardo', 'Santos', 'López', '1978-06-09', 'Mexicana'),
(90, 8, 8, 'Paola', 'Hernández', 'Morales', '1983-12-12', 'Mexicana'),
-- Mexicana de Aviación
(91, 9, 1, 'Juan', 'Ramírez', 'Torres', '1977-01-23', 'Mexicana'),
(92, 9, 3, 'María', 'González', 'Hernández', '1982-09-30', 'Mexicana'),
--------ESTADOS UNIDOS--------
-- American Airlines
(93, 10, 10, 'John', 'Smith', 'Johnson', '1975-05-14', 'Estadounidense'),
(94, 10, 11, 'Emily', 'Davis', 'Brown', '1980-12-01', 'Estadounidense'),
-- Delta Air Lines
(95, 11, 12, 'Sarah', 'Moore', 'Clark', '1982-03-07', 'Estadounidense'),
(96, 11, 14, 'James', 'White', 'Hall', '1978-09-19', 'Estadounidense'),
-- United Airlines
(97, 12, 12, 'Robert', 'Hernandez', 'King', '1980-08-14', 'Estadounidense'),
(98, 12, 13, 'Jessica', 'Wright', 'Lopez', '1985-06-30', 'Estadounidense'),
-- Southwest Airlines
(99, 13, 12, 'Daniel', 'Green', 'Adams', '1979-03-21', 'Estadounidense'),
(100, 13, 15, 'Laura', 'Baker', 'Nelson', '1983-07-19', 'Estadounidense'),
-- JetBlue Airways
(101, 14, 11, 'Stephanie', 'Perez', 'Roberts', '1980-10-05', 'Estadounidense'),
(102, 14, 15, 'Brian', 'Turner', 'Phillips', '1985-03-18', 'Estadounidense'),
-- Alaska Airlines
(103, 15, 10, 'Mark', 'Evans', 'Edwards', '1978-07-14', 'Estadounidense'),
(104, 15, 14, 'Olivia', 'Collins', 'Stewart', '1983-11-09', 'Estadounidense'),
-- Spirit Airlines
(105, 16, 12, 'Amanda', 'Rogers', 'Reed', '1982-02-13', 'Estadounidense'),
(106, 16, 15, 'Joshua', 'Cook', 'Morgan', '1986-08-30', 'Estadounidense'),
-- Frontier Airlines
(107, 17, 14, 'Tyler', 'Bailey', 'Rivera', '1980-09-22', 'Estadounidense'),
(108, 17, 15, 'Samantha', 'Cooper', 'Cook', '1985-12-10', 'Estadounidense'),
--------BRASIL--------
-- LATAM Brasil
(109, 18, 16, 'Lucas', 'Silva', 'Souza', '1978-03-11', 'Brasileña'),
(110, 18, 17, 'Mariana', 'Costa', 'Lima', '1982-07-24', 'Brasileña'),
-- Gol Linhas Aéreas
(111, 19, 16, 'Fernanda', 'Almeida', 'Ribeiro', '1980-05-17', 'Brasileña'),
(112, 19, 19, 'Rafael', 'Santos', 'Gomes', '1983-09-09', 'Brasileña'),
-- Azul Linhas Aéreas
(113, 20, 16, 'Mateus', 'Rodrigues', 'Silva', '1979-04-12', 'Brasileña'),
(114, 20, 17, 'Camila', 'Martins', 'Pereira', '1985-08-30', 'Brasileña'),
--------ESPAÑA--------
-- Iberia
(115, 21, 20, 'Carlos', 'García', 'Fernández', '1977-05-14', 'Española'),
(116, 21, 21, 'Laura', 'Martínez', 'López', '1983-11-22', 'Española'),
-- Air Europa
(117, 22, 20, 'Ana', 'Pérez', 'Hernández', '1980-07-10', 'Española'),
(118, 22, 21, 'Miguel', 'Rodríguez', 'Torres', '1985-09-25', 'Española'),
-- Vueling
(119, 23, 22, 'David', 'Ramírez', 'Santos', '1982-02-12', 'Española'),
(120, 23, 23, 'Elena', 'Torres', 'Jiménez', '1986-06-21', 'Española'),
--------JAPÓN--------
-- Japan Airlines
(121, 24, 24, 'Takashi', 'Yamamoto', 'Sato', '1978-04-20', 'Japonesa'),
(122, 24, 26, 'Hiroshi', 'Nakamura', 'Fujimoto', '1982-01-11', 'Japonesa'),

--------------------------SOBRECARGOS------------------------------------------------------
--------MÉXICO--------
-- Aeroméxico
(123, 1, 1, 'Sofía', 'Ramírez', 'Gómez', '1985-03-12', 'Mexicana'),
(124, 1, 2, 'Diego', 'Hernández', 'Pérez', '1982-07-20', 'Mexicana'),
(125, 1, 3, 'Valentina', 'López', 'Santos', '1990-11-05', 'Mexicana'),
-- Volaris
(126, 2, 2, 'Mariana', 'Torres', 'Hernández', '1986-09-14', 'Mexicana'),
(127, 2, 3, 'Javier', 'Flores', 'Ramos', '1983-05-22', 'Mexicana'),
(128, 2, 4, 'Lucía', 'Vega', 'Martínez', '1991-12-03', 'Mexicana'),
-- Viva Aerobus
(129, 3, 1, 'Andrés', 'Cruz', 'López', '1984-02-28', 'Mexicana'),
(130, 3, 2, 'Paola', 'Soto', 'Ramírez', '1989-06-15', 'Mexicana'),
(131, 3, 3, 'Eduardo', 'Morales', 'Gómez', '1992-10-21', 'Mexicana'),
-- Interjet
(132, 4, 4, 'Ana', 'Hernández', 'Torres', '1985-11-19', 'Mexicana'),
(133, 4, 6, 'Miguel', 'Gómez', 'Vega', '1981-07-30', 'Mexicana'),
(134, 4, 7, 'Sofía', 'Ramírez', 'Mendoza', '1988-04-05', 'Mexicana'),
-- Calafia Airlines
(135, 5, 6, 'Laura', 'Santos', 'Vega', '1983-01-12', 'Mexicana'),
(136, 5, 7, 'Diego', 'Ramos', 'Morales', '1987-09-21', 'Mexicana'),
(137, 5, 8, 'Paola', 'Hernández', 'Gómez', '1990-03-30', 'Mexicana'),
-- Aeromar
(138, 6, 1, 'Javier', 'Martínez', 'Torres', '1982-08-10', 'Mexicana'),
(139, 6, 2, 'Lucía', 'Gómez', 'Ramírez', '1985-02-17', 'Mexicana'),
(140, 6, 3, 'Carlos', 'López', 'Santos', '1988-06-04', 'Mexicana'),
-- Aerus
(141, 7, 1, 'Ana', 'Cruz', 'Morales', '1984-09-25', 'Mexicana'),
(142, 7, 2, 'Luis', 'Torres', 'Vega', '1987-03-13', 'Mexicana'),
(143, 7, 3, 'Mariana', 'Ramírez', 'Gómez', '1990-12-05', 'Mexicana'),
-- Magnicharters
(144, 8, 4, 'Eduardo', 'Hernández', 'Soto', '1983-04-18', 'Mexicana'),
(145, 8, 1, 'Paola', 'Morales', 'Ramírez', '1986-08-22', 'Mexicana'),
(146, 8, 2, 'Diego', 'Vega', 'González', '1989-11-11', 'Mexicana'),
-- Mexicana de Aviación
(147, 9, 1, 'Juan', 'Ramírez', 'Torres', '1981-05-16', 'Mexicana'),
(148, 9, 2, 'María', 'González', 'Hernández', '1984-09-23', 'Mexicana'),
(149, 9, 3, 'Carlos', 'Ramírez', 'Vega', '1987-12-07', 'Mexicana'),
--------ESTADOS UNIDOS--------
-- American Airlines
(150, 10, 10, 'John', 'Smith', 'Johnson', '1982-03-15', 'Estadounidense'),
(151, 10, 11, 'Emily', 'Davis', 'Brown', '1985-07-20', 'Estadounidense'),
(152, 10, 12, 'Michael', 'Wilson', 'Taylor', '1983-11-05', 'Estadounidense'),
-- Delta Air Lines
(153, 11, 11, 'Sarah', 'Moore', 'Clark', '1984-05-07', 'Estadounidense'),
(154, 11, 12, 'James', 'White', 'Hall', '1980-11-23', 'Estadounidense'),
(155, 11, 14, 'Anna', 'Young', 'Allen', '1990-02-28', 'Estadounidense'),
-- United Airlines
(156, 12, 12, 'Robert', 'Hernandez', 'King', '1979-08-14', 'Estadounidense'),
(157, 12, 13, 'Jessica', 'Wright', 'Lopez', '1987-06-30', 'Estadounidense'),
(158, 12, 10, 'William', 'Hill', 'Scott', '1985-12-05', 'Estadounidense'),
-- Southwest Airlines
(159, 13, 12, 'Daniel', 'Green', 'Adams', '1984-03-21', 'Estadounidense'),
(160, 13, 13, 'Laura', 'Baker', 'Nelson', '1990-07-19', 'Estadounidense'),
(161, 13, 15, 'Kevin', 'Carter', 'Mitchell', '1988-09-12', 'Estadounidense'),
-- JetBlue Airways
(162, 14, 11, 'Stephanie', 'Perez', 'Roberts', '1985-10-05', 'Estadounidense'),
(163, 14, 15, 'Brian', 'Turner', 'Phillips', '1982-03-18', 'Estadounidense'),
(164, 14, 10, 'Rachel', 'Campbell', 'Parker', '1991-01-22', 'Estadounidense'),
-- Alaska Airlines
(165, 15, 10, 'Mark', 'Evans', 'Edwards', '1980-07-14', 'Estadounidense'),
(166, 15, 14, 'Olivia', 'Collins', 'Stewart', '1986-11-09', 'Estadounidense'),
(167, 15, 12, 'Nathan', 'Sanchez', 'Morris', '1983-05-25', 'Estadounidense'),
-- Spirit Airlines
(168, 16, 15, 'Amanda', 'Rogers', 'Reed', '1988-02-13', 'Estadounidense'),
(169, 16, 12, 'Joshua', 'Cook', 'Morgan', '1985-08-30', 'Estadounidense'),
(170, 16, 13, 'Megan', 'Bell', 'Murphy', '1990-06-17', 'Estadounidense'),
-- Frontier Airlines
(171, 17, 14, 'Tyler', 'Bailey', 'Rivera', '1982-09-22', 'Estadounidense'),
(172, 17, 15, 'Samantha', 'Cooper', 'Cook', '1987-12-10', 'Estadounidense'),
(173, 17, 12, 'Brandon', 'Ward', 'Morgan', '1991-04-03', 'Estadounidense'),
--------BRASIL--------
-- LATAM Brasil
(174, 18, 16, 'Lucas', 'Silva', 'Souza', '1980-03-11', 'Brasileña'),
(175, 18, 17, 'Mariana', 'Costa', 'Lima', '1985-07-24', 'Brasileña'),
(176, 18, 18, 'Pedro', 'Oliveira', 'Mendes', '1982-11-03', 'Brasileña'),
-- Gol Linhas Aéreas
(177, 19, 16, 'Fernanda', 'Almeida', 'Ribeiro', '1983-05-17', 'Brasileña'),
(178, 19, 19, 'Rafael', 'Santos', 'Gomes', '1987-09-09', 'Brasileña'),
(179, 19, 18, 'Juliana', 'Ferreira', 'Costa', '1990-02-25', 'Brasileña'),
-- Azul Linhas Aéreas
(180, 20, 16, 'Mateus', 'Rodrigues', 'Silva', '1984-04-12', 'Brasileña'),
(181, 20, 17, 'Camila', 'Martins', 'Pereira', '1988-08-30', 'Brasileña'),
(182, 20, 19, 'Gustavo', 'Lima', 'Santos', '1982-12-18', 'Brasileña'),
--------ESPAÑA--------
-- Iberia
(183, 21, 20, 'Carlos', 'García', 'Fernández', '1978-05-14', 'Española'),
(184, 21, 21, 'Laura', 'Martínez', 'López', '1985-11-22', 'Española'),
(185, 21, 22, 'Javier', 'Sánchez', 'Gómez', '1983-03-03', 'Española'),
-- Air Europa
(186, 22, 20, 'Ana', 'Pérez', 'Hernández', '1984-07-10', 'Española'),
(187, 22, 21, 'Miguel', 'Rodríguez', 'Torres', '1987-09-25', 'Española'),
(188, 22, 23, 'Lucía', 'Gómez', 'Vargas', '1990-01-15', 'Española'),
-- Vueling
(189, 23, 21, 'David', 'Ramírez', 'Santos', '1982-02-12', 'Española'),
(190, 23, 22, 'Elena', 'Torres', 'Jiménez', '1989-06-21', 'Española'),
(191, 23, 23, 'Sergio', 'Castillo', 'Moreno', '1985-10-09', 'Española'),
--------JAPÓN--------
-- Japan Airlines
(192, 24, 24, 'Takashi', 'Yamamoto', 'Sato', '1978-04-20', 'Japonesa'),
(193, 24, 25, 'Yuki', 'Tanaka', 'Kobayashi', '1985-09-18', 'Japonesa'),
(194, 24, 26, 'Hiroshi', 'Nakamura', 'Fujimoto', '1982-01-11', 'Japonesa'),
(195, 24, 27, 'Miyuki', 'Ito', 'Kawasaki', '1990-06-25', 'Japonesa',

--------------------------TECNICOS------------------------------------------------------
--------MÉXICO--------
-- Aerolíneas Mexicanas
(196, 1, 1, 'Juan', 'Pérez', 'Gómez', '1980-03-10', 'Mexicana'),
(197, 1, 2, 'María', 'López', 'Hernández', '1985-07-21', 'Mexicana'),
-- Volaris
(198, 2, 1, 'Carlos', 'Ramírez', 'Santos', '1982-01-15', 'Mexicana'),
(199, 2, 3, 'Sofía', 'García', 'Vega', '1987-09-05', 'Mexicana'),
-- Viva Aerobus
(200, 3, 2, 'Miguel', 'Torres', 'Cruz', '1983-05-30', 'Mexicana'),
(201, 3, 4, 'Ana', 'Fernández', 'Ríos', '1988-11-12', 'Mexicana'),
-- Interjet
(202, 4, 1, 'Luis', 'Morales', 'Díaz', '1981-02-18', 'Mexicana'),
(203, 4, 3, 'Gabriela', 'Sánchez', 'Mendoza', '1986-06-22', 'Mexicana'),
-- Calafia Airlines
(204, 5, 4, 'Ricardo', 'Hernández', 'Luna', '1984-08-09', 'Mexicana'),
(205, 5, 2, 'Carolina', 'Vargas', 'Ortiz', '1989-12-05', 'Mexicana'),
-- Aeromar
(206, 6, 1, 'Fernando', 'Castillo', 'Ramos', '1980-10-14', 'Mexicana'),
(207, 6, 3, 'Paola', 'Martínez', 'Suárez', '1985-03-27', 'Mexicana'),
-- Aerus
(208, 7, 2, 'Eduardo', 'Gutiérrez', 'Pineda', '1983-01-19', 'Mexicana'),
(209, 7, 4, 'Verónica', 'Jiménez', 'Flores', '1987-07-30', 'Mexicana'),
-- Magnicharters
(210, 8, 1, 'Héctor', 'Ramírez', 'Sosa', '1982-09-12', 'Mexicana'),
(211, 8, 3, 'Jessica', 'Díaz', 'Morales', '1988-05-23', 'Mexicana'),
-- Mexicana de Aviación
(212, 9, 2, 'Santiago', 'López', 'González', '1980-11-11', 'Mexicana'),
(213, 9, 4, 'Natalia', 'Hernández', 'Cruz', '1986-02-16', 'Mexicana'),
--------ESTADOS UNIDOS--------
-- American Airlines
(214, 10, 10, 'John', 'Smith', 'Johnson', '1979-04-20', 'Estadounidense'),
(215, 10, 11, 'Emily', 'Brown', 'Davis', '1983-08-15', 'Estadounidense'),
-- Delta Air Lines
(216, 11, 12, 'Michael', 'Miller', 'Wilson', '1981-03-10', 'Estadounidense'),
(217, 11, 13, 'Sarah', 'Moore', 'Taylor', '1985-06-28', 'Estadounidense'),
-- United Airlines
(218, 12, 12, 'David', 'Anderson', 'Thomas', '1982-07-18', 'Estadounidense'),
(219, 12, 14, 'Jessica', 'Jackson', 'White', '1987-12-04', 'Estadounidense'),
-- Southwest Airlines
(220, 13, 10, 'Robert', 'Harris', 'Martin', '1980-05-22', 'Estadounidense'),
(221, 13, 15, 'Ashley', 'Thompson', 'Garcia', '1986-09-14', 'Estadounidense'),
-- JetBlue Airways
(222, 14, 11, 'Brian', 'Martinez', 'Robinson', '1983-02-08', 'Estadounidense'),
(223, 14, 14, 'Megan', 'Clark', 'Rodriguez', '1988-11-21', 'Estadounidense'),
-- Alaska Airlines
(224, 15, 10, 'Kevin', 'Lewis', 'Lee', '1981-01-19', 'Estadounidense'),
(225, 15, 12, 'Laura', 'Walker', 'Hall', '1985-04-27', 'Estadounidense'),
-- Spirit Airlines
(226, 16, 13, 'Jason', 'Allen', 'Young', '1982-08-05', 'Estadounidense'),
(227, 16, 15, 'Rachel', 'King', 'Hernandez', '1986-12-12', 'Estadounidense'),
-- Frontier Airlines
(228, 17, 10, 'Eric', 'Wright', 'Lopez', '1980-06-17', 'Estadounidense'),
(229, 17, 14, 'Amber', 'Scott', 'Hill', '1987-09-29', 'Estadounidense'),
--------BRASIL--------
-- LATAM Brasil
(230, 18, 16, 'Lucas', 'Silva', 'Santos', '1980-03-11', 'Brasileño'),
(231, 18, 17, 'Mariana', 'Oliveira', 'Costa', '1985-07-19', 'Brasileña'),
-- Gol Linhas Aéreas
(232, 19, 16, 'Rafael', 'Ferreira', 'Pereira', '1982-05-23', 'Brasileño'),
(233, 19, 19, 'Camila', 'Rodrigues', 'Almeida', '1987-11-02', 'Brasileña'),
-- Azul Linhas Aéreas
(234, 20, 16, 'Bruno', 'Martins', 'Gomes', '1981-08-14', 'Brasileño'),
(235, 20, 17, 'Juliana', 'Lima', 'Ribeiro', '1986-02-27', 'Brasileña'),
--------ESPAÑA--------
-- Iberia
(236, 21, 20, 'Antonio', 'García', 'López', '1980-06-09', 'Español'),
(237, 21, 21, 'Elena', 'Martínez', 'Sánchez', '1984-10-15', 'Española'),
-- Air Europa
(238, 22, 20, 'Javier', 'Hernández', 'Gómez', '1982-01-20', 'Español'),
(239, 22, 21, 'Isabel', 'Ruiz', 'Vega', '1987-05-11', 'Española'),
-- Vueling
(240, 23, 21, 'Pablo', 'Fernández', 'Ramos', '1981-09-04', 'Español'),
(241, 23, 23, 'Laura', 'Moreno', 'Díaz', '1986-12-18', 'Española'),
--------JAPÓN-------
-- Japan Airlines
(242, 24, 24, 'Takeshi', 'Yamamoto', 'Tanaka', '1980-04-21', 'Japonés'),
(243, 24, 26, 'Yuko', 'Kobayashi', 'Sato', '1985-08-13', 'Japonesa'),

--------------------------ATENCIONALPASAJERO------------------------------------------------------
--------MÉXICO--------
-- Aerolíneas Mexicanas
(244, 1, 1, 'Laura', 'Pérez', 'Gómez', '1990-03-10', 'Mexicana'),
(245, 1, 2, 'Miguel', 'López', 'Hernández', '1988-07-21', 'Mexicana'),
(246, 1, 3, 'Sofía', 'Ramírez', 'Vega', '1992-01-15', 'Mexicana'),
-- Volaris
(247, 2, 1, 'Carlos', 'Torres', 'Cruz', '1991-05-30', 'Mexicana'),
(248, 2, 3, 'Ana', 'Fernández', 'Ríos', '1989-11-12', 'Mexicana'),
(249, 2, 2, 'Luis', 'Morales', 'Díaz', '1990-02-18', 'Mexicana'),
-- Viva Aerobus
(250, 3, 2, 'Gabriela', 'Sánchez', 'Mendoza', '1993-06-22', 'Mexicana'),
(251, 3, 4, 'Ricardo', 'Hernández', 'Luna', '1988-08-09', 'Mexicana'),
(252, 3, 3, 'Carolina', 'Vargas', 'Ortiz', '1991-12-05', 'Mexicana'),
-- Interjet
(253, 4, 1, 'Fernando', 'Castillo', 'Ramos', '1990-10-14', 'Mexicana'),
(254, 4, 3, 'Paola', 'Martínez', 'Suárez', '1989-03-27', 'Mexicana'),
(255, 4, 4, 'Eduardo', 'Gutiérrez', 'Pineda', '1992-01-19', 'Mexicana'),
-- Calafia Airlines
(256, 5, 4, 'Verónica', 'Jiménez', 'Flores', '1987-07-30', 'Mexicana'),
(257, 5, 2, 'Héctor', 'Ramírez', 'Sosa', '1991-09-12', 'Mexicana'),
(258, 5, 3, 'Jessica', 'Díaz', 'Morales', '1988-05-23', 'Mexicana'),
-- Aeromar
(259, 6, 1, 'Santiago', 'López', 'González', '1990-11-11', 'Mexicana'),
(260, 6, 3, 'Natalia', 'Hernández', 'Cruz', '1986-02-16', 'Mexicana'),
(261, 6, 2, 'Juan', 'Pérez', 'Vega', '1991-04-08', 'Mexicana'),
-- Aerus
(262, 7, 2, 'María', 'López', 'Gómez', '1989-12-10', 'Mexicana'),
(263, 7, 4, 'Carlos', 'Ramírez', 'Santos', '1990-03-21', 'Mexicana'),
(264, 7, 3, 'Sofía', 'García', 'Vega', '1992-07-15', 'Mexicana'),
-- Magnicharters
(265, 8, 1, 'Miguel', 'Torres', 'Cruz', '1991-05-09', 'Mexicana'),
(266, 8, 3, 'Ana', 'Fernández', 'Ríos', '1988-11-12', 'Mexicana'),
(267, 8, 2, 'Luis', 'Morales', 'Díaz', '1990-02-18', 'Mexicana'),
-- Mexicana de Aviación
(268, 9, 2, 'Gabriela', 'Sánchez', 'Mendoza', '1989-06-22', 'Mexicana'),
(269, 9, 4, 'Ricardo', 'Hernández', 'Luna', '1991-08-09', 'Mexicana'),
(270, 9, 3, 'Carolina', 'Vargas', 'Ortiz', '1990-12-05', 'Mexicana'),
--------ESTADOS UNIDOS--------
-- American Airlines
(271, 10, 10, 'John', 'Smith', 'Johnson', '1985-04-20', 'Estadounidense'),
(272, 10, 11, 'Emily', 'Brown', 'Davis', '1988-08-15', 'Estadounidense'),
(273, 10, 12, 'Michael', 'Miller', 'Wilson', '1990-03-10', 'Estadounidense'),
-- Delta Air Lines
(274, 11, 12, 'Sarah', 'Moore', 'Taylor', '1986-06-28', 'Estadounidense'),
(275, 11, 13, 'David', 'Anderson', 'Thomas', '1983-07-18', 'Estadounidense'),
(276, 11, 14, 'Jessica', 'Jackson', 'White', '1987-12-04', 'Estadounidense'),
-- United Airlines
(277, 12, 12, 'Robert', 'Harris', 'Martin', '1984-05-22', 'Estadounidense'),
(278, 12, 14, 'Ashley', 'Thompson', 'Garcia', '1986-09-14', 'Estadounidense'),
(279, 12, 13, 'Brian', 'Martinez', 'Robinson', '1983-02-08', 'Estadounidense'),
-- Southwest Airlines
(280, 13, 10, 'Megan', 'Clark', 'Rodriguez', '1988-11-21', 'Estadounidense'),
(281, 13, 15, 'Kevin', 'Lewis', 'Lee', '1981-01-19', 'Estadounidense'),
(282, 13, 10, 'Laura', 'Walker', 'Hall', '1985-04-27', 'Estadounidense'),
-- JetBlue Airways
(283, 14, 11, 'Jason', 'Allen', 'Young', '1982-08-05', 'Estadounidense'),
(284, 14, 14, 'Rachel', 'King', 'Hernandez', '1986-12-12', 'Estadounidense'),
(285, 14, 15, 'Eric', 'Wright', 'Lopez', '1980-06-17', 'Estadounidense'),
-- Alaska Airlines
(286, 15, 10, 'Amber', 'Scott', 'Hill', '1987-09-29', 'Estadounidense'),
(287, 15, 12, 'John', 'Adams', 'Carter', '1984-03-11', 'Estadounidense'),
(288, 15, 14, 'Megan', 'Perry', 'Murphy', '1989-07-02', 'Estadounidense'),
-- Spirit Airlines
(289, 16, 13, 'Paul', 'Bell', 'Evans', '1985-11-16', 'Estadounidense'),
(290, 16, 15, 'Lisa', 'Cox', 'Patterson', '1988-04-05', 'Estadounidense'),
(291, 16, 14, 'Mark', 'Howard', 'Gray', '1982-09-27', 'Estadounidense'),
-- Frontier Airlines
(292, 17, 10, 'Amy', 'Ward', 'James', '1983-12-14', 'Estadounidense'),
(293, 17, 14, 'Kevin', 'Watson', 'Brooks', '1987-02-23', 'Estadounidense'),
(294, 17, 15, 'Sarah', 'Baker', 'Kelly', '1985-08-11', 'Estadounidense'),
--------BRASIL--------
-- LATAM Brasil
(295, 18, 16, 'Lucas', 'Silva', 'Santos', '1980-03-11', 'Brasileño'),
(296, 18, 17, 'Mariana', 'Oliveira', 'Costa', '1985-07-19', 'Brasileña'),
(297, 18, 16, 'Rafael', 'Ferreira', 'Pereira', '1982-05-23', 'Brasileño'),
-- Gol Linhas Aéreas
(298, 19, 16, 'Camila', 'Rodrigues', 'Almeida', '1987-11-02', 'Brasileña'),
(299, 19, 19, 'Bruno', 'Martins', 'Gomes', '1981-08-14', 'Brasileño'),
(300, 19, 17, 'Juliana', 'Lima', 'Ribeiro', '1986-02-27', 'Brasileña'),
-- Azul Linhas Aéreas
(301, 20, 16, 'Fernando', 'Castillo', 'Ramos', '1980-10-14', 'Brasileño'),
(302, 20, 17, 'Paola', 'Martínez', 'Suárez', '1985-03-27', 'Brasileña'),
(303, 20, 18, 'Eduardo', 'Gutiérrez', 'Pineda', '1983-01-19', 'Brasileño'),
--------ESPAÑA--------
-- Iberia
(304, 21, 20, 'Antonio', 'García', 'López', '1980-06-09', 'Español'),
(305, 21, 21, 'Elena', 'Martínez', 'Sánchez', '1984-10-15', 'Española'),
(306, 21, 20, 'Javier', 'Hernández', 'Gómez', '1982-01-20', 'Español'),
-- Air Europa
(307, 22, 20, 'Isabel', 'Ruiz', 'Vega', '1987-05-11', 'Española'),
(308, 22, 21, 'Pablo', 'Fernández', 'Ramos', '1981-09-04', 'Español'),
(309, 22, 22, 'Laura', 'Moreno', 'Díaz', '1986-12-18', 'Española'),
-- Vueling
(310, 23, 21, 'Sergio', 'Gómez', 'Torres', '1983-04-07', 'Español'),
(311, 23, 22, 'Marta', 'Sánchez', 'López', '1988-11-22', 'Española'),
(312, 23, 23, 'David', 'Pérez', 'García', '1985-07-13', 'Español'),
--------JAPÓN--------
-- Japan Airlines
(313, 24, 24, 'Takeshi', 'Yamamoto', 'Tanaka', '1980-04-21', 'Japonés'),
(314, 24, 25, 'Yuko', 'Kobayashi', 'Sato', '1985-08-13', 'Japonesa'),
(315, 24, 26, 'Hiroshi', 'Nakamura', 'Kondo', '1982-12-05', 'Japonés'),

--------------------------INGENIEROS------------------------------------------------------
--------MÉXICO--------
-- Aerolíneas Mexicanas
(316, 1, 1, 'Roberto', 'González', 'Mendoza', '1978-02-12', 'Mexicana'),
-- Volaris
(317, 2, 2, 'Patricia', 'Rojas', 'Vega', '1980-07-19', 'Mexicana'),
-- Viva Aerobus
(318, 3, 3, 'Fernando', 'Santos', 'Luna', '1979-11-03', 'Mexicana'),
-- Interjet
(319, 4, 1, 'Claudia', 'Hernández', 'Ríos', '1982-04-25', 'Mexicana'),
-- Calafia Airlines
(320, 5, 4, 'Jorge', 'Martínez', 'Pérez', '1981-09-15', 'Mexicana'),
-- Aeromar
(321, 6, 3, 'Ana', 'López', 'García', '1983-05-08', 'Mexicana'),
-- Aerus
(322, 7, 2, 'Carlos', 'Ramírez', 'Soto', '1980-12-22', 'Mexicana'),
-- Magnicharters
(323, 8, 1, 'Lorena', 'Fernández', 'Cruz', '1984-08-30', 'Mexicana'),
-- Mexicana de Aviación
(324, 9, 4, 'Eduardo', 'Morales', 'Gutiérrez', '1977-03-18', 'Mexicana'),
--------ESTADOS UNIDOS--------
-- American Airlines
(325, 10, 10, 'Steven', 'Walker', 'Harris', '1975-05-20', 'Estadounidense'),
-- Delta Air Lines
(326, 11, 12, 'Linda', 'Scott', 'Evans', '1980-10-12', 'Estadounidense'),
-- United Airlines
(327, 12, 14, 'Kevin', 'Johnson', 'Adams', '1978-01-07', 'Estadounidense'),
-- Southwest Airlines
(328, 13, 10, 'Michelle', 'Brown', 'Hall', '1982-06-25', 'Estadounidense'),
-- JetBlue Airways
(329, 14, 11, 'Daniel', 'Davis', 'Clark', '1981-03-19', 'Estadounidense'),
-- Alaska Airlines
(330, 15, 12, 'Rebecca', 'Miller', 'Lewis', '1979-09-11', 'Estadounidense'),
-- Spirit Airlines
(331, 16, 13, 'Brian', 'Wilson', 'Moore', '1983-07-04', 'Estadounidense'),
-- Frontier Airlines
(332, 17, 14, 'Jessica', 'Taylor', 'Anderson', '1980-11-28', 'Estadounidense'),
--------BRASIL--------
-- LATAM Brasil
(333, 18, 16, 'Lucas', 'Costa', 'Oliveira', '1977-02-05', 'Brasileño'),
-- Gol Linhas Aéreas
(334, 19, 17, 'Mariana', 'Santos', 'Ferreira', '1981-06-17', 'Brasileña'),
-- Azul Linhas Aéreas
(335, 20, 16, 'Rafael', 'Pereira', 'Martins', '1979-09-23', 'Brasileño'),
--------ESPAÑA--------
-- Iberia
(336, 21, 20, 'Antonio', 'Gómez', 'López', '1978-12-01', 'Español'),
-- Air Europa
(337, 22, 21, 'Elena', 'Martínez', 'Sánchez', '1980-07-09', 'Española'),
-- Vueling
(338, 23, 21, 'Pablo', 'Fernández', 'Ramos', '1982-03-15', 'Español'),
--------JAPÓN--------
-- Japan Airlines
(339, 24, 24, 'Takeshi', 'Yamamoto', 'Tanaka', '1977-04-21', 'Japonés');


  

-- PILOtos
INSERT INTO piloto (id_empleado, horas_de_vuelo) VALUES
--------Mexico----------
-- Aeroméxico
(1, 5200),
(2, 4800),
(3, 6100),
(4, 1200),
-- Volaris
(5, 4200),
(6, 3900),
(7, 800),
-- Viva Aerobus
(8, 4300),
(9, 5600),
(10, 4100),
-- Interjet
(11, 5000),
(12, 3600),
(13, 900),
-- Calafia Airlines
(14, 4000),
(15, 5600),
(16, 1000),
-- Aeromar
(17, 4700),
(18, 4200),
(19, 900),
-- Aerus
(20, 3600),
(21, 4200),
(22, 1100),
-- Magnicharters
(23, 5000),
(24, 3500),
(25, 800),
-- Mexicana de Aviación
(26, 5200),
(27, 4800),
(28, 1200),
-----Estados Unidos-------
-- American Airlines
(29, 7200),
(30, 4800),
(31, 1200),
-- Delta Air Lines
(32, 6500),
(33, 5100),
(34, 900),
-- United Airlines
(35, 7000),
(36, 4600),
(37, 1000),
-- Southwest Airlines
(38, 6000),
(39, 4200),
(40, 1100),
-- JetBlue Airways
(41, 5000),
(42, 4700),
(43, 900),
-- Alaska Airlines
(44, 6900),
(45, 4500),
(46, 1200),
-- Spirit Airlines
(47, 5200),
(48, 4600),
(49, 800),
-- Frontier Airlines
(50, 6100),
(51, 4300),
(52, 950),
---------Brasil--------
-- LATAM Brasil
(53, 6200),
(54, 4800),
(55, 900),
-- Gol Linhas Aéreas
(56, 5600),
(57, 4300),
(58, 800),
-- Azul Linhas Aéreas
(59, 5100),
(60, 4200),
(61, 1000),
----------ESPAÑA-------
-- Iberia
(62, 7200),
(63, 4800),
(64, 900),
-- Air Europa
(65, 6100),
(66, 4300),
(67, 850),
-- Vueling
(68, 5000),
(69, 4200),
(70, 900),
---------JAPÓN-----------
-- Japan Airlines
(71, 7000),
(72, 4800),
(73, 1000),
(74, 5200);



  
  -- CONTROLADORES
INSERT INTO controlador (id_empleado, numero_torre_asignada, licencia_controlador, turno) VALUES
--------MÉXICO--------
-- Aerolíneas Mexicanas
(75, 1, 'CTL001', 'Matutino'),
(76, 2, 'CTL002', 'Vespertino'),
-- Volaris
(77, 1, 'CTL003', 'Nocturno'),
(78, 2, 'CTL004', 'Matutino'),
-- Viva Aerobus
(79, 1, 'CTL005', 'Vespertino'),
(80, 2, 'CTL006', 'Nocturno'),
-- Interjet
(81, 1, 'CTL007', 'Matutino'),
(82, 2, 'CTL008', 'Vespertino'),
-- Calafia Airlines
(83, 1, 'CTL009', 'Nocturno'),
(84, 2, 'CTL010', 'Matutino'),
-- Aeromar
(85, 1, 'CTL011', 'Vespertino'),
(86, 2, 'CTL012', 'Nocturno'),
-- Aerus
(87, 1, 'CTL013', 'Matutino'),
(88, 2, 'CTL014', 'Vespertino'),
-- Magnicharters
(89, 1, 'CTL015', 'Nocturno'),
(90, 2, 'CTL016', 'Matutino'),
-- Mexicana de Aviación
(91, 1, 'CTL017', 'Vespertino'),
(92, 2, 'CTL018', 'Nocturno'),
--------ESTADOS UNIDOS--------
-- American Airlines
(93, 1, 'CTL019', 'Matutino'),
(94, 2, 'CTL020', 'Vespertino'),
-- Delta Air Lines
(95, 1, 'CTL021', 'Nocturno'),
(96, 2, 'CTL022', 'Matutino'),
-- United Airlines
(97, 1, 'CTL023', 'Vespertino'),
(98, 2, 'CTL024', 'Nocturno'),
-- Southwest Airlines
(99, 1, 'CTL025', 'Matutino'),
(100, 2, 'CTL026', 'Vespertino'),
-- JetBlue Airways
(101, 1, 'CTL027', 'Nocturno'),
(102, 2, 'CTL028', 'Matutino'),
-- Alaska Airlines
(103, 1, 'CTL029', 'Vespertino'),
(104, 2, 'CTL030', 'Nocturno'),
-- Spirit Airlines
(105, 1, 'CTL031', 'Matutino'),
(106, 2, 'CTL032', 'Vespertino'),
-- Frontier Airlines
(107, 1, 'CTL033', 'Nocturno'),
(108, 2, 'CTL034', 'Matutino'),
--------BRASIL--------
-- LATAM Brasil
(109, 1, 'CTL035', 'Matutino'),
(110, 2, 'CTL036', 'Vespertino'),
-- Gol Linhas Aéreas
(111, 1, 'CTL037', 'Nocturno'),
(112, 2, 'CTL038', 'Matutino'),
-- Azul Linhas Aéreas
(113, 1, 'CTL039', 'Vespertino'),
(114, 2, 'CTL040', 'Nocturno'),
--------ESPAÑA--------
-- Iberia
(115, 1, 'CTL041', 'Matutino'),
(116, 2, 'CTL042', 'Vespertino'),
-- Air Europa
(117, 1, 'CTL043', 'Nocturno'),
(118, 2, 'CTL044', 'Matutino'),
-- Vueling
(119, 1, 'CTL045', 'Vespertino'),
(120, 2, 'CTL046', 'Nocturno'),
--------JAPÓN--------
-- Japan Airlines
(121, 1, 'CTL047', 'Matutino'),
(122, 1, 'CTL049', 'Nocturno');


  

-- SOBRECARGOS
INSERT INTO sobrecargo (id_empleado, años_experiencia) VALUES
--------MÉXICO--------
-- Aeroméxico
(123, 10),(124, 12),(125, 8),
-- Volaris
(126, 7),(127, 11),(128, 6),
-- Viva Aerobus
(129, 10),(130, 7),(131, 5),
-- Interjet
(132, 9),(133, 12),(134, 6),
-- Calafia Airlines
(135, 8),(136, 9),(137, 6),
-- Aeromar
(138, 11),(139, 9),(140, 7),
-- Aerus
(141, 8),(142, 7),(143, 6),
-- Magnicharters
(144, 9),(145, 7),(146, 6),
-- Mexicana de Aviación
(147, 12),(148, 10),(149, 8),
--------ESTADOS UNIDOS--------
-- American Airlines
(150, 12),(151, 10),(152, 8),
-- Delta Air Lines
(153, 11),(154, 13),(155, 7),
-- United Airlines
(156, 14),(157, 9),(158, 8),
-- Southwest Airlines
(159, 12),(160, 9),(161, 7),
-- JetBlue Airways
(162, 11),(163, 12),(164, 7),
-- Alaska Airlines
(165, 13),(166, 10),(167, 11),
-- Spirit Airlines
(168, 9),(169, 11),(170, 7),
-- Frontier Airlines
(171, 12),(172, 9),(173, 8),
--------BRASIL--------
-- LATAM Brasil
(174, 12),(175, 10),(176, 8),
-- Gol Linhas Aéreas
(177, 11),(178, 9),(179, 7),
-- Azul Linhas Aéreas
(180, 10),(181, 8),(182, 9),
--------ESPAÑA--------
-- Iberia
(183, 14),(184, 10),(185, 9),
-- Air Europa
(186, 11),(187, 9),(188, 8),
-- Vueling
(189, 12),(190, 9),(191, 8),
--------JAPÓN--------
-- Japan Airlines
(192, 14),(193, 10),(194, 11),(195, 9);



-- TECNICOS
INSERT INTO tecnico (id_empleado, especialidad) VALUES
--------MÉXICO--------
-- Aerolíneas Mexicanas
(196, 'Mecánica'),(197, 'Electrónica'),
-- Volaris
(198, 'Mecánica'),(199, 'Aviónica'),
-- Viva Aerobus
(200, 'Mecánica'),(201, 'Aviónica'),
-- Interjet
(202, 'Mecánica'),(203, 'Electrónica'),
-- Calafia Airlines
(204, 'Aviónica'),(205, 'Mecánica'),
-- Aeromar
(206, 'Mecánica'),(207, 'Electrónica'),
-- Aerus
(208, 'Aviónica'),(209, 'Mecánica'),
-- Magnicharters
(210, 'Mecánica'),(211, 'Electrónica'),
-- Mexicana de Aviación
(212, 'Aviónica'),(213, 'Mecánica'),
--------ESTADOS UNIDOS--------
-- American Airlines
(214, 'Mecánica'),(215, 'Electrónica'),
-- Delta Air Lines
(216, 'Aviónica'),(217, 'Mecánica'),
-- United Airlines
(218, 'Mecánica'),(219, 'Aviónica'),
-- Southwest Airlines
(220, 'Mecánica'),(221, 'Electrónica'),
-- JetBlue Airways
(222, 'Aviónica'),(223, 'Mecánica'),
-- Alaska Airlines
(224, 'Mecánica'),(225, 'Electrónica'),
-- Spirit Airlines
(226, 'Aviónica'),(227, 'Mecánica'),
-- Frontier Airlines
(228, 'Mecánica'),(229, 'Electrónica'),
--------BRASIL--------
-- LATAM Brasil
(230, 'Mecánica'),(231, 'Aviónica'),
-- Gol Linhas Aéreas
(232, 'Mecánica'),(233, 'Electrónica'),
-- Azul Linhas Aéreas
(234, 'Aviónica'),(235, 'Mecánica'),
--------ESPAÑA--------
-- Iberia
(236, 'Mecánica'),(237, 'Electrónica'),
-- Air Europa
(238, 'Aviónica'),(239, 'Mecánica'),
-- Vueling
(240, 'Mecánica'),(241, 'Aviónica'),
--------JAPÓN-------
-- Japan Airlines
(242, 'Mecánica'),(243, 'Electrónica');



-- ATENCIÓN AL PASAJERO
INSERT INTO atencionalpasajero (id_empleado, puesto) VALUES
--------MÉXICO--------
-- Aerolíneas Mexicanas
(244, 'Asistente'),(245, 'Coordinador'),(246, 'Supervisor'),
-- Volaris
(247, 'Asistente'),(248, 'Coordinador'),(249, 'Supervisor'),
-- Viva Aerobus
(250, 'Asistente'),(251, 'Coordinador'),(252, 'Supervisor'),
-- Interjet
(253, 'Asistente'),(254, 'Coordinador'),(255, 'Supervisor'),
-- Calafia Airlines
(256, 'Asistente'),(257, 'Coordinador'),(258, 'Supervisor'),
-- Aeromar
(259, 'Asistente'),(260, 'Coordinador'),(261, 'Supervisor'),
-- Aerus
(262, 'Asistente'),(263, 'Coordinador'),(264, 'Supervisor'),
-- Magnicharters
(265, 'Asistente'),(266, 'Coordinador'),(267, 'Supervisor'),
-- Mexicana de Aviación
(268, 'Asistente'),(269, 'Coordinador'),(270, 'Supervisor'),
--------ESTADOS UNIDOS--------
-- American Airlines
(271, 'Asistente'),(272, 'Coordinador'),(273, 'Supervisor'),
-- Delta Air Lines
(274, 'Asistente'),(275, 'Coordinador'),(276, 'Supervisor'),
-- United Airlines
(277, 'Asistente'),(278, 'Coordinador'),(279, 'Supervisor'),
-- Southwest Airlines
(280, 'Asistente'),(281, 'Coordinador'),(282, 'Supervisor'),
-- JetBlue Airways
(283, 'Asistente'),(284, 'Coordinador'),(285, 'Supervisor'),
-- Alaska Airlines
(286, 'Asistente'),(287, 'Coordinador'),(288, 'Supervisor'),
-- Spirit Airlines
(289, 'Asistente'),(290, 'Coordinador'),(291, 'Supervisor'),
-- Frontier Airlines
(292, 'Asistente'),(293, 'Coordinador'),(294, 'Supervisor'),
--------BRASIL--------
-- LATAM Brasil
(295, 'Asistente'),(296, 'Coordinador'),(297, 'Supervisor'),
-- Gol Linhas Aéreas
(298, 'Asistente'),(299, 'Coordinador'),(300, 'Supervisor'),
-- Azul Linhas Aéreas
(301, 'Asistente'),(302, 'Coordinador'),(303, 'Supervisor'),
--------ESPAÑA--------
-- Iberia
(304, 'Asistente'),(305, 'Coordinador'),(306, 'Supervisor'),
-- Air Europa
(307, 'Asistente'),(308, 'Coordinador'),(309, 'Supervisor'),
-- Vueling
(310, 'Asistente'),(311, 'Coordinador'),(312, 'Supervisor'),
--------JAPÓN--------
-- Japan Airlines
(313, 'Asistente'),(314, 'Coordinador'),(315, 'Supervisor');



-- INGENIEROS
INSERT INTO ingeniero (id_empleado, rama, grado_estudio) VALUES
--------MÉXICO--------
-- Aerolíneas Mexicanas
(316, 'Mecánica', 'Maestría'),
-- Volaris
(317, 'Electrónica', 'Licenciatura'),
-- Viva Aerobus
(318, 'Mecánica', 'Maestría'),
-- Interjet
(319, 'Aviónica', 'Licenciatura'),
-- Calafia Airlines
(320, 'Mecánica', 'Licenciatura'),
-- Aeromar
(321, 'Electrónica', 'Maestría'),
-- Aerus
(322, 'Aviónica', 'Licenciatura'),
-- Magnicharters
(323, 'Mecánica', 'Maestría'),
-- Mexicana de Aviación
(324, 'Electrónica', 'Licenciatura'),
--------ESTADOS UNIDOS--------
-- American Airlines
(325, 'Mecánica', 'Maestría'),
-- Delta Air Lines
(326, 'Aviónica', 'Licenciatura'),
-- United Airlines
(327, 'Mecánica', 'Licenciatura'),
-- Southwest Airlines
(328, 'Electrónica', 'Maestría'),
-- JetBlue Airways
(329, 'Aviónica', 'Licenciatura'),
-- Alaska Airlines
(330, 'Mecánica', 'Maestría'),
-- Spirit Airlines
(331, 'Electrónica', 'Licenciatura'),
-- Frontier Airlines
(332, 'Aviónica', 'Maestría'),
--------BRASIL--------
-- LATAM Brasil
(333, 'Mecánica', 'Maestría'),
-- Gol Linhas Aéreas
(334, 'Aviónica', 'Licenciatura'),
-- Azul Linhas Aéreas
(335, 'Electrónica', 'Maestría'),
--------ESPAÑA--------
-- Iberia
(336, 'Mecánica', 'Licenciatura'),
-- Air Europa
(337, 'Aviónica', 'Maestría'),
-- Vueling
(338, 'Electrónica', 'Licenciatura'),
--------JAPÓN--------
-- Japan Airlines
(339, 'Mecánica', 'Maestría');

  



-- VUELOS
INSERT INTO vuelo (id_vuelo, id_avion, piloto, origen, destino, estado, etd, eta, tipo_vuelo) VALUES
--MEXICO--------------------------------------------------------------------------------------------
---- AEROMÉXICO ----
-- FINALIZADO
(1, 1, 1, 10, 1, 'FINALIZADO', '2025-09-29 06:00:00', '2025-09-29 10:00:00', 'CARGA'),
(2, 1, 1, 1, 2, 'FINALIZADO', '2025-09-30 06:00:00', '2025-09-30 07:15:00', 'COMERCIAL'),
(3, 1, 1, 2, 3, 'FINALIZADO', '2025-10-10 08:00:00', '2025-10-10 09:10:00', 'COMERCIAL'),
(4, 2, 2, 1, 4, 'FINALIZADO', '2025-10-09 12:30:00', '2025-10-09 14:00:00', 'COMERCIAL'),
-- EN_VUELO
(5, 3, 3, 2, 1, 'EN_VUELO', '2025-10-11 11:00:00', '2025-10-11 13:00:00', 'COMERCIAL'),
-- PROGRAMADO
(6, 1, 1, 3, 1, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 15:10:00', 'COMERCIAL'),
(7, 2, 2, 4, 1, 'PROGRAMADO', '2025-10-11 15:30:00', '2025-10-11 17:00:00', 'COMERCIAL'),
(8, 3, 3, 1, 2, 'PROGRAMADO', '2025-10-11 14:30:00', '2025-10-11 15:45:00', 'COMERCIAL'),
(9, 2, 2, 4, 11, 'PROGRAMADO', '2025-10-12 16:00:00', '2025-10-12 20:00:00', 'CARGA'),
-- CANCELADO
(10, 1, 1, 1, 4, 'CANCELADO', '2025-10-12 08:00:00', '2025-10-12 09:30:00', 'COMERCIAL'),
(11, 2, 2, 2, 3, 'CANCELADO', '2025-10-10 09:00:00', '2025-10-10 10:15:00', 'COMERCIAL'),

---- VOLARIS ----
-- FINALIZADOS
(12, 8, 5, 1, 2, 'FINALIZADO', '2025-08-08 07:00:00', '2025-08-08 08:30:00', 'COMERCIAL'),
(13, 8, 5, 2, 3, 'FINALIZADO', '2025-09-08 09:00:00', '2025-09-08 10:15:00', 'COMERCIAL'),
(14, 9, 6, 2, 4, 'FINALIZADO', '2025-10-08 06:00:00', '2025-10-08 08:00:00', 'CARGA'),
(15, 9, 6, 4, 2, 'FINALIZADO', '2025-10-08 09:00:00', '2025-10-08 11:00:00', 'COMERCIAL'),
(16, 10, 7, 3, 1, 'FINALIZADO', '2025-10-08 05:30:00', '2025-10-08 07:00:00', 'COMERCIAL'),
-- EN_VUELO
(17, 8, 5, 3, 10, 'EN_VUELO', '2025-10-11 11:00:00', '2025-10-11 15:00:00', 'COMERCIAL'),
(18, 9, 6, 2, 11, 'EN_VUELO', '2025-10-11 12:00:00', '2025-10-11 16:00:00', 'COMERCIAL'),
(19, 10, 7, 1, 4, 'EN_VUELO', '2025-10-11 13:00:00', '2025-10-11 16:30:00', 'COMERCIAL'),
-- PROGRAMADOS
(20, 8, 5, 10, 2, 'PROGRAMADO', '2025-10-11 18:00:00', '2025-10-11 22:00:00', 'COMERCIAL'),
(21, 8, 5, 2, 3, 'PROGRAMADO', '2025-10-12 07:00:00', '2025-10-12 08:15:00', 'COMERCIAL'),
(22, 9, 6, 11, 1, 'PROGRAMADO', '2025-10-11 18:30:00', '2025-10-11 22:30:00', 'COMERCIAL'),
(23, 10, 7, 4, 2, 'PROGRAMADO', '2025-10-11 17:00:00', '2025-10-11 19:00:00', 'CARGA'),
-- CANCELADOS
(24, 12, 5, 3, 1, 'CANCELADO', '2025-10-12 09:00:00', '2025-10-12 11:00:00', 'COMERCIAL'),

---- AEROBUS ----
-- FINALIZADOS
(41, 15, 8, 1, 2, 'FINALIZADO', '2025-09-08 07:00:00', '2025-09-08 08:30:00', 'COMERCIAL'),
(42, 16, 9, 2, 3, 'FINALIZADO', '2025-10-08 09:00:00', '2025-10-08 10:15:00', 'COMERCIAL'),
(43, 17, 10, 3, 4, 'FINALIZADO', '2025-10-08 11:00:00', '2025-10-08 13:00:00', 'CARGA'),
-- EN_VUELO
(44, 15, 8, 2, 10, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 13:00:00', 'COMERCIAL'),
(45, 16, 9, 3, 11, 'EN_VUELO', '2025-10-11 10:30:00', '2025-10-11 14:30:00', 'COMERCIAL'),
-- PROGRAMADOS
(46, 15, 8, 10, 2, 'PROGRAMADO', '2025-10-11 17:00:00', '2025-10-11 21:00:00', 'COMERCIAL'),
(47, 16, 9, 11, 3, 'PROGRAMADO', '2025-10-11 16:30:00', '2025-10-11 20:30:00', 'COMERCIAL'),
(48, 17, 10, 4, 1, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 16:00:00', 'COMERCIAL'),
-- CANCELADOS
(49, 17, 10, 3, 2, 'CANCELADO', '2025-10-12 08:00:00', '2025-10-12 09:15:00', 'COMERCIAL'),

---- INTERJET ----
-- FINALIZADOS
(50, 22, 11, 1, 2, 'FINALIZADO', '2025-10-08 06:30:00', '2025-10-08 08:00:00', 'COMERCIAL'),
(51, 23, 12, 2, 3, 'FINALIZADO', '2025-10-08 09:00:00', '2025-10-08 10:15:00', 'COMERCIAL'),
(52, 24, 13, 3, 4, 'FINALIZADO', '2025-10-08 11:00:00', '2025-10-08 12:45:00', 'CARGA'),
-- EN_VUELO
(53, 22, 11, 2, 10, 'EN_VUELO', '2025-10-11 08:00:00', '2025-10-11 12:00:00', 'COMERCIAL'),
(54, 23, 12, 3, 11, 'EN_VUELO', '2025-10-11 09:30:00', '2025-10-11 13:30:00', 'COMERCIAL'),
-- PROGRAMADOS
(55, 22, 11, 10, 2, 'PROGRAMADO', '2025-10-11 15:00:00', '2025-10-11 19:00:00', 'COMERCIAL'),
(56, 23, 12, 11, 3, 'PROGRAMADO', '2025-10-11 14:30:00', '2025-10-11 18:30:00', 'COMERCIAL'),
(57, 24, 13, 4, 1, 'PROGRAMADO', '2025-10-11 13:00:00', '2025-10-11 15:00:00', 'COMERCIAL'),
-- CANCELADOS
(58, 24, 13, 3, 2, 'CANCELADO', '2025-10-12 07:00:00', '2025-10-12 08:15:00', 'COMERCIAL'),

---- CALAFIA ----
-- FINALIZADOS
(59, 29, 14, 1, 2, 'FINALIZADO', '2025-07-07 07:00:00', '2025-07-07 08:30:00', 'COMERCIAL'),
(60, 30, 15, 3, 4, 'FINALIZADO', '2025-10-07 09:00:00', '2025-10-07 10:45:00', 'COMERCIAL'),
(61, 31, 16, 2, 3, 'FINALIZADO', '2025-10-07 11:00:00', '2025-10-07 12:15:00', 'CARGA'),
-- EN_VUELO
(62, 29, 14, 2, 10, 'EN_VUELO', '2025-10-11 08:30:00', '2025-10-11 12:30:00', 'COMERCIAL'),
(63, 30, 15, 4, 11, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 13:00:00', 'COMERCIAL'),
-- PROGRAMADOS
(64, 29, 14, 10, 2, 'PROGRAMADO', '2025-11-11 15:00:00', '2025-11-11 19:00:00', 'COMERCIAL'),
(65, 30, 15, 11, 3, 'PROGRAMADO', '2025-10-11 14:30:00', '2025-10-11 18:30:00', 'COMERCIAL'),
(66, 31, 16, 3, 1, 'PROGRAMADO', '2025-12-11 13:00:00', '2025-12-11 15:00:00', 'COMERCIAL'),
-- CANCELADOS
(67, 31, 16, 2, 4, 'CANCELADO', '2025-10-12 07:00:00', '2025-10-12 08:30:00', 'COMERCIAL'),

---- AEROMAR ----
-- FINALIZADOS
(68, 36, 17, 1, 2, 'FINALIZADO', '2025-10-08 06:30:00', '2025-10-08 07:30:00', 'COMERCIAL'),
(69, 37, 18, 2, 3, 'FINALIZADO', '2025-10-08 08:00:00', '2025-10-08 09:00:00', 'COMERCIAL'),
(70, 38, 17, 3, 1, 'FINALIZADO', '2025-10-08 10:00:00', '2025-10-08 11:30:00', 'CARGA'),
-- EN_VUELO
(71, 36, 17, 1, 4, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 11:30:00', 'COMERCIAL'),
-- EN_VUELO
(72, 37, 18, 3, 2, 'EN_VUELO', '2025-10-11 09:30:00', '2025-10-11 10:30:00', 'COMERCIAL'),
-- PROGRAMADOS
(73, 36, 17, 4, 1, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 16:30:00', 'COMERCIAL'),
(74, 37, 18, 2, 3, 'PROGRAMADO', '2025-10-11 11:00:00', '2025-10-11 12:00:00', 'COMERCIAL'),
-- CANCELADOS
(75, 38, 17, 2, 4, 'CANCELADO', '2025-10-12 08:00:00', '2025-10-12 09:30:00', 'COMERCIAL'),

---- AERUS ----
-- FINALIZADOS
(76, 43, 20, 1, 9, 'FINALIZADO', '2025-10-08 07:00:00', '2025-10-08 08:30:00', 'COMERCIAL'),
(77, 44, 21, 9, 12, 'FINALIZADO', '2025-10-08 09:00:00', '2025-10-08 10:30:00', 'CARGA'),
(78, 45, 20, 12, 1, 'FINALIZADO', '2025-10-08 11:00:00', '2025-10-08 12:30:00', 'COMERCIAL'),
-- EN_VUELO
(79, 43, 20, 1, 19, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 11:30:00', 'COMERCIAL'),
(80, 44, 21, 12, 9, 'EN_VUELO', '2025-10-11 09:30:00', '2025-10-11 10:30:00', 'COMERCIAL'),
-- PROGRAMADOS
(81, 43, 20, 19, 1, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 16:30:00', 'COMERCIAL'),
(82, 44, 21, 9, 12, 'PROGRAMADO', '2025-10-11 11:00:00', '2025-10-11 12:30:00', 'COMERCIAL'),
-- CANCELADOS
(83, 45, 20, 1, 12, 'CANCELADO', '2025-10-12 08:00:00', '2025-10-12 10:30:00', 'COMERCIAL'),

---- MAGNICHARTERS ----
-- FINALIZADOS
(84, 50, 23, 1, 4, 'FINALIZADO', '2025-10-08 06:00:00', '2025-10-08 08:00:00', 'COMERCIAL'),
(85, 51, 24, 2, 3, 'FINALIZADO', '2025-10-08 07:00:00', '2025-10-08 08:30:00', 'COMERCIAL'),
(86, 52, 23, 3, 1, 'FINALIZADO', '2025-10-08 09:00:00', '2025-10-08 11:00:00', 'CARGA'),
-- EN_VUELO
(87, 50, 23, 4, 10, 'EN_VUELO', '2025-10-11 08:30:00', '2025-10-11 12:00:00', 'COMERCIAL'),
(88, 51, 24, 3, 2, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 10:30:00', 'COMERCIAL'),
-- PROGRAMADOS
(89, 50, 23, 10, 1, 'PROGRAMADO', '2026-02-11 14:00:00', '2026-02-11 18:00:00', 'COMERCIAL'),
(90, 51, 24, 2, 4, 'PROGRAMADO', '2026-01-11 11:00:00', '2026-01-11 13:00:00', 'COMERCIAL'),

---- MEXICANA DE AVIACIÓN ----
-- FINALIZADOS
(91, 57, 26, 1, 4, 'FINALIZADO', '2025-08-07 06:00:00', '2025-08-07 08:00:00', 'COMERCIAL'), -- CDMX → Cancún
(92, 58, 27, 2, 3, 'FINALIZADO', '2025-10-07 07:00:00', '2025-10-07 08:30:00', 'COMERCIAL'), -- Guadalajara → Monterrey
(93, 59, 28, 3, 1, 'FINALIZADO', '2025-10-07 09:00:00', '2025-10-07 11:30:00', 'CARGA'), -- Monterrey → CDMX
-- EN_VUELO
(94, 57, 26, 4, 10, 'EN_VUELO', '2025-10-11 08:30:00', '2025-10-11 12:00:00', 'COMERCIAL'), -- Cancún → Los Ángeles
(95, 58, 27, 3, 2, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 10:30:00', 'COMERCIAL'), -- Monterrey → Guadalajara
(96, 59, 28, 1, 11, 'EN_VUELO', '2025-10-11 10:00:00', '2025-10-11 14:00:00', 'COMERCIAL'), -- CDMX → JFK
-- PROGRAMADOS
(97, 57, 26, 10, 1, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 18:00:00', 'COMERCIAL'), -- LAX → CDMX
(98, 58, 27, 2, 4, 'PROGRAMADO', '2025-10-11 11:00:00', '2025-10-11 13:00:00', 'COMERCIAL'), -- Guadalajara → Cancún
(99, 59, 28, 11, 20, 'PROGRAMADO', '2025-11-11 15:00:00', '2025-11-11 22:00:00', 'CARGA'), -- JFK → Madrid
-- CANCELADOS
(100, 57, 26, 1, 3, 'CANCELADO', '2025-10-12 07:00:00', '2025-10-12 09:00:00', 'COMERCIAL'), -- CDMX → Monterrey
(101, 58, 27, 2, 1, 'CANCELADO', '2025-10-12 08:00:00', '2025-10-12 09:30:00', 'COMERCIAL'), -- Guadalajara → CDMX


--ESTADOS UNIDOS-----------------------------------------------------------------------------------------------------
---- AMERICAN AIRLINES ----
-- FINALIZADOS
(102, 64, 29, 10, 12, 'FINALIZADO', '2025-09-08 06:00:00', '2025-09-08 08:00:00', 'COMERCIAL'), -- LAX → DFW
(103, 65, 30, 7, 10, 'FINALIZADO', '2025-10-08 07:00:00', '2025-10-08 11:00:00', 'COMERCIAL'), -- (7=N/A) → LAX
(104, 66, 31, 12, 11, 'FINALIZADO', '2025-10-08 09:00:00', '2025-10-08 13:00:00', 'CARGA'), -- DFW → JFK
-- EN_VUELO
(105, 64, 29, 12, 15, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 12:00:00', 'COMERCIAL'), -- DFW → Orlando
(106, 65, 30, 10, 14, 'EN_VUELO', '2025-10-11 08:30:00', '2025-10-11 11:00:00', 'COMERCIAL'), -- LAX → Denver
(107, 66, 31, 11, 20, 'EN_VUELO', '2025-10-11 10:00:00', '2025-10-11 18:00:00', 'COMERCIAL'), -- JFK → Madrid
-- PROGRAMADOS
(108, 64, 29, 15, 10, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 17:00:00', 'COMERCIAL'), -- Orlando → LAX
(109, 65, 30, 14, 12, 'PROGRAMADO', '2025-10-11 12:00:00', '2025-10-11 15:00:00', 'COMERCIAL'), -- Denver → DFW
(110, 66, 31, 20, 24, 'PROGRAMADO', '2025-12-11 20:00:00', '2025-12-12 10:00:00', 'CARGA'), -- Madrid → Tokyo
-- CANCELADOS
(111, 64, 29, 10, 11, 'CANCELADO', '2025-10-12 08:00:00', '2025-10-12 12:00:00', 'COMERCIAL'), -- LAX → JFK
(112, 65, 30, 12, 15, 'CANCELADO', '2025-10-12 09:00:00', '2025-10-12 12:00:00', 'COMERCIAL'), -- DFW → Orlando

---- DELTA AIR LINES ----
-- FINALIZADOS
(113, 71, 32, 11, 12, 'FINALIZADO', '2025-10-08 06:00:00', '2025-10-08 09:00:00', 'COMERCIAL'), -- JFK → DFW
(114, 72, 33, 12, 14, 'FINALIZADO', '2025-10-08 10:00:00', '2025-10-08 11:30:00', 'COMERCIAL'), -- DFW → Denver
(115, 73, 34, 14, 10, 'FINALIZADO', '2025-10-08 13:00:00', '2025-10-08 15:00:00', 'CARGA'), -- Denver → LAX
-- EN_VUELO
(116, 71, 32, 12, 13, 'EN_VUELO', '2025-10-11 08:00:00', '2025-10-11 09:45:00', 'COMERCIAL'), -- DFW → Chicago
(117, 72, 33, 14, 11, 'EN_VUELO', '2025-10-11 07:30:00', '2025-10-11 11:00:00', 'COMERCIAL'), -- Denver → JFK
(118, 73, 34, 10, 15, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 12:00:00', 'COMERCIAL'), -- LAX → Orlando
-- PROGRAMADOS
(119, 71, 32, 13, 14, 'PROGRAMADO', '2025-10-11 13:00:00', '2025-10-11 15:00:00', 'COMERCIAL'), -- Chicago → Denver
(120, 72, 33, 11, 10, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 17:00:00', 'COMERCIAL'), -- JFK → LAX
(121, 73, 34, 15, 12, 'PROGRAMADO', '2025-11-11 15:00:00', '2025-11-11 18:00:00', 'COMERCIAL'), -- Orlando → DFW

---- UNITED AIRLINES ----
-- FINALIZADOS
(122, 78, 35, 11, 12, 'FINALIZADO', '2025-10-08 07:00:00', '2025-10-08 10:00:00', 'COMERCIAL'), -- JFK → DFW
(123, 79, 36, 14, 10, 'FINALIZADO', '2025-09-08 09:00:00', '2025-09-08 11:30:00', 'CARGA'), -- Denver → LAX
-- EN_VUELO
(124, 78, 35, 12, 14, 'EN_VUELO', '2025-10-11 08:00:00', '2025-10-11 09:30:00', 'COMERCIAL'), -- DFW → Denver
(125, 79, 36, 10, 15, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 12:00:00', 'COMERCIAL'), -- LAX → Orlando
-- PROGRAMADOS
(126, 78, 35, 14, 11, 'PROGRAMADO', '2025-10-11 13:00:00', '2025-10-11 17:00:00', 'COMERCIAL'), -- Denver → JFK
(127, 79, 36, 15, 10, 'PROGRAMADO', '2025-10-11 15:00:00', '2025-10-11 18:00:00', 'COMERCIAL'), -- Orlando → LAX
-- CANCELADO
(128, 78, 35, 11, 13, 'CANCELADO', '2025-10-12 09:00:00', '2025-10-12 11:30:00', 'COMERCIAL'), -- JFK → Chicago

---- SOUTHWEST AIRLINES ----
-- FINALIZADOS
(129, 85, 38, 13, 12, 'FINALIZADO', '2025-10-08 06:00:00', '2025-10-08 08:30:00', 'COMERCIAL'), -- Chicago → Dallas
(130, 86, 39, 14, 13, 'FINALIZADO', '2025-10-08 07:30:00', '2025-10-08 09:30:00', 'CARGA'), -- Denver → Chicago
-- EN_VUELO
(131, 85, 38, 12, 10, 'EN_VUELO', '2025-10-11 08:00:00', '2025-10-11 09:30:00', 'COMERCIAL'), -- Dallas → LAX
(132, 86, 39, 13, 14, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 10:30:00', 'COMERCIAL'), -- Chicago → Denver
-- PROGRAMADOS
(133, 85, 38, 10, 15, 'PROGRAMADO', '2025-10-11 12:00:00', '2025-10-11 15:00:00', 'COMERCIAL'), -- LAX → Orlando
(134, 86, 39, 14, 13, 'PROGRAMADO', '2025-10-11 13:00:00', '2025-10-11 15:00:00', 'COMERCIAL'), -- Denver → Chicago
(135, 87, 40, 15, 10, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 17:00:00', 'COMERCIAL'), -- Orlando → LAX
-- CANCELADOS
(136, 85, 38, 10, 11, 'CANCELADO', '2025-10-12 09:00:00', '2025-10-12 12:00:00', 'COMERCIAL'), -- LAX → JFK

---- JETBLUE AIRWAYS ----
-- FINALIZADOS
(137, 92, 41, 11, 13, 'FINALIZADO', '2025-10-08 06:00:00', '2025-10-08 08:30:00', 'COMERCIAL'), -- JFK → Chicago
(138, 93, 42, 13, 12, 'FINALIZADO', '2025-10-08 09:30:00', '2025-10-08 11:30:00', 'CARGA'), -- Chicago → Dallas
-- EN_VUELO
(139, 92, 41, 13, 14, 'EN_VUELO', '2025-10-11 08:00:00', '2025-10-11 10:30:00', 'COMERCIAL'), -- Chicago → Denver
(140, 94, 43, 12, 11, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 11:30:00', 'COMERCIAL'), -- Dallas → JFK
-- PROGRAMADOS
(141, 92, 41, 14, 15, 'PROGRAMADO', '2025-10-11 13:00:00', '2025-10-11 16:00:00', 'COMERCIAL'), -- Denver → Orlando
(142, 93, 42, 12, 13, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 16:00:00', 'COMERCIAL'), -- Dallas → Chicago

---- ALASKA AIRLINES ----
-- FINALIZADOS
(143, 99, 44, 10, 11, 'FINALIZADO', '2025-10-08 06:00:00', '2025-10-08 09:00:00', 'COMERCIAL'), -- LAX → JFK
(144, 100, 45, 11, 12, 'FINALIZADO', '2025-10-08 07:30:00', '2025-10-08 10:30:00', 'CARGA'), -- JFK → DFW
-- EN_VUELO
(145, 101, 46, 12, 13, 'EN_VUELO', '2025-10-11 08:00:00', '2025-10-11 10:30:00', 'COMERCIAL'), -- DFW → Chicago
(146, 102, 44, 13, 10, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 11:30:00', 'COMERCIAL'), -- Chicago → LAX
-- PROGRAMADOS
(147, 99, 44, 10, 14, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 17:00:00', 'COMERCIAL'), -- LAX → Denver
(148, 103, 45, 12, 11, 'PROGRAMADO', '2025-10-11 13:00:00', '2025-10-11 16:00:00', 'COMERCIAL'), -- DFW → JFK

---- SPIRIT AIRLINES ----
-- FINALIZADOS
(149, 106, 47, 15, 10, 'FINALIZADO', '2025-10-08 06:00:00', '2025-10-08 09:00:00', 'COMERCIAL'), -- Orlando → LAX
(150, 107, 48, 10, 11, 'FINALIZADO', '2025-10-08 10:00:00', '2025-10-08 14:00:00', 'CARGA'), -- LAX → JFK
-- EN_VUELO
(151, 108, 47, 11, 12, 'EN_VUELO', '2025-10-11 08:30:00', '2025-10-11 10:30:00', 'COMERCIAL'), -- JFK → DFW
(152, 109, 49, 12, 13, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 11:00:00', 'COMERCIAL'), -- DFW → Chicago
-- PROGRAMADOS
(153, 106, 47, 13, 15, 'PROGRAMADO', '2025-10-11 13:00:00', '2025-10-11 16:00:00', 'COMERCIAL'), -- Chicago → Orlando
(154, 107, 48, 11, 20, 'PROGRAMADO', '2025-10-11 20:00:00', '2025-10-12 08:00:00', 'COMERCIAL'), -- JFK → Madrid
 
---- FRONTIER AIRLINES ----
-- FINALIZADOS
(155, 113, 50, 14, 11, 'FINALIZADO', '2025-10-08 06:30:00', '2025-10-08 09:30:00', 'COMERCIAL'), -- Denver → JFK
(156, 114, 51, 11, 12, 'FINALIZADO', '2025-10-08 10:00:00', '2025-10-08 13:00:00', 'CARGA'), -- JFK → DFW
-- EN_VUELO
(157, 115, 52, 12, 13, 'EN_VUELO', '2025-10-11 08:00:00', '2025-10-11 10:30:00', 'COMERCIAL'), -- DFW → Chicago
(158, 116, 50, 13, 10, 'EN_VUELO', '2025-10-11 09:30:00', '2025-10-11 12:30:00', 'COMERCIAL'), -- Chicago → LAX
-- PROGRAMADOS
(159, 113, 50, 10, 14, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 17:00:00', 'COMERCIAL'), -- LAX → Denver

--BRASIL--------------------------------------------------------------------------------------------------------------------
---- LATAM BRASIL ----
-- FINALIZADOS
(160, 120, 53, 16, 18, 'FINALIZADO', '2025-10-08 06:00:00', '2025-10-08 07:30:00', 'COMERCIAL'), -- São Paulo → Río de Janeiro
(161, 121, 54, 17, 19, 'FINALIZADO', '2025-10-08 07:00:00', '2025-10-08 08:30:00', 'CARGA'), -- Brasília → Belo Horizonte
-- EN_VUELO
(162, 122, 55, 16, 20, 'EN_VUELO', '2025-10-11 08:00:00', '2025-10-11 18:00:00', 'COMERCIAL'), -- São Paulo → Madrid
(163, 123, 53, 17, 21, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 19:30:00', 'COMERCIAL'), -- Brasília → Barcelona
-- PROGRAMADOS
(164, 124, 54, 18, 16, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 15:30:00', 'COMERCIAL'), -- Río de Janeiro → São Paulo
(165, 125, 55, 16, 24, 'PROGRAMADO', '2025-10-11 20:00:00', '2025-10-12 10:00:00', 'COMERCIAL'), -- São Paulo → Tokyo
-- CANCELADOS
(166, 120, 53, 16, 19, 'CANCELADO', '2025-10-12 08:00:00', '2025-10-12 09:30:00', 'COMERCIAL'), -- São Paulo → Belo Horizonte

---- GOL LINHAS AÉREAS ----
-- FINALIZADOS
(167, 127, 56, 16, 19, 'FINALIZADO', '2025-10-08 06:30:00', '2025-10-08 08:00:00', 'COMERCIAL'), -- São Paulo → Belo Horizonte
(168, 128, 57, 19, 17, 'FINALIZADO', '2025-10-08 07:30:00', '2025-10-08 09:00:00', 'CARGA'), -- Belo Horizonte → Brasília
-- EN_VUELO
(169, 129, 58, 17, 16, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 10:30:00', 'COMERCIAL'), -- Brasília → São Paulo
-- PROGRAMADOS
(170, 130, 56, 16, 20, 'PROGRAMADO', '2025-10-11 13:00:00', '2025-10-11 18:00:00', 'COMERCIAL'), -- São Paulo → Madrid
(171, 131, 57, 19, 16, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 15:30:00', 'COMERCIAL'), -- Belo Horizonte → São Paulo
-- CANCELADOS
(172, 132, 58, 16, 19, 'CANCELADO', '2025-10-12 08:00:00', '2025-10-12 09:30:00', 'COMERCIAL'), -- São Paulo → Belo Horizonte

---- AZUL LINHAS AÉREAS ----
-- FINALIZADOS
(173, 134, 59, 16, 18, 'FINALIZADO', '2025-10-08 07:00:00', '2025-10-08 08:30:00', 'COMERCIAL'), -- São Paulo → Río de Janeiro
(174, 135, 60, 17, 16, 'FINALIZADO', '2025-10-08 08:00:00', '2025-10-08 09:30:00', 'CARGA'), -- Brasília → São Paulo
-- EN_VUELO
(175, 136, 61, 16, 20, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 18:00:00', 'COMERCIAL'), -- São Paulo → Madrid
(176, 137, 59, 16, 17, 'EN_VUELO', '2025-10-11 10:00:00', '2025-10-11 11:30:00', 'COMERCIAL'), -- São Paulo → Brasília
-- PROGRAMADOS
(177, 138, 60, 17, 18, 'PROGRAMADO', '2025-10-11 12:00:00', '2025-10-11 13:30:00', 'COMERCIAL'), -- Brasília → Río de Janeiro
(178, 139, 61, 18, 16, 'PROGRAMADO', '2025-10-11 14:30:00', '2025-10-11 16:00:00', 'COMERCIAL'), -- Río de Janeiro → São Paulo
-- CANCELADOS
(179, 140, 60, 16, 19, 'CANCELADO', '2025-10-12 08:00:00', '2025-10-12 09:30:00', 'COMERCIAL'), -- São Paulo → Belo Horizonte

--ESPAÑA------------------------------------------------------------------------------------------------------------------
---- IBERIA ----
-- FINALIZADOS
(180, 155, 62, 20, 11, 'FINALIZADO', '2025-10-08 07:00:00', '2025-10-08 11:00:00', 'COMERCIAL'), -- Madrid → JFK 
(181, 156, 63, 21, 16, 'FINALIZADO', '2025-10-08 08:00:00', '2025-10-08 16:00:00', 'CARGA'), -- Barcelona → São Paulo 
(182, 157, 64, 22, 23, 'FINALIZADO', '2025-10-08 09:00:00', '2025-10-08 10:30:00', 'COMERCIAL'), -- Málaga → Valencia 
-- EN_VUELO
(183, 158, 62, 20, 1, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 17:00:00', 'COMERCIAL'), -- Madrid → Ciudad de México 
(184, 159, 63, 21, 24, 'EN_VUELO', '2025-10-11 09:30:00', '2025-10-11 21:30:00', 'COMERCIAL'), -- Barcelona → Tokio 
(185, 160, 64, 20, 22, 'EN_VUELO', '2025-10-11 10:00:00', '2025-10-11 11:30:00', 'COMERCIAL'), -- Madrid → Málaga
-- PROGRAMADOS
(186, 161, 62, 20, 14, 'PROGRAMADO', '2025-10-11 13:00:00', '2025-10-11 16:00:00', 'COMERCIAL'), -- Madrid → Denver 
(187, 156, 63, 21, 12, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 22:00:00', 'COMERCIAL'), -- Barcelona → Dallas
(188, 155, 64, 23, 21, 'PROGRAMADO', '2025-10-11 15:00:00', '2025-10-11 16:30:00', 'COMERCIAL'), -- Valencia → Barcelona 
-- CANCELADOS
(189, 157, 62, 20, 23, 'CANCELADO', '2025-10-12 08:00:00', '2025-10-12 09:30:00', 'COMERCIAL'), -- Madrid → Valencia 

---- AIR EUROPA ----
-- FINALIZADOS
(190, 162, 65, 20, 16, 'FINALIZADO', '2025-10-08 06:30:00', '2025-10-08 13:30:00', 'COMERCIAL'), -- Madrid → São Paulo 
(191, 163, 66, 21, 1, 'FINALIZADO', '2025-10-08 07:00:00', '2025-10-08 15:00:00', 'CARGA'), -- Barcelona → Ciudad de México 
(192, 164, 67, 22, 23, 'FINALIZADO', '2025-10-08 08:00:00', '2025-10-08 09:30:00', 'COMERCIAL'), -- Málaga → Valencia 
-- EN_VUELO
(193, 165, 65, 20, 11, 'EN_VUELO', '2025-10-11 08:30:00', '2025-10-11 12:30:00', 'COMERCIAL'), -- Madrid → JFK 
(194, 166, 66, 21, 16, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 17:00:00', 'COMERCIAL'), -- Barcelona → São Paulo 
(195, 167, 67, 20, 22, 'EN_VUELO', '2025-10-11 10:00:00', '2025-10-11 11:30:00', 'COMERCIAL'), -- Madrid → Málaga 
-- PROGRAMADOS
(196, 168, 65, 21, 24, 'PROGRAMADO', '2025-10-11 12:30:00', '2025-10-11 22:30:00', 'COMERCIAL'), -- Barcelona → Tokio 
(197, 163, 66, 20, 14, 'PROGRAMADO', '2025-10-11 13:30:00', '2025-10-11 16:30:00', 'COMERCIAL'), -- Madrid → Denver
(198, 162, 67, 23, 21, 'PROGRAMADO', '2025-10-11 15:00:00', '2025-10-11 16:30:00', 'COMERCIAL'), -- Valencia → Barcelona 
-- CANCELADOS
(199, 164, 65, 20, 22, 'CANCELADO', '2025-10-12 08:30:00', '2025-10-12 10:00:00', 'COMERCIAL'), -- Madrid → Málaga

---- VUELING AIRLINES ----
-- FINALIZADOS
(200, 169, 68, 20, 11, 'FINALIZADO', '2025-10-08 06:00:00', '2025-10-08 10:00:00', 'COMERCIAL'), -- Madrid → JFK
(201, 170, 69, 21, 16, 'FINALIZADO', '2025-10-08 07:00:00', '2025-10-08 15:00:00', 'CARGA'), -- Barcelona → São Paulo 
(202, 171, 70, 22, 23, 'FINALIZADO', '2025-10-08 08:00:00', '2025-10-08 09:30:00', 'COMERCIAL'), -- Málaga → Valencia 
-- EN_VUELO
(203, 172, 68, 20, 1, 'EN_VUELO', '2025-10-11 08:30:00', '2025-10-11 16:30:00', 'COMERCIAL'), -- Madrid → Ciudad de México 
(204, 174, 69, 21, 24, 'EN_VUELO', '2025-10-11 09:30:00', '2025-10-11 21:30:00', 'COMERCIAL'), -- Barcelona → Tokio 
(205, 175, 70, 20, 22, 'EN_VUELO', '2025-10-11 10:30:00', '2025-10-11 12:00:00', 'COMERCIAL'), -- Madrid → Málaga 
-- PROGRAMADOS
(206, 169, 68, 21, 20, 'PROGRAMADO', '2025-10-11 13:00:00', '2025-10-11 15:00:00', 'COMERCIAL'), -- Barcelona → Madrid 
(207, 170, 69, 22, 14, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 17:00:00', 'COMERCIAL'), -- Málaga → Denver 
(208, 171, 70, 20, 12, 'PROGRAMADO', '2025-10-11 15:00:00', '2025-10-11 23:00:00', 'COMERCIAL'), 


--JAPÓN----------------------------------------------------------------------------------------------------------
---- JAPAN AIRLINES ----
-- FINALIZADOS
(209, 176, 71, 24, 25, 'FINALIZADO', '2025-10-08 06:00:00', '2025-10-08 07:15:00', 'COMERCIAL'), -- Tokio → Osaka 
(210, 177, 72, 25, 26, 'FINALIZADO', '2025-10-08 07:45:00', '2025-10-08 08:45:00', 'COMERCIAL'), -- Osaka → Nagoya 
(211, 178, 73, 24, 11, 'FINALIZADO', '2025-10-08 09:00:00', '2025-10-08 20:00:00', 'CARGA'), -- Tokio → JFK
(212, 179, 74, 26, 20, 'FINALIZADO', '2025-10-08 10:00:00', '2025-10-08 18:30:00', 'COMERCIAL'), -- Nagoya → Madrid
-- EN_VUELO
(213, 180, 71, 27, 24, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 10:40:00', 'COMERCIAL'), -- Sapporo → Tokio
(214, 176, 72, 24, 21, 'EN_VUELO', '2025-10-11 08:30:00', '2025-10-11 16:00:00', 'COMERCIAL'), -- Tokio → Barcelona 
(215, 177, 73, 25, 14, 'EN_VUELO', '2025-10-11 09:00:00', '2025-10-11 16:30:00', 'COMERCIAL'), -- Osaka → Denver
-- PROGRAMADOS
(216, 178, 74, 26, 27, 'PROGRAMADO', '2025-10-11 13:00:00', '2025-10-11 14:20:00', 'COMERCIAL'), -- Nagoya → Sapporo 
(217, 179, 71, 24, 1, 'PROGRAMADO', '2025-10-11 14:00:00', '2025-10-11 22:00:00', 'COMERCIAL'), -- Tokio → Ciudad de México
(218, 180, 72, 27, 16, 'PROGRAMADO', '2025-10-11 15:00:00', '2025-10-11 23:00:00', 'CARGA'), -- Sapporo → São Paulo
-- CANCELADOS
(219, 176, 73, 25, 26, 'CANCELADO', '2025-10-12 08:30:00', '2025-10-12 09:45:00', 'COMERCIAL'), -- Osaka → Nagoya 
(220, 177, 74, 24, 12, 'CANCELADO', '2025-10-12 09:00:00', '2025-10-12 17:00:00', 'COMERCIAL'); -- Tokio → Dallas






--_______________________________________________________________________________________________________________
--------------------------TARIFAS Y BOLETOS POR VUELO-----------------------------------------------------------

---- AEROMÉXICO ----
-- TARIFAS DEL VUELO 2 (CDMX → Guadalajara, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(1, 2, 1200, 'ECONOMICA'),
(2, 2, 2200, 'EJECUTIVA'),
(3, 2, 3500, 'PREMIUM');
-- BOLETOS DEL VUELO 2
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(2, 1, '2025-10-01', 1),
(2, 1, '2025-10-02', 2),
(2, 1, '2025-10-03', 3),
(2, 1, '2025-10-04', 4),
(2, 1, '2025-10-05', 5),
(2, 1, '2025-10-06', 6),
(2, 1, '2025-10-06', 7),
(2, 2, '2025-10-07', 8),
(2, 1, '2025-10-07', 9),
(2, 3, '2025-10-08', 10),
(2, 1, '2025-10-08', 11),
(2, 1, '2025-10-09', 12),
(2, 1, '2025-10-09', 13),
(2, 1, '2025-10-09', 14),
(2, 1, '2025-10-10', 15),
(2, 2, '2025-10-10', 16);

-- VUELO 3 (Guadalajara → Monterrey, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(4, 3, 1100, 'ECONOMICA'),
(5, 3, 2000, 'EJECUTIVA'),
(6, 3, 3200, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(3, 4, '2025-10-01', 1),
(3, 4, '2025-10-02', 2),
(3, 5, '2025-10-02', 3),
(3, 4, '2025-10-03', 4),
(3, 4, '2025-10-04', 5),
(3, 4, '2025-10-05', 6),
(3, 6, '2025-10-05', 7),
(3, 4, '2025-10-06', 8),
(3, 4, '2025-10-07', 9),
(3, 4, '2025-10-07', 10),
(3, 4, '2025-10-08', 11),
(3, 5, '2025-10-08', 12),
(3, 4, '2025-10-09', 13),
(3, 4, '2025-10-09', 14),
(3, 4, '2025-10-10', 15);

-- VUELO 4 (CDMX → Cancún, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(7, 4, 1400, 'ECONOMICA'),
(8, 4, 2500, 'EJECUTIVA'),
(9, 4, 3800, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(4, 7, '2025-10-01', 1),
(4, 7, '2025-10-01', 2),
(4, 7, '2025-10-02', 3),
(4, 8, '2025-10-03', 4),
(4, 7, '2025-10-04', 5),
(4, 7, '2025-10-05', 6),
(4, 7, '2025-10-05', 7),
(4, 9, '2025-10-06', 8),
(4, 7, '2025-10-07', 9),
(4, 7, '2025-10-07', 10),
(4, 7, '2025-10-08', 11),
(4, 8, '2025-10-08', 12),
(4, 7, '2025-10-09', 13),
(4, 7, '2025-10-09', 14),
(4, 7, '2025-10-10', 15),
(4, 7, '2025-10-10', 16);

-- VUELO 5 (Guadalajara → CDMX, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(10, 5, 1100, 'ECONOMICA'),
(11, 5, 2000, 'EJECUTIVA'),
(12, 5, 3200, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(5, 10, '2025-10-01', 1),
(5, 10, '2025-10-01', 2),
(5, 10, '2025-10-02', 3),
(5, 11, '2025-10-03', 4),
(5, 10, '2025-10-04', 5),
(5, 10, '2025-10-05', 6),
(5, 12, '2025-10-05', 7),
(5, 10, '2025-10-06', 8),
(5, 10, '2025-10-07', 9),
(5, 10, '2025-10-07', 10),
(5, 10, '2025-10-08', 11),
(5, 11, '2025-10-08', 12),
(5, 10, '2025-10-09', 13),
(5, 10, '2025-10-09', 14),
(5, 10, '2025-10-10', 15);

-- VUELO 6 (Monterrey → CDMX, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(13, 6, 1200, 'ECONOMICA'),
(14, 6, 2200, 'EJECUTIVA'),
(15, 6, 3500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(6, 13, '2025-10-01', 1),
(6, 13, '2025-10-02', 2),
(6, 14, '2025-10-02', 3),
(6, 13, '2025-10-03', 4),
(6, 13, '2025-10-04', 5),
(6, 13, '2025-10-05', 6),
(6, 13, '2025-10-05', 7),
(6, 14, '2025-10-06', 8),
(6, 13, '2025-10-07', 9),
(6, 13, '2025-10-07', 10),
(6, 13, '2025-10-08', 11),
(6, 14, '2025-10-08', 12),
(6, 13, '2025-10-09', 13),
(6, 13, '2025-10-09', 14),
(6, 13, '2025-10-10', 15);

-- VUELO 7 (Cancún → CDMX, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(16, 7, 1400, 'ECONOMICA'),
(17, 7, 2500, 'EJECUTIVA'),
(18, 7, 3800, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(7, 16, '2025-10-01', 1),
(7, 16, '2025-10-01', 2),
(7, 16, '2025-10-02', 3),
(7, 17, '2025-10-03', 4),
(7, 16, '2025-10-04', 5),
(7, 16, '2025-10-05', 6),
(7, 16, '2025-10-05', 7),
(7, 17, '2025-10-06', 8),
(7, 16, '2025-10-07', 9),
(7, 16, '2025-10-07', 10),
(7, 16, '2025-10-08', 11),
(7, 17, '2025-10-08', 12),
(7, 16, '2025-10-09', 13),
(7, 16, '2025-10-09', 14),
(7, 16, '2025-10-10', 15);

-- VUELO 9 (Cancún → JFK, internacional, carga)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(22, 9, 6000, 'ECONOMICA'),
(23, 9, 9500, 'EJECUTIVA'),
(24, 9, 14000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(9, 22, '2025-10-01', 1),
(9, 22, '2025-10-02', 2),
(9, 22, '2025-10-02', 3),
(9, 23, '2025-10-03', 4),
(9, 22, '2025-10-04', 5),
(9, 22, '2025-10-05', 6),
(9, 22, '2025-10-05', 7),
(9, 23, '2025-10-06', 8),
(9, 22, '2025-10-07', 9),
(9, 22, '2025-10-07', 10),
(9, 22, '2025-10-08', 11),
(9, 23, '2025-10-08', 12),
(9, 22, '2025-10-09', 13),
(9, 22, '2025-10-09', 14),
(9, 22, '2025-10-10', 15);

-- VUELO 10 (CDMX → Cancún, nacional, cancelado)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(25, 10, 1400, 'ECONOMICA'),
(26, 10, 2500, 'EJECUTIVA'),
(27, 10, 3800, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(10, 25, '2025-10-01', 1),
(10, 25, '2025-10-01', 2),
(10, 26, '2025-10-02', 3),
(10, 25, '2025-10-03', 4),
(10, 25, '2025-10-04', 5),
(10, 25, '2025-10-05', 6),
(10, 27, '2025-10-05', 7),
(10, 25, '2025-10-06', 8),
(10, 25, '2025-10-07', 9),
(10, 25, '2025-10-07', 10),
(10, 25, '2025-10-08', 11),
(10, 26, '2025-10-08', 12),
(10, 25, '2025-10-09', 13),
(10, 25, '2025-10-09', 14),
(10, 25, '2025-10-10', 15);

-- VUELO 11 (Guadalajara → Monterrey, nacional, cancelado)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(28, 11, 1100, 'ECONOMICA'),
(29, 11, 2000, 'EJECUTIVA'),
(30, 11, 3200, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(11, 28, '2025-10-01', 1),
(11, 28, '2025-10-02', 2),
(11, 28, '2025-10-02', 3),
(11, 29, '2025-10-03', 4),
(11, 28, '2025-10-04', 5),
(11, 28, '2025-10-05', 6),
(11, 28, '2025-10-05', 7),
(11, 29, '2025-10-06', 8),
(11, 28, '2025-10-07', 9),
(11, 28, '2025-10-07', 10),
(11, 28, '2025-10-08', 11),
(11, 29, '2025-10-08', 12),
(11, 28, '2025-10-09', 13),
(11, 28, '2025-10-09', 14),
(11, 28, '2025-10-10', 15);


---- VOLARIS ----
-- VUELO 12 (CDMX → Guadalajara, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(31, 12, 1500, 'ECONOMICA'),
(32, 12, 2700, 'EJECUTIVA'),
(33, 12, 4000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(12, 31, '2025-10-01', 1),
(12, 31, '2025-10-02', 2),
(12, 31, '2025-10-02', 3),
(12, 32, '2025-10-03', 4),
(12, 31, '2025-10-04', 5),
(12, 31, '2025-10-05', 6),
(12, 31, '2025-10-05', 7),
(12, 32, '2025-10-06', 8),
(12, 31, '2025-10-07', 9),
(12, 31, '2025-10-07', 10),
(12, 31, '2025-10-08', 11),
(12, 32, '2025-10-08', 12),
(12, 31, '2025-10-09', 13),
(12, 31, '2025-10-09', 14),
(12, 31, '2025-10-10', 15);

-- VUELO 13 (Guadalajara → Monterrey, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(34, 13, 1600, 'ECONOMICA'),
(35, 13, 2800, 'EJECUTIVA'),
(36, 13, 4100, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(13, 34, '2025-10-01', 1),
(13, 34, '2025-10-02', 2),
(13, 34, '2025-10-02', 3),
(13, 35, '2025-10-03', 4),
(13, 34, '2025-10-04', 5),
(13, 34, '2025-10-05', 6),
(13, 34, '2025-10-05', 7),
(13, 35, '2025-10-06', 8),
(13, 34, '2025-10-07', 9),
(13, 34, '2025-10-07', 10),
(13, 34, '2025-10-08', 11),
(13, 35, '2025-10-08', 12),
(13, 34, '2025-10-09', 13),
(13, 34, '2025-10-09', 14),
(13, 34, '2025-10-10', 15);

-- VUELO 15 (Fukuoka → Guadalajara, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(37, 15, 1800, 'ECONOMICA'),
(38, 15, 3000, 'EJECUTIVA'),
(39, 15, 4300, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(15, 37, '2025-10-01', 1),
(15, 37, '2025-10-02', 2),
(15, 37, '2025-10-02', 3),
(15, 38, '2025-10-03', 4),
(15, 37, '2025-10-04', 5),
(15, 37, '2025-10-05', 6),
(15, 37, '2025-10-05', 7),
(15, 38, '2025-10-06', 8),
(15, 37, '2025-10-07', 9),
(15, 37, '2025-10-07', 10),
(15, 37, '2025-10-08', 11),
(15, 38, '2025-10-08', 12),
(15, 37, '2025-10-09', 13),
(15, 37, '2025-10-09', 14),
(15, 37, '2025-10-10', 15);

-- VUELO 16 (Monterrey → CDMX, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(40, 16, 1400, 'ECONOMICA'),
(41, 16, 2600, 'EJECUTIVA'),
(42, 16, 3900, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(16, 40, '2025-10-01', 1),
(16, 40, '2025-10-02', 2),
(16, 40, '2025-10-02', 3),
(16, 41, '2025-10-03', 4),
(16, 40, '2025-10-04', 5),
(16, 40, '2025-10-05', 6),
(16, 40, '2025-10-05', 7),
(16, 41, '2025-10-06', 8),
(16, 40, '2025-10-07', 9),
(16, 40, '2025-10-07', 10),
(16, 40, '2025-10-08', 11),
(16, 41, '2025-10-08', 12),
(16, 40, '2025-10-09', 13),
(16, 40, '2025-10-09', 14),
(16, 40, '2025-10-10', 15);

-- VUELO 17 (CDMX → Orlando, internacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(43, 17, 6000, 'ECONOMICA'),
(44, 17, 9500, 'EJECUTIVA'),
(45, 17, 14000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(17, 43, '2025-10-01', 1),
(17, 43, '2025-10-02', 2),
(17, 43, '2025-10-02', 3),
(17, 44, '2025-10-03', 4),
(17, 43, '2025-10-04', 5),
(17, 43, '2025-10-05', 6),
(17, 43, '2025-10-05', 7),
(17, 44, '2025-10-06', 8),
(17, 43, '2025-10-07', 9),
(17, 43, '2025-10-07', 10),
(17, 43, '2025-10-08', 11),
(17, 44, '2025-10-08', 12),
(17, 43, '2025-10-09', 13),
(17, 43, '2025-10-09', 14),
(17, 43, '2025-10-10', 15);

-- VUELO 18 (Guadalajara → Madrid, internacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(46, 18, 7500, 'ECONOMICA'),
(47, 18, 12000, 'EJECUTIVA'),
(48, 18, 17500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(18, 46, '2025-10-01', 1),
(18, 46, '2025-10-02', 2),
(18, 46, '2025-10-02', 3),
(18, 47, '2025-10-03', 4),
(18, 46, '2025-10-04', 5),
(18, 46, '2025-10-05', 6),
(18, 46, '2025-10-05', 7),
(18, 47, '2025-10-06', 8),
(18, 46, '2025-10-07', 9),
(18, 46, '2025-10-07', 10),
(18, 46, '2025-10-08', 11),
(18, 47, '2025-10-08', 12),
(18, 46, '2025-10-09', 13),
(18, 46, '2025-10-09', 14),
(18, 46, '2025-10-10', 15);

-- VUELO 19 (CDMX → Belo Horizonte, internacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(49, 19, 6800, 'ECONOMICA'),
(50, 19, 11000, 'EJECUTIVA'),
(51, 19, 16000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(19, 49, '2025-10-01', 1),
(19, 49, '2025-10-02', 2),
(19, 49, '2025-10-02', 3),
(19, 50, '2025-10-03', 4),
(19, 49, '2025-10-04', 5),
(19, 49, '2025-10-05', 6),
(19, 49, '2025-10-05', 7),
(19, 50, '2025-10-06', 8),
(19, 49, '2025-10-07', 9),
(19, 49, '2025-10-07', 10),
(19, 49, '2025-10-08', 11),
(19, 50, '2025-10-08', 12),
(19, 49, '2025-10-09', 13),
(19, 49, '2025-10-09', 14),
(19, 49, '2025-10-10', 15);

-- VUELO 20 (Orlando → Guadalajara, internacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(52, 20, 6200, 'ECONOMICA'),
(53, 20, 10000, 'EJECUTIVA'),
(54, 20, 14500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(20, 52, '2025-10-01', 1),
(20, 52, '2025-10-02', 2),
(20, 52, '2025-10-02', 3),
(20, 53, '2025-10-03', 4),
(20, 52, '2025-10-04', 5),
(20, 52, '2025-10-05', 6),
(20, 52, '2025-10-05', 7),
(20, 53, '2025-10-06', 8),
(20, 52, '2025-10-07', 9),
(20, 52, '2025-10-07', 10),
(20, 52, '2025-10-08', 11),
(20, 53, '2025-10-08', 12),
(20, 52, '2025-10-09', 13),
(20, 52, '2025-10-09', 14),
(20, 52, '2025-10-10', 15);

-- VUELO 21 (Guadalajara → Monterrey, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(55, 21, 1600, 'ECONOMICA'),
(56, 21, 2800, 'EJECUTIVA'),
(57, 21, 4100, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(21, 55, '2025-10-01', 1),
(21, 55, '2025-10-02', 2),
(21, 55, '2025-10-02', 3),
(21, 56, '2025-10-03', 4),
(21, 55, '2025-10-04', 5),
(21, 55, '2025-10-05', 6),
(21, 55, '2025-10-05', 7),
(21, 56, '2025-10-06', 8),
(21, 55, '2025-10-07', 9),
(21, 55, '2025-10-07', 10),
(21, 55, '2025-10-08', 11),
(21, 56, '2025-10-08', 12),
(21, 55, '2025-10-09', 13),
(21, 55, '2025-10-09', 14),
(21, 55, '2025-10-10', 15);

-- VUELO 22 (Monterrey → CDMX, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(58, 22, 1400, 'ECONOMICA'),
(59, 22, 2600, 'EJECUTIVA'),
(60, 22, 3900, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(22, 58, '2025-10-01', 1),
(22, 58, '2025-10-02', 2),
(22, 58, '2025-10-02', 3),
(22, 59, '2025-10-03', 4),
(22, 58, '2025-10-04', 5),
(22, 58, '2025-10-05', 6),
(22, 58, '2025-10-05', 7),
(22, 59, '2025-10-06', 8),
(22, 58, '2025-10-07', 9),
(22, 58, '2025-10-07', 10),
(22, 58, '2025-10-08', 11),
(22, 59, '2025-10-08', 12),
(22, 58, '2025-10-09', 13),
(22, 58, '2025-10-09', 14),
(22, 58, '2025-10-10', 15);

-- VUELO 24 (Monterrey → CDMX, nacional, CANCELADO)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(61, 24, 1400, 'ECONOMICA'),
(62, 24, 2600, 'EJECUTIVA'),
(63, 24, 3900, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(24, 61, '2025-10-01', 1),
(24, 61, '2025-10-02', 2),
(24, 61, '2025-10-02', 3),
(24, 62, '2025-10-03', 4),
(24, 61, '2025-10-04', 5),
(24, 61, '2025-10-05', 6),
(24, 61, '2025-10-05', 7),
(24, 62, '2025-10-06', 8),
(24, 61, '2025-10-07', 9),
(24, 61, '2025-10-07', 10),
(24, 61, '2025-10-08', 11),
(24, 62, '2025-10-08', 12),
(24, 61, '2025-10-09', 13),
(24, 61, '2025-10-09', 14),
(24, 61, '2025-10-10', 15);


---- AEROBUS ----
-- VUELO 41 (Ciudad de México → Guadalajara, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(106, 41, 1200, 'ECONOMICA'),
(107, 41, 2500, 'EJECUTIVA'),
(108, 41, 4000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(41, 106, '2025-10-01', 1),
(41, 106, '2025-10-01', 2),
(41, 106, '2025-10-02', 3),
(41, 107, '2025-10-02', 4),
(41, 106, '2025-10-03', 5),
(41, 106, '2025-10-03', 6),
(41, 106, '2025-10-04', 7),
(41, 106, '2025-10-04', 8),
(41, 107, '2025-10-05', 9),
(41, 106, '2025-10-05', 10),
(41, 106, '2025-10-06', 11);

-- VUELO 42 (Guadalajara → Monterrey, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(109, 42, 1100, 'ECONOMICA'),
(110, 42, 2300, 'EJECUTIVA'),
(111, 42, 3800, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(42, 109, '2025-10-01', 1),
(42, 109, '2025-10-01', 2),
(42, 109, '2025-10-02', 3),
(42, 110, '2025-10-02', 4),
(42, 109, '2025-10-03', 5),
(42, 109, '2025-10-03', 6),
(42, 109, '2025-10-04', 7),
(42, 109, '2025-10-04', 8),
(42, 110, '2025-10-05', 9),
(42, 109, '2025-10-05', 10),
(42, 109, '2025-10-06', 11),
(42, 109, '2025-10-06', 12);

-- VUELO 44 (Guadalajara → Orlando, internacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(112, 44, 6000, 'ECONOMICA'),
(113, 44, 12000, 'EJECUTIVA'),
(114, 44, 18000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(44, 112, '2025-10-01', 1),
(44, 112, '2025-10-02', 2),
(44, 112, '2025-10-03', 3),
(44, 113, '2025-10-03', 4),
(44, 112, '2025-10-04', 5),
(44, 112, '2025-10-04', 6),
(44, 112, '2025-10-05', 7),
(44, 112, '2025-10-05', 8),
(44, 113, '2025-10-06', 9),
(44, 112, '2025-10-06', 10),
(44, 112, '2025-10-07', 11),
(44, 112, '2025-10-07', 12),
(44, 112, '2025-10-08', 13);

-- VUELO 45 (Monterrey → Ciudad de México, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(115, 45, 1300, 'ECONOMICA'),
(116, 45, 2600, 'EJECUTIVA'),
(117, 45, 4200, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(45, 115, '2025-10-01', 1),
(45, 115, '2025-10-02', 2),
(45, 115, '2025-10-02', 3),
(45, 116, '2025-10-03', 4),
(45, 115, '2025-10-03', 5),
(45, 115, '2025-10-04', 6),
(45, 115, '2025-10-04', 7),
(45, 115, '2025-10-05', 8),
(45, 116, '2025-10-05', 9),
(45, 115, '2025-10-06', 10),
(45, 115, '2025-10-06', 11),
(45, 115, '2025-10-07', 12);

-- VUELO 46 (Orlando → Guadalajara, internacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(118, 46, 6100, 'ECONOMICA'),
(119, 46, 12200, 'EJECUTIVA'),
(120, 46, 18300, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(46, 118, '2025-10-01', 1),
(46, 118, '2025-10-02', 2),
(46, 118, '2025-10-02', 3),
(46, 119, '2025-10-03', 4),
(46, 118, '2025-10-03', 5),
(46, 118, '2025-10-04', 6),
(46, 118, '2025-10-04', 7),
(46, 118, '2025-10-05', 8),
(46, 119, '2025-10-05', 9),
(46, 118, '2025-10-06', 10),
(46, 118, '2025-10-06', 11),
(46, 118, '2025-10-07', 12),
(46, 118, '2025-10-07', 13),
(46, 118, '2025-10-08', 14);

-- VUELO 47 (Monterrey → Ciudad de México, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(121, 47, 1350, 'ECONOMICA'),
(122, 47, 2700, 'EJECUTIVA'),
(123, 47, 4300, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(47, 121, '2025-10-01', 1),
(47, 121, '2025-10-02', 2),
(47, 121, '2025-10-02', 3),
(47, 122, '2025-10-03', 4),
(47, 121, '2025-10-03', 5),
(47, 121, '2025-10-04', 6),
(47, 121, '2025-10-04', 7),
(47, 121, '2025-10-05', 8),
(47, 122, '2025-10-05', 9),
(47, 121, '2025-10-06', 10),
(47, 121, '2025-10-06', 11),
(47, 121, '2025-10-07', 12);

-- VUELO 48 (Ciudad de México → Monterrey, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(124, 48, 1250, 'ECONOMICA'),
(125, 48, 2500, 'EJECUTIVA'),
(126, 48, 4100, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(48, 124, '2025-10-01', 1),
(48, 124, '2025-10-02', 2),
(48, 124, '2025-10-02', 3),
(48, 125, '2025-10-03', 4),
(48, 124, '2025-10-03', 5),
(48, 124, '2025-10-04', 6),
(48, 124, '2025-10-04', 7),
(48, 124, '2025-10-05', 8),
(48, 125, '2025-10-05', 9),
(48, 124, '2025-10-06', 10),
(48, 124, '2025-10-06', 11),
(48, 124, '2025-10-07', 12);

-- VUELO 49 (Cancelado, Ciudad de México → Guadalajara, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(127, 49, 1200, 'ECONOMICA'),
(128, 49, 2400, 'EJECUTIVA'),
(129, 49, 4000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(49, 127, '2025-10-01', 1),
(49, 127, '2025-10-02', 2),
(49, 127, '2025-10-02', 3),
(49, 128, '2025-10-03', 4),
(49, 127, '2025-10-03', 5),
(49, 127, '2025-10-04', 6),
(49, 127, '2025-10-04', 7),
(49, 127, '2025-10-05', 8),
(49, 128, '2025-10-05', 9),
(49, 127, '2025-10-06', 10),
(49, 127, '2025-10-06', 11);


---- INTERJET ----
-- VUELO 50 (Ciudad de México → Guadalajara, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(130, 50, 1200, 'ECONOMICA'),
(131, 50, 2400, 'EJECUTIVA'),
(132, 50, 4000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(50, 130, '2025-10-01', 1),
(50, 130, '2025-10-02', 2),
(50, 130, '2025-10-02', 3),
(50, 131, '2025-10-03', 4),
(50, 130, '2025-10-03', 5),
(50, 130, '2025-10-04', 6),
(50, 130, '2025-10-04', 7),
(50, 130, '2025-10-05', 8),
(50, 131, '2025-10-05', 9),
(50, 130, '2025-10-06', 10),
(50, 130, '2025-10-06', 11),
(50, 130, '2025-10-07', 12);

-- VUELO 51 (Guadalajara → Monterrey, nacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(133, 51, 1350, 'ECONOMICA'),
(134, 51, 2700, 'EJECUTIVA'),
(135, 51, 4300, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(51, 133, '2025-10-01', 1),
(51, 133, '2025-10-02', 2),
(51, 133, '2025-10-02', 3),
(51, 134, '2025-10-03', 4),
(51, 133, '2025-10-03', 5),
(51, 133, '2025-10-04', 6),
(51, 133, '2025-10-04', 7),
(51, 133, '2025-10-05', 8),
(51, 134, '2025-10-05', 9),
(51, 133, '2025-10-06', 10),
(51, 133, '2025-10-06', 11),
(51, 133, '2025-10-07', 12);

-- VUELO 53 (Guadalajara → Orlando, internacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(136, 53, 6100, 'ECONOMICA'),
(137, 53, 12200, 'EJECUTIVA'),
(138, 53, 18300, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(53, 136, '2025-10-01', 1),
(53, 136, '2025-10-02', 2),
(53, 136, '2025-10-02', 3),
(53, 137, '2025-10-03', 4),
(53, 136, '2025-10-03', 5),
(53, 136, '2025-10-04', 6),
(53, 136, '2025-10-04', 7),
(53, 136, '2025-10-05', 8),
(53, 137, '2025-10-05', 9),
(53, 136, '2025-10-06', 10),
(53, 136, '2025-10-06', 11),
(53, 136, '2025-10-07', 12),
(53, 136, '2025-10-07', 13),
(53, 136, '2025-10-08', 14);

-- VUELO 54 (Monterrey → JFK, internacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(139, 54, 6200, 'ECONOMICA'),
(140, 54, 12400, 'EJECUTIVA'),
(141, 54, 18600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(54, 139, '2025-10-01', 1),
(54, 139, '2025-10-02', 2),
(54, 139, '2025-10-02', 3),
(54, 140, '2025-10-03', 4),
(54, 139, '2025-10-03', 5),
(54, 139, '2025-10-04', 6),
(54, 139, '2025-10-04', 7),
(54, 139, '2025-10-05', 8),
(54, 140, '2025-10-05', 9),
(54, 139, '2025-10-06', 10),
(54, 139, '2025-10-06', 11),
(54, 139, '2025-10-07', 12);

-- VUELO 55 (Orlando → Guadalajara, internacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(142, 55, 6100, 'ECONOMICA'),
(143, 55, 12200, 'EJECUTIVA'),
(144, 55, 18300, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(55, 142, '2025-10-01', 1),
(55, 142, '2025-10-02', 2),
(55, 142, '2025-10-02', 3),
(55, 143, '2025-10-03', 4),
(55, 142, '2025-10-03', 5),
(55, 142, '2025-10-04', 6),
(55, 142, '2025-10-04', 7),
(55, 142, '2025-10-05', 8),
(55, 143, '2025-10-05', 9),
(55, 142, '2025-10-06', 10),
(55, 142, '2025-10-06', 11),
(55, 142, '2025-10-07', 12);

-- VUELO 56 (Monterrey → Barcelona, internacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(145, 56, 12500, 'ECONOMICA'),
(146, 56, 25000, 'EJECUTIVA'),
(147, 56, 37500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(56, 145, '2025-10-01', 1),
(56, 145, '2025-10-02', 2),
(56, 145, '2025-10-02', 3),
(56, 146, '2025-10-03', 4),
(56, 145, '2025-10-03', 5),
(56, 145, '2025-10-04', 6),
(56, 145, '2025-10-04', 7),
(56, 145, '2025-10-05', 8),
(56, 146, '2025-10-05', 9),
(56, 145, '2025-10-06', 10),
(56, 145, '2025-10-06', 11),
(56, 145, '2025-10-07', 12),
(56, 145, '2025-10-07', 13);

-- VUELO 57 (Fukuoka → Ciudad de México, internacional)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(148, 57, 13200, 'ECONOMICA'),
(149, 57, 26400, 'EJECUTIVA'),
(150, 57, 39600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(57, 148, '2025-10-01', 1),
(57, 148, '2025-10-02', 2),
(57, 148, '2025-10-02', 3),
(57, 149, '2025-10-03', 4),
(57, 148, '2025-10-03', 5),
(57, 148, '2025-10-04', 6),
(57, 148, '2025-10-04', 7),
(57, 148, '2025-10-05', 8),
(57, 149, '2025-10-05', 9),
(57, 148, '2025-10-06', 10),
(57, 148, '2025-10-06', 11),
(57, 148, '2025-10-07', 12);


---- CALAFIA ----
-- VUELO 59 (Ciudad de México → Guadalajara)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(151, 59, 1800, 'ECONOMICA'),
(152, 59, 3600, 'EJECUTIVA'),
(153, 59, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(59, 151, '2025-10-01', 1),
(59, 151, '2025-10-01', 2),
(59, 151, '2025-10-02', 3),
(59, 152, '2025-10-02', 4),
(59, 151, '2025-10-03', 5),
(59, 151, '2025-10-03', 6),
(59, 151, '2025-10-04', 7),
(59, 151, '2025-10-04', 8),
(59, 152, '2025-10-05', 9),
(59, 151, '2025-10-05', 10),
(59, 151, '2025-10-06', 11),
(59, 151, '2025-10-06', 12);

-- VUELO 60 (Monterrey → Cancún)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(154, 60, 2000, 'ECONOMICA'),
(155, 60, 4000, 'EJECUTIVA'),
(156, 60, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(60, 154, '2025-10-01', 1),
(60, 154, '2025-10-01', 2),
(60, 154, '2025-10-02', 3),
(60, 155, '2025-10-02', 4),
(60, 154, '2025-10-03', 5),
(60, 154, '2025-10-03', 6),
(60, 154, '2025-10-04', 7),
(60, 154, '2025-10-04', 8),
(60, 155, '2025-10-05', 9),
(60, 154, '2025-10-05', 10),
(60, 154, '2025-10-06', 11),
(60, 154, '2025-10-06', 12);

-- VUELO 62 (Guadalajara → Los Ángeles)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(157, 62, 9000, 'ECONOMICA'),
(158, 62, 18000, 'EJECUTIVA'),
(159, 62, 27000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(62, 157, '2025-10-01', 1),
(62, 157, '2025-10-02', 2),
(62, 157, '2025-10-02', 3),
(62, 158, '2025-10-03', 4),
(62, 157, '2025-10-03', 5),
(62, 157, '2025-10-04', 6),
(62, 157, '2025-10-04', 7),
(62, 157, '2025-10-05', 8),
(62, 158, '2025-10-05', 9),
(62, 157, '2025-10-05', 10),
(62, 157, '2025-10-06', 11),
(62, 157, '2025-10-06', 12);

-- VUELO 63 (Cancún → Nueva York)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(160, 63, 9500, 'ECONOMICA'),
(161, 63, 19000, 'EJECUTIVA'),
(162, 63, 28500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(63, 160, '2025-10-01', 1),
(63, 160, '2025-10-01', 2),
(63, 160, '2025-10-02', 3),
(63, 161, '2025-10-02', 4),
(63, 160, '2025-10-03', 5),
(63, 160, '2025-10-03', 6),
(63, 160, '2025-10-04', 7),
(63, 160, '2025-10-04', 8),
(63, 161, '2025-10-05', 9),
(63, 160, '2025-10-05', 10),
(63, 160, '2025-10-06', 11),
(63, 160, '2025-10-06', 12);

-- VUELO 64 (Los Ángeles → Guadalajara)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(163, 64, 9000, 'ECONOMICA'),
(164, 64, 18000, 'EJECUTIVA'),
(165, 64, 27000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(64, 163, '2025-10-01', 1),
(64, 163, '2025-10-01', 2),
(64, 163, '2025-10-02', 3),
(64, 164, '2025-10-02', 4),
(64, 163, '2025-10-03', 5),
(64, 163, '2025-10-03', 6),
(64, 163, '2025-10-04', 7),
(64, 163, '2025-10-04', 8),
(64, 164, '2025-10-05', 9),
(64, 163, '2025-10-05', 10),
(64, 163, '2025-10-06', 11),
(64, 163, '2025-10-06', 12);

-- VUELO 65 (Nueva York → Monterrey)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(166, 65, 9500, 'ECONOMICA'),
(167, 65, 19000, 'EJECUTIVA'),
(168, 65, 28500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(65, 166, '2025-10-01', 1),
(65, 166, '2025-10-01', 2),
(65, 166, '2025-10-02', 3),
(65, 167, '2025-10-02', 4),
(65, 166, '2025-10-03', 5),
(65, 166, '2025-10-03', 6),
(65, 166, '2025-10-04', 7),
(65, 166, '2025-10-04', 8),
(65, 167, '2025-10-05', 9),
(65, 166, '2025-10-05', 10),
(65, 166, '2025-10-06', 11),
(65, 166, '2025-10-06', 12);

-- VUELO 66 (Cancún → Ciudad de México)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(169, 66, 2000, 'ECONOMICA'),
(170, 66, 4000, 'EJECUTIVA'),
(171, 66, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(66, 169, '2025-10-01', 1),
(66, 169, '2025-10-01', 2),
(66, 169, '2025-10-02', 3),
(66, 170, '2025-10-02', 4),
(66, 169, '2025-10-03', 5),
(66, 169, '2025-10-03', 6),
(66, 169, '2025-10-04', 7),
(66, 169, '2025-10-04', 8),
(66, 170, '2025-10-05', 9),
(66, 169, '2025-10-05', 10),
(66, 169, '2025-10-06', 11),
(66, 169, '2025-10-06', 12);


---- AEROMAR ----
-- VUELO 68 (Ciudad de México → Guadalajara)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(172, 68, 1800, 'ECONOMICA'),
(173, 68, 3600, 'EJECUTIVA'),
(174, 68, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(68, 172, '2025-10-01', 1),
(68, 172, '2025-10-01', 2),
(68, 172, '2025-10-02', 3),
(68, 172, '2025-10-02', 4),
(68, 173, '2025-10-03', 5),
(68, 172, '2025-10-03', 6),
(68, 172, '2025-10-04', 7),
(68, 172, '2025-10-04', 8),
(68, 173, '2025-10-05', 9),
(68, 172, '2025-10-05', 10),
(68, 172, '2025-10-06', 11),
(68, 172, '2025-10-06', 12),
(68, 172, '2025-10-06', 13),
(68, 172, '2025-10-07', 14),
(68, 173, '2025-10-07', 15);

-- VUELO 69 (Guadalajara → Monterrey)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(175, 69, 2000, 'ECONOMICA'),
(176, 69, 4000, 'EJECUTIVA'),
(177, 69, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(69, 175, '2025-10-01', 1),
(69, 175, '2025-10-01', 2),
(69, 175, '2025-10-02', 3),
(69, 175, '2025-10-02', 4),
(69, 176, '2025-10-03', 5),
(69, 175, '2025-10-03', 6),
(69, 175, '2025-10-04', 7),
(69, 175, '2025-10-04', 8),
(69, 176, '2025-10-05', 9),
(69, 175, '2025-10-05', 10),
(69, 175, '2025-10-06', 11),
(69, 175, '2025-10-06', 12),
(69, 175, '2025-10-06', 13);

-- VUELO 71 (Ciudad de México → Cancún)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(178, 71, 2500, 'ECONOMICA'),
(179, 71, 5000, 'EJECUTIVA'),
(180, 71, 7500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(71, 178, '2025-10-01', 1),
(71, 178, '2025-10-01', 2),
(71, 178, '2025-10-02', 3),
(71, 178, '2025-10-02', 4),
(71, 179, '2025-10-03', 5),
(71, 178, '2025-10-03', 6),
(71, 178, '2025-10-04', 7),
(71, 178, '2025-10-04', 8),
(71, 179, '2025-10-05', 9),
(71, 178, '2025-10-05', 10),
(71, 178, '2025-10-06', 11),
(71, 178, '2025-10-06', 12),
(71, 178, '2025-10-06', 13),
(71, 178, '2025-10-07', 14),
(71, 179, '2025-10-07', 15),
(71, 178, '2025-10-07', 16),
(71, 178, '2025-10-08', 17);
 
-- VUELO 72 (Monterrey → Guadalajara)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(181, 72, 2000, 'ECONOMICA'),
(182, 72, 4000, 'EJECUTIVA'),
(183, 72, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(72, 181, '2025-10-01', 1),
(72, 181, '2025-10-01', 2),
(72, 181, '2025-10-02', 3),
(72, 181, '2025-10-02', 4),
(72, 182, '2025-10-03', 5),
(72, 181, '2025-10-03', 6),
(72, 181, '2025-10-04', 7),
(72, 181, '2025-10-04', 8),
(72, 182, '2025-10-05', 9),
(72, 181, '2025-10-05', 10),
(72, 181, '2025-10-06', 11),
(72, 181, '2025-10-06', 12),
(72, 181, '2025-10-06', 13),
(72, 181, '2025-10-07', 14);
 
-- VUELO 73 (Cancún → Ciudad de México)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(184, 73, 2500, 'ECONOMICA'),
(185, 73, 5000, 'EJECUTIVA'),
(186, 73, 7500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(73, 184, '2025-10-01', 1),
(73, 184, '2025-10-01', 2),
(73, 184, '2025-10-02', 3),
(73, 184, '2025-10-02', 4),
(73, 185, '2025-10-03', 5),
(73, 184, '2025-10-03', 6),
(73, 184, '2025-10-04', 7),
(73, 184, '2025-10-04', 8),
(73, 185, '2025-10-05', 9),
(73, 184, '2025-10-05', 10),
(73, 184, '2025-10-06', 11),
(73, 184, '2025-10-06', 12),
(73, 184, '2025-10-06', 13),
(73, 184, '2025-10-07', 14),
(73, 185, '2025-10-07', 15);


-- VUELO 98 (Guadalajara → Cancún)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(187, 98, 1800, 'ECONOMICA'),
(188, 98, 3600, 'EJECUTIVA'),
(189, 98, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(98, 187, '2025-10-01', 1),
(98, 187, '2025-10-01', 2),
(98, 187, '2025-10-02', 3),
(98, 187, '2025-10-02', 4),
(98, 188, '2025-10-03', 5),
(98, 187, '2025-10-03', 6),
(98, 187, '2025-10-04', 7),
(98, 187, '2025-10-04', 8),
(98, 188, '2025-10-05', 9),
(98, 187, '2025-10-05', 10),
(98, 187, '2025-10-06', 11);

-- VUELO 100 (CDMX → Monterrey)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(190, 100, 1700, 'ECONOMICA'),
(191, 100, 3400, 'EJECUTIVA'),
(192, 100, 5100, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(100, 190, '2025-10-01', 1),
(100, 190, '2025-10-01', 2),
(100, 190, '2025-10-02', 3),
(100, 190, '2025-10-02', 4),
(100, 191, '2025-10-03', 5),
(100, 190, '2025-10-03', 6),
(100, 190, '2025-10-04', 7),
(100, 190, '2025-10-04', 8),
(100, 191, '2025-10-05', 9),
(100, 190, '2025-10-05', 10),
(100, 190, '2025-10-06', 11),
(100, 190, '2025-10-06', 12);

-- VUELO 101 (Guadalajara → CDMX)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(193, 101, 1700, 'ECONOMICA'),
(194, 101, 3400, 'EJECUTIVA'),
(195, 101, '5100', 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(101, 193, '2025-10-01', 1),
(101, 193, '2025-10-01', 2),
(101, 193, '2025-10-02', 3),
(101, 193, '2025-10-02', 4),
(101, 194, '2025-10-03', 5),
(101, 193, '2025-10-03', 6),
(101, 193, '2025-10-04', 7),
(101, 193, '2025-10-04', 8),
(101, 194, '2025-10-05', 9),
(101, 193, '2025-10-05', 10),
(101, 193, '2025-10-06', 11),
(101, 193, '2025-10-06', 12),
(101, 193, '2025-10-06', 13),
(101, 193, '2025-10-06', 14);


 
---- AMERICAN AIRLINES ----
-- VUELO 102 (LAX → DFW)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(196, 102, 2500, 'ECONOMICA'),
(197, 102, 5000, 'EJECUTIVA'),
(198, 102, 7500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(102, 196, '2025-10-01', 1),
(102, 196, '2025-10-01', 2),
(102, 196, '2025-10-02', 3),
(102, 196, '2025-10-02', 4),
(102, 197, '2025-10-03', 5),
(102, 196, '2025-10-03', 6),
(102, 196, '2025-10-04', 7),
(102, 196, '2025-10-04', 8),
(102, 197, '2025-10-05', 9),
(102, 196, '2025-10-05', 10),
(102, 196, '2025-10-06', 11),
(102, 196, '2025-10-06', 12),
(102, 197, '2025-10-07', 13),
(102, 196, '2025-10-07', 14);

-- VUELO 103 (N/A → LAX)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(199, 103, 2300, 'ECONOMICA'),
(200, 103, 4600, 'EJECUTIVA'),
(201, 103, 6900, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(103, 199, '2025-10-01', 1),
(103, 199, '2025-10-01', 2),
(103, 199, '2025-10-02', 3),
(103, 200, '2025-10-02', 4),
(103, 199, '2025-10-03', 5),
(103, 199, '2025-10-03', 6),
(103, 199, '2025-10-04', 7),
(103, 200, '2025-10-04', 8),
(103, 199, '2025-10-05', 9),
(103, 199, '2025-10-05', 10),
(103, 200, '2025-10-06', 11),
(103, 199, '2025-10-06', 12),
(103, 199, '2025-10-07', 13);

-- VUELO 105 (DFW → Orlando)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(202, 105, 2700, 'ECONOMICA'),
(203, 105, 5400, 'EJECUTIVA'),
(204, 105, 8100, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(105, 202, '2025-10-01', 1),
(105, 202, '2025-10-01', 2),
(105, 202, '2025-10-02', 3),
(105, 202, '2025-10-02', 4),
(105, 203, '2025-10-03', 5),
(105, 202, '2025-10-03', 6),
(105, 202, '2025-10-04', 7),
(105, 202, '2025-10-04', 8),
(105, 203, '2025-10-05', 9),
(105, 202, '2025-10-05', 10),
(105, 202, '2025-10-06', 11),
(105, 202, '2025-10-06', 12),
(105, 203, '2025-10-07', 13),
(105, 202, '2025-10-07', 14),
(105, 202, '2025-10-07', 15);

-- VUELO 106 (LAX → Denver)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(205, 106, 2600, 'ECONOMICA'),
(206, 106, 5200, 'EJECUTIVA'),
(207, 106, 7800, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(106, 205, '2025-10-01', 1),
(106, 205, '2025-10-01', 2),
(106, 205, '2025-10-02', 3),
(106, 205, '2025-10-02', 4),
(106, 206, '2025-10-03', 5),
(106, 205, '2025-10-03', 6),
(106, 205, '2025-10-04', 7),
(106, 205, '2025-10-04', 8),
(106, 206, '2025-10-05', 9),
(106, 205, '2025-10-05', 10),
(106, 205, '2025-10-06', 11),
(106, 205, '2025-10-06', 12),
(106, 206, '2025-10-07', 13),
(106, 205, '2025-10-07', 14);

-- VUELO 111 (LAX → JFK)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(208, 111, 2800, 'ECONOMICA'),
(209, 111, 5600, 'EJECUTIVA'),
(210, 111, 8400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(111, 208, '2025-10-01', 1),
(111, 208, '2025-10-01', 2),
(111, 208, '2025-10-02', 3),
(111, 208, '2025-10-02', 4),
(111, 209, '2025-10-03', 5),
(111, 208, '2025-10-03', 6),
(111, 208, '2025-10-04', 7),
(111, 208, '2025-10-04', 8),
(111, 209, '2025-10-05', 9),
(111, 208, '2025-10-05', 10),
(111, 208, '2025-10-06', 11),
(111, 208, '2025-10-06', 12),
(111, 209, '2025-10-07', 13),
(111, 208, '2025-10-07', 14),
(111, 208, '2025-10-07', 15);

-- VUELO 112 (DFW → Orlando)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(211, 112, 2600, 'ECONOMICA'),
(212, 112, 5200, 'EJECUTIVA'),
(213, 112, 7800, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(112, 211, '2025-10-01', 1),
(112, 211, '2025-10-01', 2),
(112, 211, '2025-10-02', 3),
(112, 211, '2025-10-02', 4),
(112, 212, '2025-10-03', 5),
(112, 211, '2025-10-03', 6),
(112, 211, '2025-10-04', 7),
(112, 211, '2025-10-04', 8),
(112, 212, '2025-10-05', 9),
(112, 211, '2025-10-05', 10),
(112, 211, '2025-10-06', 11),
(112, 211, '2025-10-06', 12),
(112, 212, '2025-10-07', 13),
(112, 211, '2025-10-07', 14);


---- DELTA AIR LINES ----
-- VUELO 113 (JFK → DFW)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(214, 113, 3000, 'ECONOMICA'),
(215, 113, 6000, 'EJECUTIVA'),
(216, 113, 9000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(113, 214, '2025-10-01', 1),
(113, 214, '2025-10-01', 2),
(113, 214, '2025-10-02', 3),
(113, 214, '2025-10-02', 4),
(113, 215, '2025-10-03', 5),
(113, 214, '2025-10-03', 6),
(113, 214, '2025-10-04', 7),
(113, 214, '2025-10-04', 8),
(113, 215, '2025-10-05', 9),
(113, 214, '2025-10-05', 10),
(113, 214, '2025-10-06', 11),
(113, 214, '2025-10-06', 12),
(113, 215, '2025-10-07', 13),
(113, 214, '2025-10-07', 14);

-- VUELO 114 (DFW → Denver)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(217, 114, 2800, 'ECONOMICA'),
(218, 114, 5600, 'EJECUTIVA'),
(219, 114, 8400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(114, 217, '2025-10-01', 1),
(114, 217, '2025-10-01', 2),
(114, 217, '2025-10-02', 3),
(114, 217, '2025-10-02', 4),
(114, 218, '2025-10-03', 5),
(114, 217, '2025-10-03', 6),
(114, 217, '2025-10-04', 7),
(114, 217, '2025-10-04', 8),
(114, 218, '2025-10-05', 9),
(114, 217, '2025-10-05', 10),
(114, 217, '2025-10-06', 11),
(114, 217, '2025-10-06', 12);

-- VUELO 116 (DFW → Chicago)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(220, 116, 3100, 'ECONOMICA'),
(221, 116, 6200, 'EJECUTIVA'),
(222, 116, 9300, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(116, 220, '2025-10-01', 1),
(116, 220, '2025-10-01', 2),
(116, 220, '2025-10-02', 3),
(116, 220, '2025-10-02', 4),
(116, 221, '2025-10-03', 5),
(116, 220, '2025-10-03', 6),
(116, 220, '2025-10-04', 7),
(116, 220, '2025-10-04', 8),
(116, 221, '2025-10-05', 9),
(116, 220, '2025-10-05', 10),
(116, 220, '2025-10-06', 11),
(116, 220, '2025-10-06', 12),
(116, 221, '2025-10-07', 13),
(116, 220, '2025-10-07', 14);

-- VUELO 117 (Denver → JFK)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(223, 117, 2900, 'ECONOMICA'),
(224, 117, 5800, 'EJECUTIVA'),
(225, 117, 8700, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(117, 223, '2025-10-01', 1),
(117, 223, '2025-10-01', 2),
(117, 223, '2025-10-02', 3),
(117, 223, '2025-10-02', 4),
(117, 224, '2025-10-03', 5),
(117, 223, '2025-10-03', 6),
(117, 223, '2025-10-04', 7),
(117, 223, '2025-10-04', 8),
(117, 224, '2025-10-05', 9),
(117, 223, '2025-10-05', 10),
(117, 223, '2025-10-06', 11),
(117, 223, '2025-10-06', 12),
(117, 224, '2025-10-07', 13),
(117, 223, '2025-10-07', 14);

-- VUELO 118 (LAX → Orlando)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(226, 118, 3200, 'ECONOMICA'),
(227, 118, 6400, 'EJECUTIVA'),
(228, 118, 9600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(118, 226, '2025-10-01', 1),
(118, 226, '2025-10-01', 2),
(118, 226, '2025-10-02', 3),
(118, 226, '2025-10-02', 4),
(118, 227, '2025-10-03', 5),
(118, 226, '2025-10-03', 6),
(118, 226, '2025-10-04', 7),
(118, 226, '2025-10-04', 8),
(118, 227, '2025-10-05', 9),
(118, 226, '2025-10-05', 10),
(118, 226, '2025-10-06', 11),
(118, 226, '2025-10-06', 12),
(118, 227, '2025-10-07', 13),
(118, 226, '2025-10-07', 14),
(118, 226, '2025-10-07', 15);

-- VUELO 119 (Chicago → Denver)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(229, 119, 3300, 'ECONOMICA'),
(230, 119, 6600, 'EJECUTIVA'),
(231, 119, 9900, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(119, 229, '2025-10-01', 1),
(119, 229, '2025-10-01', 2),
(119, 229, '2025-10-02', 3),
(119, 229, '2025-10-02', 4),
(119, 230, '2025-10-03', 5),
(119, 229, '2025-10-03', 6),
(119, 229, '2025-10-04', 7),
(119, 229, '2025-10-04', 8),
(119, 230, '2025-10-05', 9),
(119, 229, '2025-10-05', 10),
(119, 229, '2025-10-06', 11),
(119, 229, '2025-10-06', 12);

-- VUELO 120 (JFK → LAX)
-- VUELO 120 (JFK → LAX)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(232, 120, 3400, 'ECONOMICA'),
(233, 120, 6800, 'EJECUTIVA'),
(234, 120, 10200, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(120, 232, '2025-10-01', 1),
(120, 232, '2025-10-01', 2),
(120, 232, '2025-10-02', 3),
(120, 232, '2025-10-02', 4),
(120, 233, '2025-10-03', 5),
(120, 232, '2025-10-03', 6),
(120, 232, '2025-10-04', 7),
(120, 232, '2025-10-04', 8),
(120, 233, '2025-10-05', 9),
(120, 232, '2025-10-05', 10),
(120, 232, '2025-10-06', 11),
(120, 232, '2025-10-06', 12),
(120, 233, '2025-10-07', 13),
(120, 232, '2025-10-07', 14),
(120, 232, '2025-10-07', 15);

-- VUELO 121 (Orlando → DFW)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(235, 121, 3500, 'ECONOMICA'),
(236, 121, 7000, 'EJECUTIVA'),
(237, 121, 10500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(121, 235, '2025-10-01', 1),
(121, 235, '2025-10-01', 2),
(121, 235, '2025-10-02', 3),
(121, 235, '2025-10-02', 4),
(121, 236, '2025-10-03', 5),
(121, 235, '2025-10-03', 6),
(121, 235, '2025-10-04', 7),
(121, 235, '2025-10-04', 8),
(121, 236, '2025-10-05', 9),
(121, 235, '2025-10-05', 10),
(121, 235, '2025-10-06', 11),
(121, 235, '2025-10-06', 12),
(121, 236, '2025-10-07', 13),
(121, 235, '2025-10-07', 14);

---- UNITED AIRLINES ----
-- VUELO 122 (JFK → DFW)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(238, 122, 3000, 'ECONOMICA'),
(239, 122, 6000, 'EJECUTIVA'),
(240, 122, 9000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(122, 238, '2025-10-01', 1),
(122, 238, '2025-10-01', 2),
(122, 238, '2025-10-02', 3),
(122, 238, '2025-10-02', 4),
(122, 239, '2025-10-03', 5),
(122, 238, '2025-10-03', 6),
(122, 238, '2025-10-04', 7),
(122, 238, '2025-10-04', 8),
(122, 239, '2025-10-05', 9),
(122, 238, '2025-10-05', 10),
(122, 238, '2025-10-06', 11),
(122, 238, '2025-10-06', 12),
(122, 239, '2025-10-07', 13),
(122, 238, '2025-10-07', 14);

-- VUELO 124 (DFW → Denver)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(241, 124, 2800, 'ECONOMICA'),
(242, 124, 5600, 'EJECUTIVA'),
(243, 124, 8400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(124, 241, '2025-10-01', 1),
(124, 241, '2025-10-01', 2),
(124, 241, '2025-10-02', 3),
(124, 241, '2025-10-02', 4),
(124, 242, '2025-10-03', 5),
(124, 241, '2025-10-03', 6),
(124, 241, '2025-10-04', 7),
(124, 241, '2025-10-04', 8),
(124, 242, '2025-10-05', 9),
(124, 241, '2025-10-05', 10),
(124, 241, '2025-10-06', 11),
(124, 241, '2025-10-06', 12);

-- VUELO 125 (LAX → Orlando)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(244, 125, 3200, 'ECONOMICA'),
(245, 125, 6400, 'EJECUTIVA'),
(246, 125, 9600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(125, 244, '2025-10-01', 1),
(125, 244, '2025-10-01', 2),
(125, 244, '2025-10-02', 3),
(125, 244, '2025-10-02', 4),
(125, 245, '2025-10-03', 5),
(125, 244, '2025-10-03', 6),
(125, 244, '2025-10-04', 7),
(125, 244, '2025-10-04', 8),
(125, 245, '2025-10-05', 9),
(125, 244, '2025-10-05', 10),
(125, 244, '2025-10-06', 11),
(125, 244, '2025-10-06', 12),
(125, 245, '2025-10-07', 13),
(125, 244, '2025-10-07', 14),
(125, 244, '2025-10-07', 15);

-- VUELO 126 (Denver → JFK)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(247, 126, 3300, 'ECONOMICA'),
(248, 126, 6600, 'EJECUTIVA'),
(249, 126, 9900, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(126, 247, '2025-10-01', 1),
(126, 247, '2025-10-01', 2),
(126, 247, '2025-10-02', 3),
(126, 247, '2025-10-02', 4),
(126, 248, '2025-10-03', 5),
(126, 247, '2025-10-03', 6),
(126, 247, '2025-10-04', 7),
(126, 247, '2025-10-04', 8),
(126, 248, '2025-10-05', 9),
(126, 247, '2025-10-05', 10),
(126, 247, '2025-10-06', 11),
(126, 247, '2025-10-06', 12),
(126, 248, '2025-10-07', 13),
(126, 247, '2025-10-07', 14);

-- VUELO 127 (Orlando → LAX)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(250, 127, 3400, 'ECONOMICA'),
(251, 127, 6800, 'EJECUTIVA'),
(252, 127, 10200, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(127, 250, '2025-10-01', 1),
(127, 250, '2025-10-01', 2),
(127, 250, '2025-10-02', 3),
(127, 250, '2025-10-02', 4),
(127, 251, '2025-10-03', 5),
(127, 250, '2025-10-03', 6),
(127, 250, '2025-10-04', 7),
(127, 250, '2025-10-04', 8),
(127, 251, '2025-10-05', 9),
(127, 250, '2025-10-05', 10),
(127, 250, '2025-10-06', 11),
(127, 250, '2025-10-06', 12),
(127, 251, '2025-10-07', 13),
(127, 250, '2025-10-07', 14);

-- VUELO 128 (JFK → Chicago)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(253, 128, 3100, 'ECONOMICA'),
(254, 128, 6200, 'EJECUTIVA'),
(255, 128, 9300, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(128, 253, '2025-10-01', 1),
(128, 253, '2025-10-01', 2),
(128, 253, '2025-10-02', 3),
(128, 253, '2025-10-02', 4),
(128, 254, '2025-10-03', 5),
(128, 253, '2025-10-03', 6),
(128, 253, '2025-10-04', 7),
(128, 253, '2025-10-04', 8),
(128, 254, '2025-10-05', 9),
(128, 253, '2025-10-05', 10),
(128, 253, '2025-10-06', 11),
(128, 253, '2025-10-06', 12),
(128, 254, '2025-10-07', 13),
(128, 253, '2025-10-07', 14),
(128, 253, '2025-10-07', 15);


---- SOUTHWEST AIRLINES ----
-- VUELO 129 (Chicago → Dallas)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(256, 129, 1800, 'ECONOMICA'),
(257, 129, 3600, 'EJECUTIVA'),
(258, 129, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(129, 256, '2025-10-01', 1),
(129, 256, '2025-10-01', 2),
(129, 257, '2025-10-02', 3),
(129, 256, '2025-10-02', 4),
(129, 256, '2025-10-03', 5),
(129, 256, '2025-10-03', 6),
(129, 257, '2025-10-04', 7),
(129, 256, '2025-10-04', 8),
(129, 256, '2025-10-05', 9),
(129, 256, '2025-10-05', 10),
(129, 257, '2025-10-06', 11),
(129, 256, '2025-10-06', 12),
(129, 256, '2025-10-07', 13),
(129, 257, '2025-10-07', 14);

-- VUELO 131 (Dallas → LAX)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(259, 131, 2000, 'ECONOMICA'),
(260, 131, 4000, 'EJECUTIVA'),
(261, 131, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(131, 259, '2025-10-01', 1),
(131, 259, '2025-10-01', 2),
(131, 260, '2025-10-02', 3),
(131, 259, '2025-10-02', 4),
(131, 259, '2025-10-03', 5),
(131, 259, '2025-10-03', 6),
(131, 260, '2025-10-04', 7),
(131, 259, '2025-10-04', 8),
(131, 259, '2025-10-05', 9),
(131, 259, '2025-10-05', 10),
(131, 260, '2025-10-06', 11),
(131, 259, '2025-10-06', 12),
(131, 259, '2025-10-07', 13);

-- VUELO 133 (LAX → Orlando)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(262, 133, 2200, 'ECONOMICA'),
(263, 133, 4400, 'EJECUTIVA'),
(264, 133, 6600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(133, 262, '2025-10-01', 1),
(133, 262, '2025-10-01', 2),
(133, 263, '2025-10-02', 3),
(133, 262, '2025-10-02', 4),
(133, 262, '2025-10-03', 5),
(133, 262, '2025-10-03', 6),
(133, 263, '2025-10-04', 7),
(133, 262, '2025-10-04', 8),
(133, 262, '2025-10-05', 9),
(133, 262, '2025-10-05', 10),
(133, 263, '2025-10-06', 11),
(133, 262, '2025-10-06', 12),
(133, 262, '2025-10-07', 13),
(133, 263, '2025-10-07', 14),
(133, 262, '2025-10-07', 15);

-- VUELO 136 (LAX → JFK)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(265, 136, 2500, 'ECONOMICA'),
(266, 136, 5000, 'EJECUTIVA'),
(267, 136, 7500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(136, 265, '2025-10-01', 1),
(136, 265, '2025-10-01', 2),
(136, 266, '2025-10-02', 3),
(136, 265, '2025-10-02', 4),
(136, 265, '2025-10-03', 5),
(136, 265, '2025-10-03', 6),
(136, 266, '2025-10-04', 7),
(136, 265, '2025-10-04', 8),
(136, 265, '2025-10-05', 9),
(136, 265, '2025-10-05', 10),
(136, 266, '2025-10-06', 11),
(136, 265, '2025-10-06', 12),
(136, 265, '2025-10-07', 13),
(136, 266, '2025-10-07', 14);


---- JETBLUE AIRWAYS ----
-- VUELO 137 (JFK → Chicago)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(268, 137, 1900, 'ECONOMICA'),
(269, 137, 3800, 'EJECUTIVA'),
(270, 137, 5700, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(137, 268, '2025-10-01', 1),
(137, 268, '2025-10-01', 2),
(137, 269, '2025-10-02', 3),
(137, 268, '2025-10-02', 4),
(137, 268, '2025-10-03', 5),
(137, 268, '2025-10-03', 6),
(137, 269, '2025-10-04', 7),
(137, 268, '2025-10-04', 8),
(137, 268, '2025-10-05', 9),
(137, 268, '2025-10-05', 10),
(137, 269, '2025-10-06', 11),
(137, 268, '2025-10-06', 12),
(137, 268, '2025-10-07', 13);

-- VUELO 139 (Chicago → Denver)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(271, 139, 2100, 'ECONOMICA'),
(272, 139, 4200, 'EJECUTIVA'),
(273, 139, 6300, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(139, 271, '2025-10-01', 1),
(139, 271, '2025-10-01', 2),
(139, 272, '2025-10-02', 3),
(139, 271, '2025-10-02', 4),
(139, 271, '2025-10-03', 5),
(139, 271, '2025-10-03', 6),
(139, 272, '2025-10-04', 7),
(139, 271, '2025-10-04', 8),
(139, 271, '2025-10-05', 9),
(139, 271, '2025-10-05', 10),
(139, 272, '2025-10-06', 11),
(139, 271, '2025-10-06', 12);

-- VUELO 141 (Denver → Orlando)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(274, 141, 2200, 'ECONOMICA'),
(275, 141, 4400, 'EJECUTIVA'),
(276, 141, 6600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(141, 274, '2025-10-01', 1),
(141, 274, '2025-10-01', 2),
(141, 275, '2025-10-02', 3),
(141, 274, '2025-10-02', 4),
(141, 274, '2025-10-03', 5),
(141, 274, '2025-10-03', 6),
(141, 275, '2025-10-04', 7),
(141, 274, '2025-10-04', 8),
(141, 274, '2025-10-05', 9),
(141, 274, '2025-10-05', 10),
(141, 275, '2025-10-06', 11),
(141, 274, '2025-10-06', 12);


---- ALASKA AIRLINES ----
-- VUELO 143 (LAX → JFK)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(277, 143, 2300, 'ECONOMICA'),
(278, 143, 4600, 'EJECUTIVA'),
(279, 143, 6900, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(143, 277, '2025-10-01', 1),
(143, 277, '2025-10-01', 2),
(143, 278, '2025-10-02', 3),
(143, 277, '2025-10-02', 4),
(143, 277, '2025-10-03', 5),
(143, 277, '2025-10-03', 6),
(143, 278, '2025-10-04', 7),
(143, 277, '2025-10-04', 8),
(143, 277, '2025-10-05', 9),
(143, 277, '2025-10-05', 10),
(143, 278, '2025-10-06', 11),
(143, 277, '2025-10-06', 12);

-- VUELO 145 (DFW → Chicago)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(280, 145, 2000, 'ECONOMICA'),
(281, 145, 4000, 'EJECUTIVA'),
(282, 145, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(145, 280, '2025-10-01', 1),
(145, 280, '2025-10-01', 2),
(145, 281, '2025-10-02', 3),
(145, 280, '2025-10-02', 4),
(145, 280, '2025-10-03', 5),
(145, 280, '2025-10-03', 6),
(145, 281, '2025-10-04', 7),
(145, 280, '2025-10-04', 8),
(145, 280, '2025-10-05', 9),
(145, 280, '2025-10-05', 10),
(145, 281, '2025-10-06', 11),
(145, 280, '2025-10-06', 12);

-- VUELO 147 (LAX → Denver)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(283, 147, 2100, 'ECONOMICA'),
(284, 147, 4200, 'EJECUTIVA'),
(285, 147, 1470, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(147, 283, '2025-10-01', 1),
(147, 283, '2025-10-01', 2),
(147, 284, '2025-10-02', 3),
(147, 283, '2025-10-02', 4),
(147, 283, '2025-10-03', 5),
(147, 283, '2025-10-03', 6),
(147, 284, '2025-10-04', 7),
(147, 283, '2025-10-04', 8),
(147, 283, '2025-10-05', 9),
(147, 283, '2025-10-05', 10),
(147, 284, '2025-10-06', 11),
(147, 283, '2025-10-06', 12);

-- VUELO 148 (DFW → JFK)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(286, 148, 2200, 'ECONOMICA'),
(287, 148, 4400, 'EJECUTIVA'),
(288, 148, 6600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(148, 286, '2025-10-01', 1),
(148, 286, '2025-10-01', 2),
(148, 287, '2025-10-02', 3),
(148, 286, '2025-10-02', 4),
(148, 286, '2025-10-03', 5),
(148, 286, '2025-10-03', 6),
(148, 287, '2025-10-04', 7),
(148, 286, '2025-10-04', 8),
(148, 286, '2025-10-05', 9),
(148, 286, '2025-10-05', 10),
(148, 287, '2025-10-06', 11),
(148, 286, '2025-10-06', 12);


---- SPIRIT AIRLINES ----
-- VUELO 149 (Orlando → LAX)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(289, 149, 2000, 'ECONOMICA'),
(290, 149, 4000, 'EJECUTIVA'),
(291, 149, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(149, 289, '2025-10-01', 1),
(149, 289, '2025-10-01', 2),
(149, 290, '2025-10-02', 3),
(149, 289, '2025-10-02', 4),
(149, 289, '2025-10-03', 5),
(149, 289, '2025-10-03', 6),
(149, 290, '2025-10-04', 7),
(149, 289, '2025-10-04', 8),
(149, 289, '2025-10-05', 9),
(149, 289, '2025-10-05', 10),
(149, 290, '2025-10-06', 11),
(149, 289, '2025-10-06', 12);

-- VUELO 150 (LAX → JFK)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(292, 150, 2200, 'ECONOMICA'),
(293, 150, 4400, 'EJECUTIVA'),
(294, 150, 6600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(150, 292, '2025-10-01', 1),
(150, 292, '2025-10-01', 2),
(150, 293, '2025-10-02', 3),
(150, 292, '2025-10-02', 4),
(150, 292, '2025-10-03', 5),
(150, 292, '2025-10-03', 6),
(150, 293, '2025-10-04', 7),
(150, 292, '2025-10-04', 8),
(150, 292, '2025-10-05', 9),
(150, 292, '2025-10-05', 10),
(150, 293, '2025-10-06', 11),
(150, 292, '2025-10-06', 12);

-- VUELO 151 (JFK → DFW)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(295, 151, 2100, 'ECONOMICA'),
(296, 151, 4200, 'EJECUTIVA'),
(297, 151, 6300, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(151, 295, '2025-10-01', 1),
(151, 295, '2025-10-01', 2),
(151, 296, '2025-10-02', 3),
(151, 295, '2025-10-02', 4),
(151, 295, '2025-10-03', 5),
(151, 295, '2025-10-03', 6),
(151, 296, '2025-10-04', 7),
(151, 295, '2025-10-04', 8),
(151, 295, '2025-10-05', 9),
(151, 295, '2025-10-05', 10),
(151, 296, '2025-10-06', 11),
(151, 295, '2025-10-06', 12);

-- VUELO 152 (DFW → Chicago)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(298, 152, 2300, 'ECONOMICA'),
(299, 152, 4600, 'EJECUTIVA'),
(300, 152, 6900, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(152, 298, '2025-10-01', 1),
(152, 298, '2025-10-01', 2),
(152, 299, '2025-10-02', 3),
(152, 298, '2025-10-02', 4),
(152, 298, '2025-10-03', 5),
(152, 298, '2025-10-03', 6),
(152, 299, '2025-10-04', 7),
(152, 298, '2025-10-04', 8),
(152, 298, '2025-10-05', 9),
(152, 298, '2025-10-05', 10),
(152, 299, '2025-10-06', 11),
(152, 298, '2025-10-06', 12);

-- VUELO 153 (Chicago → Orlando)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(301, 153, 2100, 'ECONOMICA'),
(302, 153, 4200, 'EJECUTIVA'),
(303, 153, 6300, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(153, 301, '2025-10-01', 1),
(153, 301, '2025-10-01', 2),
(153, 302, '2025-10-02', 3),
(153, 301, '2025-10-02', 4),
(153, 301, '2025-10-03', 5),
(153, 301, '2025-10-03', 6),
(153, 302, '2025-10-04', 7),
(153, 301, '2025-10-04', 8),
(153, 301, '2025-10-05', 9),
(153, 301, '2025-10-05', 10),
(153, 302, '2025-10-06', 11),
(153, 301, '2025-10-06', 12);

-- VUELO 154 (JFK → Madrid)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(304, 154, 2500, 'ECONOMICA'),
(305, 154, 5000, 'EJECUTIVA'),
(306, 154, 7500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(154, 304, '2025-10-01', 1),
(154, 304, '2025-10-01', 2),
(154, 305, '2025-10-02', 3),
(154, 304, '2025-10-02', 4),
(154, 304, '2025-10-03', 5),
(154, 304, '2025-10-03', 6),
(154, 305, '2025-10-04', 7),
(154, 304, '2025-10-04', 8),
(154, 304, '2025-10-05', 9),
(154, 304, '2025-10-05', 10),
(154, 305, '2025-10-06', 11),
(154, 304, '2025-10-06', 12);


---- FRONTIER AIRLINES ----
-- VUELO 155 (Denver → JFK)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(307, 155, 2000, 'ECONOMICA'),
(308, 155, 4000, 'EJECUTIVA'),
(309, 155, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(155, 307, '2025-10-01', 1),
(155, 307, '2025-10-01', 2),
(155, 308, '2025-10-02', 3),
(155, 307, '2025-10-02', 4),
(155, 307, '2025-10-03', 5),
(155, 307, '2025-10-03', 6),
(155, 308, '2025-10-04', 7),
(155, 307, '2025-10-04', 8),
(155, 307, '2025-10-05', 9),
(155, 307, '2025-10-05', 10),
(155, 308, '2025-10-06', 11),
(155, 307, '2025-10-06', 12);

-- VUELO 156 (JFK → DFW)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(310, 156, 2200, 'ECONOMICA'),
(311, 156, 4400, 'EJECUTIVA'),
(312, 156, 6600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(156, 310, '2025-10-01', 1),
(156, 310, '2025-10-01', 2),
(156, 311, '2025-10-02', 3),
(156, 310, '2025-10-02', 4),
(156, 310, '2025-10-03', 5),
(156, 310, '2025-10-03', 6),
(156, 311, '2025-10-04', 7),
(156, 310, '2025-10-04', 8),
(156, 310, '2025-10-05', 9),
(156, 310, '2025-10-05', 10),
(156, 311, '2025-10-06', 11),
(156, 310, '2025-10-06', 12);

-- VUELO 157 (DFW → Chicago)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(313, 157, 2100, 'ECONOMICA'),
(314, 157, 4200, 'EJECUTIVA'),
(315, 157, 6300, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(157, 313, '2025-10-01', 1),
(157, 313, '2025-10-01', 2),
(157, 314, '2025-10-02', 3),
(157, 313, '2025-10-02', 4),
(157, 313, '2025-10-03', 5),
(157, 313, '2025-10-03', 6),
(157, 314, '2025-10-04', 7),
(157, 313, '2025-10-04', 8),
(157, 313, '2025-10-05', 9),
(157, 313, '2025-10-05', 10),
(157, 314, '2025-10-06', 11),
(157, 313, '2025-10-06', 12);

-- VUELO 158 (Chicago → LAX)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(316, 158, 2300, 'ECONOMICA'),
(317, 158, 4600, 'EJECUTIVA'),
(318, 158, 6900, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(158, 316, '2025-10-01', 1),
(158, 316, '2025-10-01', 2),
(158, 317, '2025-10-02', 3),
(158, 316, '2025-10-02', 4),
(158, 316, '2025-10-03', 5),
(158, 316, '2025-10-03', 6),
(158, 317, '2025-10-04', 7),
(158, 316, '2025-10-04', 8),
(158, 316, '2025-10-05', 9),
(158, 316, '2025-10-05', 10),
(158, 317, '2025-10-06', 11),
(158, 316, '2025-10-06', 12);

-- VUELO 159 (LAX → Denver)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(319, 159, 2500, 'ECONOMICA'),
(320, 159, 5000, 'EJECUTIVA'),
(321, 159, 7500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(159, 319, '2025-10-01', 1),
(159, 319, '2025-10-01', 2),
(159, 320, '2025-10-02', 3),
(159, 319, '2025-10-02', 4),
(159, 319, '2025-10-03', 5),
(159, 319, '2025-10-03', 6),
(159, 320, '2025-10-04', 7),
(159, 319, '2025-10-04', 8),
(159, 319, '2025-10-05', 9),
(159, 319, '2025-10-05', 10),
(159, 320, '2025-10-06', 11),
(159, 319, '2025-10-06', 12);



---- LATAM BRASIL ----
-- VUELO 160 (São Paulo → Río de Janeiro)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(322, 160, 1800, 'ECONOMICA'),
(323, 160, 3600, 'EJECUTIVA'),
(324, 160, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(160, 322, '2025-10-01', 1),
(160, 322, '2025-10-01', 2),
(160, 323, '2025-10-02', 3),
(160, 322, '2025-10-02', 4),
(160, 324, '2025-10-03', 5),
(160, 322, '2025-10-03', 6),
(160, 322, '2025-10-04', 7),
(160, 323, '2025-10-04', 8),
(160, 322, '2025-10-05', 9),
(160, 322, '2025-10-05', 10);

-- VUELO 161 (Brasília → Belo Horizonte)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(325, 161, 2000, 'ECONOMICA'),
(326, 161, 4000, 'EJECUTIVA'),
(327, 161, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(161, 325, '2025-10-01', 1),
(161, 325, '2025-10-02', 2),
(161, 326, '2025-10-02', 3),
(161, 325, '2025-10-03', 4),
(161, 325, '2025-10-03', 5),
(161, 327, '2025-10-04', 6),
(161, 325, '2025-10-04', 7),
(161, 326, '2025-10-05', 8),
(161, 325, '2025-10-05', 9);

-- VUELO 162 (São Paulo → Madrid)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(328, 162, 4500, 'ECONOMICA'),
(329, 162, 9000, 'EJECUTIVA'),
(330, 162, 13500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(162, 328, '2025-10-01', 1),
(162, 328, '2025-10-01', 2),
(162, 329, '2025-10-02', 3),
(162, 328, '2025-10-02', 4),
(162, 330, '2025-10-03', 5),
(162, 328, '2025-10-03', 6),
(162, 328, '2025-10-04', 7),
(162, 329, '2025-10-04', 8),
(162, 328, '2025-10-05', 9),
(162, 328, '2025-10-05', 10),
(162, 330, '2025-10-06', 11),
(162, 328, '2025-10-06', 12);

-- VUELO 163 (Brasília → Barcelona)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(331, 163, 4600, 'ECONOMICA'),
(332, 163, 9200, 'EJECUTIVA'),
(333, 163, 13800, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(163, 331, '2025-10-01', 1),
(163, 331, '2025-10-01', 2),
(163, 332, '2025-10-02', 3),
(163, 331, '2025-10-02', 4),
(163, 333, '2025-10-03', 5),
(163, 331, '2025-10-03', 6),
(163, 331, '2025-10-04', 7),
(163, 332, '2025-10-04', 8),
(163, 331, '2025-10-05', 9),
(163, 331, '2025-10-05', 10);

-- VUELO 164 (Río de Janeiro → São Paulo)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(334, 164, 1800, 'ECONOMICA'),
(335, 164, 3600, 'EJECUTIVA'),
(336, 164, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(164, 334, '2025-10-01', 1),
(164, 334, '2025-10-01', 2),
(164, 335, '2025-10-02', 3),
(164, 334, '2025-10-02', 4),
(164, 334, '2025-10-03', 5),
(164, 334, '2025-10-03', 6),
(164, 335, '2025-10-04', 7),
(164, 334, '2025-10-04', 8),
(164, 334, '2025-10-05', 9);

-- VUELO 165 (São Paulo → Tokyo)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(337, 165, 7000, 'ECONOMICA'),
(338, 165, 14000, 'EJECUTIVA'),
(339, 165, 21000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(165, 337, '2025-10-01', 1),
(165, 337, '2025-10-01', 2),
(165, 338, '2025-10-02', 3),
(165, 337, '2025-10-02', 4),
(165, 337, '2025-10-03', 5),
(165, 337, '2025-10-03', 6),
(165, 338, '2025-10-04', 7),
(165, 337, '2025-10-04', 8),
(165, 337, '2025-10-05', 9),
(165, 337, '2025-10-05', 10),
(165, 338, '2025-10-06', 11),
(165, 337, '2025-10-06', 12);

-- VUELO 166 (São Paulo → Belo Horizonte) CANCELADO
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(340, 166, 1900, 'ECONOMICA'),
(341, 166, 3800, 'EJECUTIVA'),
(342, 166, 5700, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(166, 340, '2025-10-01', 1),
(166, 340, '2025-10-01', 2),
(166, 341, '2025-10-02', 3),
(166, 340, '2025-10-02', 4),
(166, 340, '2025-10-03', 5),
(166, 340, '2025-10-03', 6),
(166, 341, '2025-10-04', 7),
(166, 340, '2025-10-04', 8),
(166, 340, '2025-10-05', 9);


---- GOL LINHAS AÉREAS ----
-- VUELO 167 (São Paulo → Belo Horizonte)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(343, 167, 1800, 'ECONOMICA'),
(344, 167, 3600, 'EJECUTIVA'),
(345, 167, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(167, 343, '2025-10-01', 1),
(167, 343, '2025-10-01', 2),
(167, 344, '2025-10-02', 3),
(167, 343, '2025-10-02', 4),
(167, 345, '2025-10-03', 5),
(167, 343, '2025-10-03', 6),
(167, 343, '2025-10-04', 7),
(167, 344, '2025-10-04', 8),
(167, 343, '2025-10-05', 9);

-- VUELO 168 (Belo Horizonte → Brasília)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(346, 168, 2000, 'ECONOMICA'),
(347, 168, 4000, 'EJECUTIVA'),
(348, 168, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(168, 346, '2025-10-01', 1),
(168, 346, '2025-10-01', 2),
(168, 347, '2025-10-02', 3),
(168, 346, '2025-10-02', 4),
(168, 346, '2025-10-03', 5),
(168, 348, '2025-10-03', 6),
(168, 346, '2025-10-04', 7),
(168, 347, '2025-10-04', 8),
(168, 346, '2025-10-05', 9);

-- VUELO 169 (Brasília → São Paulo)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(349, 169, 1850, 'ECONOMICA'),
(350, 169, 3700, 'EJECUTIVA'),
(351, 169, 5550, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(169, 349, '2025-10-01', 1),
(169, 349, '2025-10-01', 2),
(169, 350, '2025-10-02', 3),
(169, 349, '2025-10-02', 4),
(169, 351, '2025-10-03', 5),
(169, 349, '2025-10-03', 6),
(169, 349, '2025-10-04', 7),
(169, 350, '2025-10-04', 8),
(169, 349, '2025-10-05', 9),
(169, 349, '2025-10-05', 10);

-- VUELO 170 (São Paulo → Madrid)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(352, 170, 4500, 'ECONOMICA'),
(353, 170, 9000, 'EJECUTIVA'),
(354, 170, 13500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(170, 352, '2025-10-01', 1),
(170, 352, '2025-10-01', 2),
(170, 353, '2025-10-02', 3),
(170, 352, '2025-10-02', 4),
(170, 354, '2025-10-03', 5),
(170, 352, '2025-10-03', 6),
(170, 352, '2025-10-04', 7),
(170, 353, '2025-10-04', 8),
(170, 352, '2025-10-05', 9),
(170, 352, '2025-10-05', 10);

-- VUELO 171 (Belo Horizonte → São Paulo)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(355, 171, 1800, 'ECONOMICA'),
(356, 171, 3600, 'EJECUTIVA'),
(357, 171, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(171, 355, '2025-10-01', 1),
(171, 355, '2025-10-01', 2),
(171, 356, '2025-10-02', 3),
(171, 355, '2025-10-02', 4),
(171, 357, '2025-10-03', 5),
(171, 355, '2025-10-03', 6),
(171, 355, '2025-10-04', 7),
(171, 356, '2025-10-04', 8),
(171, 355, '2025-10-05', 9);

-- VUELO 172 (São Paulo → Belo Horizonte) CANCELADO
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(358, 172, 1800, 'ECONOMICA'),
(359, 172, 3600, 'EJECUTIVA'),
(360, 172, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(172, 358, '2025-10-01', 1),
(172, 358, '2025-10-01', 2),
(172, 359, '2025-10-02', 3),
(172, 358, '2025-10-02', 4),
(172, 358, '2025-10-03', 5),
(172, 358, '2025-10-03', 6),
(172, 359, '2025-10-04', 7),
(172, 358, '2025-10-04', 8),
(172, 358, '2025-10-05', 9);


---- AZUL LINHAS AÉREAS ----
-- VUELO 173 (São Paulo → Río de Janeiro)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(361, 173, 1800, 'ECONOMICA'),
(362, 173, 3600, 'EJECUTIVA'),
(363, 173, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(173, 361, '2025-10-01', 1),
(173, 361, '2025-10-01', 2),
(173, 362, '2025-10-02', 3),
(173, 361, '2025-10-02', 4),
(173, 363, '2025-10-03', 5),
(173, 361, '2025-10-03', 6),
(173, 361, '2025-10-04', 7),
(173, 362, '2025-10-04', 8);

-- VUELO 174 (Brasília → São Paulo)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(364, 174, 2000, 'ECONOMICA'),
(365, 174, 4000, 'EJECUTIVA'),
(366, 174, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(174, 364, '2025-10-01', 1),
(174, 364, '2025-10-01', 2),
(174, 365, '2025-10-02', 3),
(174, 364, '2025-10-02', 4),
(174, 364, '2025-10-03', 5),
(174, 366, '2025-10-03', 6),
(174, 364, '2025-10-04', 7);

-- VUELO 175 (São Paulo → Madrid)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(367, 175, 4500, 'ECONOMICA'),
(368, 175, 9000, 'EJECUTIVA'),
(369, 175, 13500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(175, 367, '2025-10-01', 1),
(175, 367, '2025-10-01', 2),
(175, 368, '2025-10-02', 3),
(175, 367, '2025-10-02', 4),
(175, 369, '2025-10-03', 5),
(175, 367, '2025-10-03', 6),
(175, 367, '2025-10-04', 7),
(175, 368, '2025-10-04', 8),
(175, 367, '2025-10-05', 9),
(175, 367, '2025-10-05', 10);

-- VUELO 176 (São Paulo → Brasília)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(370, 176, 1800, 'ECONOMICA'),
(371, 176, 3600, 'EJECUTIVA'),
(372, 176, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(176, 370, '2025-10-01', 1),
(176, 370, '2025-10-01', 2),
(176, 371, '2025-10-02', 3),
(176, 370, '2025-10-02', 4),
(176, 372, '2025-10-03', 5),
(176, 370, '2025-10-03', 6),
(176, 370, '2025-10-04', 7),
(176, 371, '2025-10-04', 8);

-- VUELO 177 (Brasília → Río de Janeiro)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(373, 177, 1800, 'ECONOMICA'),
(374, 177, 3600, 'EJECUTIVA'),
(375, 177, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(177, 373, '2025-10-01', 1),
(177, 373, '2025-10-01', 2),
(177, 374, '2025-10-02', 3),
(177, 373, '2025-10-02', 4),
(177, 375, '2025-10-03', 5),
(177, 373, '2025-10-03', 6),
(177, 373, '2025-10-04', 7),
(177, 374, '2025-10-04', 8),
(177, 373, '2025-10-05', 9);

-- VUELO 178 (Río de Janeiro → São Paulo)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(376, 178, 1800, 'ECONOMICA'),
(377, 178, 3600, 'EJECUTIVA'),
(378, 178, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(178, 376, '2025-10-01', 1),
(178, 376, '2025-10-01', 2),
(178, 377, '2025-10-02', 3),
(178, 376, '2025-10-02', 4),
(178, 378, '2025-10-03', 5),
(178, 376, '2025-10-03', 6),
(178, 376, '2025-10-04', 7),
(178, 377, '2025-10-04', 8),
(178, 376, '2025-10-05', 9);

-- VUELO 179 (São Paulo → Belo Horizonte) CANCELADO
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(379, 179, 1800, 'ECONOMICA'),
(380, 179, 3600, 'EJECUTIVA'),
(381, 179, 5400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(179, 379, '2025-10-01', 1),
(179, 379, '2025-10-01', 2),
(179, 380, '2025-10-02', 3),
(179, 379, '2025-10-02', 4),
(179, 379, '2025-10-03', 5),
(179, 379, '2025-10-03', 6),
(179, 380, '2025-10-04', 7),
(179, 379, '2025-10-04', 8),
(179, 379, '2025-10-05', 9);



---- IBERIA ----
-- VUELO 180 (Madrid → JFK)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(382, 180, 5000, 'ECONOMICA'),
(383, 180, 10000, 'EJECUTIVA'),
(384, 180, 15000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(180, 382, '2025-10-01', 1),
(180, 382, '2025-10-01', 2),
(180, 383, '2025-10-02', 3),
(180, 382, '2025-10-02', 4),
(180, 384, '2025-10-03', 5),
(180, 382, '2025-10-03', 6),
(180, 382, '2025-10-04', 7),
(180, 383, '2025-10-04', 8),
(180, 382, '2025-10-05', 9),
(180, 382, '2025-10-05', 10);

-- VUELO 181 (Barcelona → São Paulo)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(385, 181, 6000, 'ECONOMICA'),
(386, 181, 12000, 'EJECUTIVA'),
(387, 181, 18000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(181, 385, '2025-10-01', 1),
(181, 385, '2025-10-01', 2),
(181, 386, '2025-10-02', 3),
(181, 385, '2025-10-02', 4),
(181, 387, '2025-10-03', 5),
(181, 385, '2025-10-03', 6),
(181, 385, '2025-10-04', 7),
(181, 386, '2025-10-04', 8),
(181, 385, '2025-10-05', 9),
(181, 385, '2025-10-05', 10),
(181, 386, '2025-10-06', 11),
(181, 385, '2025-10-06', 12);

-- VUELO 182 (Málaga → Valencia)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(388, 182, 1200, 'ECONOMICA'),
(389, 182, 2400, 'EJECUTIVA'),
(390, 182, 3600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(182, 388, '2025-10-01', 1),
(182, 388, '2025-10-01', 2),
(182, 389, '2025-10-02', 3),
(182, 388, '2025-10-02', 4),
(182, 390, '2025-10-03', 5),
(182, 388, '2025-10-03', 6),
(182, 388, '2025-10-04', 7);

-- VUELO 183 (Madrid → Ciudad de México)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(391, 183, 7000, 'ECONOMICA'),
(392, 183, 14000, 'EJECUTIVA'),
(393, 183, 21000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(183, 391, '2025-10-01', 1),
(183, 391, '2025-10-01', 2),
(183, 392, '2025-10-02', 3),
(183, 391, '2025-10-02', 4),
(183, 393, '2025-10-03', 5),
(183, 391, '2025-10-03', 6),
(183, 391, '2025-10-04', 7),
(183, 392, '2025-10-04', 8),
(183, 391, '2025-10-05', 9),
(183, 391, '2025-10-05', 10);

-- VUELO 184 (Barcelona → Tokio)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(394, 184, 8000, 'ECONOMICA'),
(395, 184, 16000, 'EJECUTIVA'),
(396, 184, 24000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(184, 394, '2025-10-01', 1),
(184, 394, '2025-10-01', 2),
(184, 395, '2025-10-02', 3),
(184, 394, '2025-10-02', 4),
(184, 396, '2025-10-03', 5),
(184, 394, '2025-10-03', 6),
(184, 394, '2025-10-04', 7),
(184, 395, '2025-10-04', 8),
(184, 394, '2025-10-05', 9),
(184, 394, '2025-10-05', 10),
(184, 395, '2025-10-06', 11);

-- VUELO 185 (Madrid → Málaga)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(397, 185, 1200, 'ECONOMICA'),
(398, 185, 2400, 'EJECUTIVA'),
(399, 185, 3600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(185, 397, '2025-10-01', 1),
(185, 397, '2025-10-01', 2),
(185, 398, '2025-10-02', 3),
(185, 397, '2025-10-02', 4),
(185, 399, '2025-10-03', 5),
(185, 397, '2025-10-03', 6),
(185, 397, '2025-10-04', 7);

-- VUELO 186 (Madrid → Denver)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(400, 186, 5000, 'ECONOMICA'),
(401, 186, 10000, 'EJECUTIVA'),
(402, 186, 15000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(186, 400, '2025-10-01', 1),
(186, 400, '2025-10-01', 2),
(186, 401, '2025-10-02', 3),
(186, 400, '2025-10-02', 4),
(186, 402, '2025-10-03', 5),
(186, 400, '2025-10-03', 6),
(186, 400, '2025-10-04', 7),
(186, 401, '2025-10-04', 8),
(186, 400, '2025-10-05', 9);

-- VUELO 187 (Barcelona → Dallas)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(403, 187, 7000, 'ECONOMICA'),
(404, 187, 14000, 'EJECUTIVA'),
(405, 187, 21000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(187, 403, '2025-10-01', 1),
(187, 403, '2025-10-01', 2),
(187, 404, '2025-10-02', 3),
(187, 403, '2025-10-02', 4),
(187, 405, '2025-10-03', 5),
(187, 403, '2025-10-03', 6),
(187, 403, '2025-10-04', 7),
(187, 404, '2025-10-04', 8),
(187, 403, '2025-10-05', 9);

-- VUELO 188 (Valencia → Barcelona)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(406, 188, 1200, 'ECONOMICA'),
(407, 188, 2400, 'EJECUTIVA'),
(408, 188, 3600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(188, 406, '2025-10-01', 1),
(188, 406, '2025-10-01', 2),
(188, 407, '2025-10-02', 3),
(188, 406, '2025-10-02', 4),
(188, 408, '2025-10-03', 5),
(188, 406, '2025-10-03', 6),
(188, 406, '2025-10-04', 7),
(188, 407, '2025-10-04', 8),
(188, 406, '2025-10-05', 9);

-- VUELO 189 (Madrid → Valencia) CANCELADO
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(409, 189, 1200, 'ECONOMICA'),
(410, 189, 2400, 'EJECUTIVA'),
(411, 189, 3600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(189, 409, '2025-10-01', 1),
(189, 409, '2025-10-01', 2),
(189, 410, '2025-10-02', 3),
(189, 409, '2025-10-02', 4),
(189, 409, '2025-10-03', 5),
(189, 409, '2025-10-03', 6),
(189, 410, '2025-10-04', 7),
(189, 409, '2025-10-04', 8),
(189, 409, '2025-10-05', 9);


---- AIR EUROPA ----
-- VUELO 190 (Madrid → São Paulo)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(412, 190, 6000, 'ECONOMICA'),
(413, 190, 12000, 'EJECUTIVA'),
(414, 190, 18000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(190, 412, '2025-10-01', 1),
(190, 412, '2025-10-01', 2),
(190, 413, '2025-10-02', 3),
(190, 412, '2025-10-02', 4),
(190, 414, '2025-10-03', 5),
(190, 412, '2025-10-03', 6),
(190, 412, '2025-10-04', 7),
(190, 413, '2025-10-04', 8),
(190, 412, '2025-10-05', 9),
(190, 412, '2025-10-05', 10);

-- VUELO 191 (Barcelona → Ciudad de México)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(415, 191, 7000, 'ECONOMICA'),
(416, 191, 14000, 'EJECUTIVA'),
(417, 191, 21000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(191, 415, '2025-10-01', 1),
(191, 415, '2025-10-01', 2),
(191, 416, '2025-10-02', 3),
(191, 415, '2025-10-02', 4),
(191, 417, '2025-10-03', 5),
(191, 415, '2025-10-03', 6),
(191, 415, '2025-10-04', 7),
(191, 416, '2025-10-04', 8),
(191, 415, '2025-10-05', 9),
(191, 415, '2025-10-05', 10),
(191, 416, '2025-10-06', 11),
(191, 415, '2025-10-06', 12);

-- VUELO 192 (Málaga → Valencia)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(418, 192, 1200, 'ECONOMICA'),
(419, 192, 2400, 'EJECUTIVA'),
(420, 192, 3600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(192, 418, '2025-10-01', 1),
(192, 418, '2025-10-01', 2),
(192, 419, '2025-10-02', 3),
(192, 418, '2025-10-02', 4),
(192, 420, '2025-10-03', 5),
(192, 418, '2025-10-03', 6),
(192, 418, '2025-10-04', 7);

-- VUELO 193 (Madrid → JFK)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(421, 193, 5000, 'ECONOMICA'),
(422, 193, 10000, 'EJECUTIVA'),
(423, 193, 15000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(193, 421, '2025-10-01', 1),
(193, 421, '2025-10-01', 2),
(193, 422, '2025-10-02', 3),
(193, 421, '2025-10-02', 4),
(193, 423, '2025-10-03', 5),
(193, 421, '2025-10-03', 6),
(193, 421, '2025-10-04', 7),
(193, 422, '2025-10-04', 8),
(193, 421, '2025-10-05', 9),
(193, 421, '2025-10-05', 10);

-- VUELO 194 (Barcelona → São Paulo)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(424, 194, 6000, 'ECONOMICA'),
(425, 194, 12000, 'EJECUTIVA'),
(426, 194, 18000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(194, 424, '2025-10-01', 1),
(194, 424, '2025-10-01', 2),
(194, 425, '2025-10-02', 3),
(194, 424, '2025-10-02', 4),
(194, 426, '2025-10-03', 5),
(194, 424, '2025-10-03', 6),
(194, 424, '2025-10-04', 7),
(194, 425, '2025-10-04', 8),
(194, 424, '2025-10-05', 9),
(194, 424, '2025-10-05', 10);

-- VUELO 195 (Madrid → Málaga)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(427, 195, 2000, 'ECONOMICA'),
(428, 195, 4000, 'EJECUTIVA'),
(429, 195, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(195, 427, '2025-10-01', 1),
(195, 427, '2025-10-01', 2),
(195, 428, '2025-10-02', 3),
(195, 427, '2025-10-02', 4),
(195, 429, '2025-10-03', 5),
(195, 427, '2025-10-03', 6),
(195, 427, '2025-10-04', 7);

-- VUELO 196 (Barcelona → Tokio)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(430, 196, 8000, 'ECONOMICA'),
(431, 196, 16000, 'EJECUTIVA'),
(432, 196, 24000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(196, 430, '2025-10-01', 1),
(196, 430, '2025-10-01', 2),
(196, 431, '2025-10-02', 3),
(196, 430, '2025-10-02', 4),
(196, 432, '2025-10-03', 5),
(196, 430, '2025-10-03', 6),
(196, 430, '2025-10-04', 7),
(196, 431, '2025-10-04', 8),
(196, 430, '2025-10-05', 9),
(196, 430, '2025-10-05', 10),
(196, 431, '2025-10-06', 11);

-- VUELO 197 (Madrid → Denver)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(433, 197, 5500, 'ECONOMICA'),
(434, 197, 11000, 'EJECUTIVA'),
(435, 197, 16500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(197, 433, '2025-10-01', 1),
(197, 433, '2025-10-01', 2),
(197, 434, '2025-10-02', 3),
(197, 433, '2025-10-02', 4),
(197, 435, '2025-10-03', 5),
(197, 433, '2025-10-03', 6),
(197, 433, '2025-10-04', 7),
(197, 434, '2025-10-04', 8),
(197, 433, '2025-10-05', 9);

-- VUELO 198 (Valencia → Barcelona)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(436, 198, 1500, 'ECONOMICA'),
(437, 198, 3000, 'EJECUTIVA'),
(438, 198, 4500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(198, 436, '2025-10-01', 1),
(198, 436, '2025-10-01', 2),
(198, 437, '2025-10-02', 3),
(198, 436, '2025-10-02', 4),
(198, 438, '2025-10-03', 5),
(198, 436, '2025-10-03', 6),
(198, 436, '2025-10-04', 7);

-- VUELO 199 (Madrid → Málaga)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(439, 199, 2000, 'ECONOMICA'),
(440, 199, 4000, 'EJECUTIVA'),
(441, 199, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(199, 439, '2025-10-01', 1),
(199, 439, '2025-10-01', 2),
(199, 440, '2025-10-02', 3),
(199, 439, '2025-10-02', 4),
(199, 441, '2025-10-03', 5),
(199, 439, '2025-10-03', 6),
(199, 439, '2025-10-04', 7);


---- VUELING AIRLINES ----
-- VUELO 200 (Madrid → JFK)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(442, 200, 5000, 'ECONOMICA'),
(443, 200, 10000, 'EJECUTIVA'),
(444, 200, 15000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(200, 442, '2025-10-01', 1),
(200, 442, '2025-10-01', 2),
(200, 443, '2025-10-02', 3),
(200, 442, '2025-10-02', 4),
(200, 444, '2025-10-03', 5),
(200, 442, '2025-10-03', 6),
(200, 442, '2025-10-04', 7),
(200, 443, '2025-10-04', 8),
(200, 442, '2025-10-05', 9);

-- VUELO 201 (Barcelona → São Paulo)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(445, 201, 8000, 'ECONOMICA'),
(446, 201, 16000, 'EJECUTIVA'),
(447, 201, 24000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(201, 445, '2025-10-01', 1),
(201, 445, '2025-10-01', 2),
(201, 446, '2025-10-02', 3),
(201, 445, '2025-10-02', 4),
(201, 447, '2025-10-03', 5),
(201, 445, '2025-10-03', 6),
(201, 445, '2025-10-04', 7),
(201, 446, '2025-10-04', 8),
(201, 445, '2025-10-05', 9),
(201, 445, '2025-10-05', 10);

-- VUELO 202 (Málaga → Valencia)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(448, 202, 2000, 'ECONOMICA'),
(449, 202, 4000, 'EJECUTIVA'),
(450, 202, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(202, 448, '2025-10-01', 1),
(202, 448, '2025-10-01', 2),
(202, 449, '2025-10-02', 3),
(202, 448, '2025-10-02', 4),
(202, 450, '2025-10-03', 5),
(202, 448, '2025-10-03', 6),
(202, 448, '2025-10-04', 7);

-- VUELO 203 (Madrid → Ciudad de México)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(451, 203, 5500, 'ECONOMICA'),
(452, 203, 11000, 'EJECUTIVA'),
(453, 203, 16500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(203, 451, '2025-10-01', 1),
(203, 451, '2025-10-01', 2),
(203, 452, '2025-10-02', 3),
(203, 451, '2025-10-02', 4),
(203, 453, '2025-10-03', 5),
(203, 451, '2025-10-03', 6),
(203, 451, '2025-10-04', 7),
(203, 452, '2025-10-04', 8),
(203, 451, '2025-10-05', 9);

-- VUELO 204 (Barcelona → Tokio)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(454, 204, 8000, 'ECONOMICA'),
(455, 204, 16000, 'EJECUTIVA'),
(456, 204, 24000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(204, 454, '2025-10-01', 1),
(204, 454, '2025-10-01', 2),
(204, 455, '2025-10-02', 3),
(204, 454, '2025-10-02', 4),
(204, 456, '2025-10-03', 5),
(204, 454, '2025-10-03', 6),
(204, 454, '2025-10-04', 7),
(204, 455, '2025-10-04', 8),
(204, 454, '2025-10-05', 9);

-- VUELO 205 (Madrid → Málaga)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(457, 205, 2000, 'ECONOMICA'),
(458, 205, 4000, 'EJECUTIVA'),
(459, 205, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(205, 457, '2025-10-01', 1),
(205, 457, '2025-10-01', 2),
(205, 458, '2025-10-02', 3),
(205, 457, '2025-10-02', 4),
(205, 459, '2025-10-03', 5),
(205, 457, '2025-10-03', 6),
(205, 457, '2025-10-04', 7);

-- VUELO 206 (Barcelona → Madrid)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(460, 206, 5000, 'ECONOMICA'),
(461, 206, 10000, 'EJECUTIVA'),
(462, 206, 15000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(206, 460, '2025-10-01', 1),
(206, 460, '2025-10-01', 2),
(206, 461, '2025-10-02', 3),
(206, 460, '2025-10-02', 4),
(206, 462, '2025-10-03', 5),
(206, 460, '2025-10-03', 6),
(206, 460, '2025-10-04', 7);

-- VUELO 207 (Málaga → Denver)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(463, 207, 5500, 'ECONOMICA'),
(464, 207, 11000, 'EJECUTIVA'),
(465, 207, 16500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(207, 463, '2025-10-01', 1),
(207, 463, '2025-10-01', 2),
(207, 464, '2025-10-02', 3),
(207, 463, '2025-10-02', 4),
(207, 465, '2025-10-03', 5),
(207, 463, '2025-10-03', 6),
(207, 463, '2025-10-04', 7);

-- VUELO 208 (?)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(466, 208, 6000, 'ECONOMICA'),
(467, 208, 12000, 'EJECUTIVA'),
(468, 208, 18000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(208, 466, '2025-10-01', 1),
(208, 466, '2025-10-01', 2),
(208, 467, '2025-10-02', 3),
(208, 466, '2025-10-02', 4),
(208, 468, '2025-10-03', 5),
(208, 466, '2025-10-03', 6),
(208, 466, '2025-10-04', 7);



---- JAPAN AIRLINES ----
-- VUELO 209 (Tokio → Osaka)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(469, 209, 3000, 'ECONOMICA'),
(470, 209, 6000, 'EJECUTIVA'),
(471, 209, 9000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(209, 469, '2025-10-01', 1),
(209, 469, '2025-10-01', 2),
(209, 470, '2025-10-02', 3),
(209, 469, '2025-10-02', 4),
(209, 471, '2025-10-03', 5),
(209, 469, '2025-10-03', 6),
(209, 469, '2025-10-04', 7);

-- VUELO 210 (Osaka → Nagoya)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(472, 210, 2500, 'ECONOMICA'),
(473, 210, 5000, 'EJECUTIVA'),
(474, 210, 7500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(210, 472, '2025-10-01', 1),
(210, 472, '2025-10-01', 2),
(210, 473, '2025-10-02', 3),
(210, 472, '2025-10-02', 4),
(210, 474, '2025-10-03', 5),
(210, 472, '2025-10-03', 6),
(210, 472, '2025-10-04', 7);

-- VUELO 211 (Tokio → JFK)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(475, 211, 12000, 'ECONOMICA'),
(476, 211, 24000, 'EJECUTIVA'),
(477, 211, 36000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(211, 475, '2025-10-01', 1),
(211, 475, '2025-10-01', 2),
(211, 476, '2025-10-02', 3),
(211, 475, '2025-10-02', 4),
(211, 477, '2025-10-03', 5),
(211, 475, '2025-10-03', 6),
(211, 475, '2025-10-04', 7),
(211, 476, '2025-10-04', 8);

-- VUELO 212 (Nagoya → Madrid)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(478, 212, 15000, 'ECONOMICA'),
(479, 212, 30000, 'EJECUTIVA'),
(480, 212, 45000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(212, 478, '2025-10-01', 1),
(212, 478, '2025-10-01', 2),
(212, 479, '2025-10-02', 3),
(212, 478, '2025-10-02', 4),
(212, 480, '2025-10-03', 5),
(212, 478, '2025-10-03', 6),
(212, 478, '2025-10-04', 7);

-- VUELO 213 (Sapporo → Tokio)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(481, 213, 3500, 'ECONOMICA'),
(482, 213, 7000, 'EJECUTIVA'),
(483, 213, 10500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(213, 481, '2025-10-01', 1),
(213, 481, '2025-10-01', 2),
(213, 482, '2025-10-02', 3),
(213, 481, '2025-10-02', 4),
(213, 483, '2025-10-03', 5),
(213, 481, '2025-10-03', 6),
(213, 481, '2025-10-04', 7);

-- VUELO 214 (Tokio → Barcelona)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(484, 214, 8000, 'ECONOMICA'),
(485, 214, 16000, 'EJECUTIVA'),
(486, 214, 24000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(214, 484, '2025-10-01', 1),
(214, 484, '2025-10-01', 2),
(214, 485, '2025-10-02', 3),
(214, 484, '2025-10-02', 4),
(214, 486, '2025-10-03', 5),
(214, 484, '2025-10-03', 6),
(214, 484, '2025-10-04', 7);

-- VUELO 215 (Osaka → Denver)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(487, 215, 9000, 'ECONOMICA'),
(488, 215, 18000, 'EJECUTIVA'),
(489, 215, 27000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(215, 487, '2025-10-01', 1),
(215, 487, '2025-10-01', 2),
(215, 488, '2025-10-02', 3),
(215, 487, '2025-10-02', 4),
(215, 489, '2025-10-03', 5),
(215, 487, '2025-10-03', 6),
(215, 487, '2025-10-04', 7);

-- VUELO 216 (Nagoya → Sapporo)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(490, 216, 3500, 'ECONOMICA'),
(491, 216, 7000, 'EJECUTIVA'),
(492, 216, 10500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(216, 490, '2025-10-01', 1),
(216, 490, '2025-10-01', 2),
(216, 491, '2025-10-02', 3),
(216, 490, '2025-10-02', 4),
(216, 492, '2025-10-03', 5),
(216, 490, '2025-10-03', 6),
(216, 490, '2025-10-04', 7);

-- VUELO 217 (Tokio → Ciudad de México)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(493, 217, 12000, 'ECONOMICA'),
(494, 217, 24000, 'EJECUTIVA'),
(495, 217, 36000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(217, 493, '2025-10-01', 1),
(217, 493, '2025-10-01', 2),
(217, 494, '2025-10-02', 3),
(217, 493, '2025-10-02', 4),
(217, 495, '2025-10-03', 5),
(217, 493, '2025-10-03', 6),
(217, 493, '2025-10-04', 7);

-- VUELO 218 (Sapporo → São Paulo)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(496, 218, 15000, 'ECONOMICA'),
(497, 218, 30000, 'EJECUTIVA'),
(498, 218, 45000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(218, 496, '2025-10-01', 1),
(218, 496, '2025-10-01', 2),
(218, 497, '2025-10-02', 3),
(218, 496, '2025-10-02', 4),
(218, 498, '2025-10-03', 5),
(218, 496, '2025-10-03', 6),
(218, 496, '2025-10-04', 7);

-- VUELO 219 (Osaka → Nagoya)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(499, 219, 2500, 'ECONOMICA'),
(500, 219, 5000, 'EJECUTIVA'),
(501, 219, 7500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(219, 499, '2025-10-01', 1),
(219, 499, '2025-10-01', 2),
(219, 500, '2025-10-02', 3),
(219, 499, '2025-10-02', 4),
(219, 501, '2025-10-03', 5),
(219, 499, '2025-10-03', 6),
(219, 499, '2025-10-04', 7);

-- VUELO 220 (Tokio → Dallas)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(502, 220, 12000, 'ECONOMICA'),
(503, 220, 24000, 'EJECUTIVA'),
(504, 220, 36000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(220, 502, '2025-10-01', 1),
(220, 502, '2025-10-01', 2),
(220, 503, '2025-10-02', 3),
(220, 502, '2025-10-02', 4),
(220, 504, '2025-10-03', 5),
(220, 502, '2025-10-03', 6),
(220, 502, '2025-10-04', 7);

-- VUELO 74 (Guadalajara → Monterrey)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(505, 74, 2000, 'ECONOMICA'),
(506, 74, 4000, 'EJECUTIVA'),
(507, 74, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(74, 505, '2025-10-01', 1),
(74, 505, '2025-10-01', 2),
(74, 505, '2025-10-02', 3),
(74, 505, '2025-10-02', 4),
(74, 506, '2025-10-03', 5),
(74, 505, '2025-10-03', 6),
(74, 505, '2025-10-04', 7),
(74, 505, '2025-10-04', 8),
(74, 506, '2025-10-05', 9),
(74, 505, '2025-10-05', 10),
(74, 505, '2025-10-06', 11),
(74, 505, '2025-10-06', 12),
(74, 505, '2025-10-06', 13),
(74, 505, '2025-10-07', 14),
(74, 506, '2025-10-07', 15);

-- VUELO 75 (CANCELADO)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(508, 75, 2200, 'ECONOMICA'),
(509, 75, 4400, 'EJECUTIVA'),
(510, 75, 6600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(75, 508, '2025-10-01', 1),
(75, 508, '2025-10-01', 2),
(75, 508, '2025-10-02', 3),
(75, 508, '2025-10-02', 4),
(75, 509, '2025-10-03', 5),
(75, 508, '2025-10-03', 6),
(75, 508, '2025-10-04', 7),
(75, 508, '2025-10-04', 8),
(75, 509, '2025-10-05', 9),
(75, 508, '2025-10-05', 10),
(75, 508, '2025-10-06', 11),
(75, 508, '2025-10-06', 12),
(75, 508, '2025-10-06', 13),
(75, 508, '2025-10-07', 14),
(75, 509, '2025-10-07', 15);

-- VUELO 76
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(511, 76, 2500, 'ECONOMICA'),
(512, 76, 5000, 'EJECUTIVA'),
(513, 76, 7500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(76, 511, '2025-10-01', 1),
(76, 511, '2025-10-01', 2),
(76, 511, '2025-10-02', 3);

-- VUELO 78
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(514, 78, 2700, 'ECONOMICA'),
(515, 78, 5400, 'EJECUTIVA'),
(516, 78, 8100, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(78, 514, '2025-10-01', 1),
(78, 514, '2025-10-01', 2),
(78, 514, '2025-10-02', 3),
(78, 515, '2025-10-02', 4),
(78, 514, '2025-10-03', 5),
(78, 514, '2025-10-03', 6);

-- VUELO 79
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(517, 79, 9500, 'ECONOMICA'),
(518, 79, 19000, 'EJECUTIVA'),
(519, 79, 28500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(79, 517, '2025-10-06', 1),
(79, 517, '2025-10-06', 2),
(79, 517, '2025-10-07', 3),
(79, 517, '2025-10-07', 4),
(79, 518, '2025-10-08', 5),
(79, 517, '2025-10-08', 6);

-- VUELO 80
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(520, 80, 9600, 'ECONOMICA'),
(521, 80, 19200, 'EJECUTIVA'),
(522, 80, 28800, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(80, 520, '2025-10-06', 1),
(80, 520, '2025-10-06', 2),
(80, 520, '2025-10-07', 3),
(80, 520, '2025-10-07', 4),
(80, 521, '2025-10-08', 5),
(80, 520, '2025-10-08', 6),
(80, 520, '2025-10-09', 7);

-- VUELO 81
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(523, 81, 9700, 'ECONOMICA'),
(524, 81, 19400, 'EJECUTIVA'),
(525, 81, 29100, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(81, 523, '2025-10-07', 1),
(81, 523, '2025-10-07', 2),
(81, 523, '2025-10-08', 3),
(81, 523, '2025-10-08', 4),
(81, 524, '2025-10-09', 5),
(81, 523, '2025-10-09', 6),
(81, 523, '2025-10-10', 7),
(81, 523, '2025-10-10', 8);

-- VUELO 82
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(526, 82, 9800, 'ECONOMICA'),
(527, 82, 19600, 'EJECUTIVA'),
(528, 82, 29400, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(82, 526, '2025-10-07', 1),
(82, 526, '2025-10-07', 2),
(82, 526, '2025-10-08', 3),
(82, 526, '2025-10-08', 4),
(82, 527, '2025-10-09', 5),
(82, 526, '2025-10-09', 6),
(82, 526, '2025-10-10', 7);

-- VUELO 83
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(529, 83, 9900, 'ECONOMICA'),
(530, 83, 19800, 'EJECUTIVA'),
(531, 83, 29700, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(83, 529, '2025-10-07', 1),
(83, 529, '2025-10-07', 2),
(83, 529, '2025-10-08', 3),
(83, 529, '2025-10-08', 4),
(83, 530, '2025-10-09', 5),
(83, 529, '2025-10-09', 6),
(83, 529, '2025-10-10', 7),
(83, 529, '2025-10-10', 8),
(83, 530, '2025-10-11', 9);

-- VUELO 84
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(532, 84, 2500, 'ECONOMICA'),
(533, 84, 5000, 'EJECUTIVA'),
(534, 84, 7500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(84, 532, '2025-10-01', 1),
(84, 532, '2025-10-01', 2),
(84, 532, '2025-10-02', 3),
(84, 532, '2025-10-02', 4),
(84, 533, '2025-10-03', 5),
(84, 532, '2025-10-03', 6),
(84, 532, '2025-10-04', 7),
(84, 532, '2025-10-04', 8),
(84, 533, '2025-10-05', 9),
(84, 532, '2025-10-05', 10),
(84, 532, '2025-10-06', 11);

-- VUELO 85
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(535, 85, 2600, 'ECONOMICA'),
(536, 85, 5200, 'EJECUTIVA'),
(537, 85, 7800, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(85, 535, '2025-10-01', 1),
(85, 535, '2025-10-01', 2),
(85, 535, '2025-10-02', 3),
(85, 536, '2025-10-02', 4),
(85, 535, '2025-10-03', 5),
(85, 535, '2025-10-03', 6),
(85, 535, '2025-10-04', 7),
(85, 536, '2025-10-04', 8),
(85, 535, '2025-10-05', 9),
(85, 535, '2025-10-05', 10);

-- VUELO 87
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(538, 87, 9000, 'ECONOMICA'),
(539, 87, 18000, 'EJECUTIVA'),
(540, 87, 27000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(87, 538, '2025-10-06', 1),
(87, 538, '2025-10-06', 2),
(87, 538, '2025-10-07', 3),
(87, 538, '2025-10-07', 4),
(87, 539, '2025-10-08', 5),
(87, 538, '2025-10-08', 6),
(87, 538, '2025-10-09', 7),
(87, 538, '2025-10-09', 8),
(87, 539, '2025-10-10', 9),
(87, 538, '2025-10-10', 10),
(87, 538, '2025-10-11', 11);

-- VUELO 88
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(541, 88, 8700, 'ECONOMICA'),
(542, 88, 17400, 'EJECUTIVA'),
(543, 88, 26100, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(88, 541, '2025-10-06', 1),
(88, 541, '2025-10-06', 2),
(88, 541, '2025-10-07', 3),
(88, 541, '2025-10-07', 4),
(88, 542, '2025-10-08', 5),
(88, 541, '2025-10-08', 6),
(88, 541, '2025-10-09', 7),
(88, 541, '2025-10-09', 8),
(88, 542, '2025-10-10', 9),
(88, 541, '2025-10-10', 10),
(88, 541, '2025-10-11', 11);

-- VUELO 89
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(544, 89, 9500, 'ECONOMICA'),
(545, 89, 19000, 'EJECUTIVA'),
(546, 89, 28500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(89, 544, '2025-10-07', 1),
(89, 544, '2025-10-07', 2),
(89, 544, '2025-10-08', 3),
(89, 544, '2025-10-08', 4),
(89, 545, '2025-10-09', 5),
(89, 544, '2025-10-09', 6),
(89, 544, '2025-10-10', 7),
(89, 544, '2025-10-10', 8),
(89, 545, '2025-10-11', 9),
(89, 544, '2025-10-11', 10);

-- VUELO 90
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(547, 90, 9400, 'ECONOMICA'),
(548, 90, 18800, 'EJECUTIVA'),
(549, 90, 28200, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(90, 547, '2025-10-07', 1),
(90, 547, '2025-10-07', 2),
(90, 547, '2025-10-08', 3),
(90, 547, '2025-10-08', 4),
(90, 548, '2025-10-09', 5),
(90, 547, '2025-10-09', 6),
(90, 547, '2025-10-10', 7),
(90, 547, '2025-10-10', 8),
(90, 548, '2025-10-11', 9),
(90, 547, '2025-10-11', 10);

---- MEXICANA DE AVIACIÓN ----
-- VUELO 91 (CDMX → Cancún)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(550, 91, 2500, 'ECONOMICA'),
(551, 91, 5000, 'EJECUTIVA'),
(552, 91, 7500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(91, 550, '2025-10-01', 1),
(91, 550, '2025-10-01', 2),
(91, 550, '2025-10-02', 3),
(91, 551, '2025-10-02', 4),
(91, 550, '2025-10-03', 5),
(91, 550, '2025-10-03', 6),
(91, 550, '2025-10-04', 7),
(91, 551, '2025-10-04', 8),
(91, 550, '2025-10-05', 9),
(91, 550, '2025-10-05', 10),
(91, 550, '2025-10-06', 11),
(91, 550, '2025-10-06', 12),
(91, 552, '2025-10-07', 13),
(91, 550, '2025-10-07', 14);

-- VUELO 92 (Guadalajara → Monterrey)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(553, 92, 2200, 'ECONOMICA'),
(554, 92, 4400, 'EJECUTIVA'),
(555, 92, 6600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(92, 553, '2025-10-01', 1),
(92, 553, '2025-10-01', 2),
(92, 554, '2025-10-02', 3),
(92, 553, '2025-10-02', 4),
(92, 553, '2025-10-03', 5),
(92, 553, '2025-10-03', 6),
(92, 554, '2025-10-04', 7),
(92, 553, '2025-10-04', 8),
(92, 553, '2025-10-05', 9),
(92, 553, '2025-10-05', 10),
(92, 553, '2025-10-06', 11),
(92, 554, '2025-10-06', 12);

-- VUELO 93 (Monterrey → CDMX)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(556, 93, 2000, 'ECONOMICA'),
(557, 93, 4000, 'EJECUTIVA'),
(558, 93, 6000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(93, 556, '2025-10-01', 1),
(93, 556, '2025-10-01', 2),
(93, 557, '2025-10-02', 3),
(93, 556, '2025-10-02', 4),
(93, 556, '2025-10-03', 5),
(93, 556, '2025-10-03', 6),
(93, 556, '2025-10-04', 7),
(93, 556, '2025-10-04', 8),
(93, 557, '2025-10-05', 9),
(93, 556, '2025-10-05', 10);

-- VUELO 94 (Cancún → Los Ángeles)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(559, 94, 7000, 'ECONOMICA'),
(560, 94, 14000, 'EJECUTIVA'),
(561, 94, 21000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(94, 559, '2025-10-01', 1),
(94, 559, '2025-10-01', 2),
(94, 560, '2025-10-02', 3),
(94, 559, '2025-10-02', 4),
(94, 559, '2025-10-03', 5),
(94, 559, '2025-10-03', 6),
(94, 559, '2025-10-04', 7),
(94, 560, '2025-10-04', 8),
(94, 559, '2025-10-05', 9),
(94, 559, '2025-10-05', 10),
(94, 561, '2025-10-06', 11),
(94, 559, '2025-10-06', 12),
(94, 559, '2025-10-07', 13),
(94, 559, '2025-10-07', 14),
(94, 560, '2025-10-07', 15);

-- VUELO 95 (Monterrey → Guadalajara)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(562, 95, 2200, 'ECONOMICA'),
(563, 95, 4400, 'EJECUTIVA'),
(564, 95, 6600, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(95, 562, '2025-10-01', 1),
(95, 562, '2025-10-01', 2),
(95, 563, '2025-10-02', 3),
(95, 562, '2025-10-02', 4),
(95, 562, '2025-10-03', 5),
(95, 562, '2025-10-03', 6),
(95, 562, '2025-10-04', 7),
(95, 563, '2025-10-04', 8),
(95, 562, '2025-10-05', 9),
(95, 562, '2025-10-05', 10),
(95, 562, '2025-10-06', 11),
(95, 563, '2025-10-06', 12);

-- VUELO 96 (CDMX → JFK)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(565, 96, 12000, 'ECONOMICA'),
(566, 96, 24000, 'EJECUTIVA'),
(567, 96, 36000, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(96, 565, '2025-10-01', 1),
(96, 565, '2025-10-01', 2),
(96, 566, '2025-10-02', 3),
(96, 565, '2025-10-02', 4),
(96, 565, '2025-10-03', 5),
(96, 565, '2025-10-03', 6),
(96, 565, '2025-10-04', 7),
(96, 566, '2025-10-04', 8),
(96, 565, '2025-10-05', 9),
(96, 565, '2025-10-05', 10),
(96, 565, '2025-10-06', 11),
(96, 566, '2025-10-06', 12),
(96, 565, '2025-10-07', 13),
(96, 565, '2025-10-07', 14),
(96, 566, '2025-10-07', 15);

-- VUELO 97 (LAX → CDMX)
INSERT INTO tarifa_vuelo (id_tarifa, id_vuelo, precio, clase) VALUES
(568, 97, 12500, 'ECONOMICA'),
(569, 97, 25000, 'EJECUTIVA'),
(570, 97, 37500, 'PREMIUM');
INSERT INTO boleto (id_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(97, 568, '2025-10-01', 1),
(97, 568, '2025-10-01', 2),
(97, 569, '2025-10-02', 3),
(97, 568, '2025-10-02', 4),
(97, 568, '2025-10-03', 5),
(97, 568, '2025-10-03', 6),
(97, 568, '2025-10-04', 7),
(97, 569, '2025-10-04', 8),
(97, 568, '2025-10-05', 9),
(97, 568, '2025-10-05', 10);



/* COMENTADO, pero se comprobó su funcionalidad con los cambios


--UPDATE

-- Cambiar capacidad de publico de una terminal
-- La terminal 1 del Aeropuerto Internacional de la Ciudad de México
-- ahora tiene una capacidadd_publico de 22000
UPDATE terminal
SET capacidadd_publico = 22000
WHERE id_aeropuerto = 1 AND numero_terminal = 1; 

-- Actualizar última ubicación de avión
-- Avión de Mexicana de Aviación ahora está en el Aeropuerto Internacional de la Ciudad de México.
UPDATE avion
SET id_aeropuerto = 1
WHERE id_avion = 63; 

-- Certificar piloto
-- El piloto Miguel Castillo Ríos ahora esta_certificado
UPDATE piloto
SET esta_certificado = TRUE
WHERE id_empleado = 7;

-- Cambiar horario del vuelo 97 LAX -> CDMX de Mexicana de Aviación.
UPDATE vuelo 
SET etd = '2025-10-16 07:00:00', eta = '2025-10-16 11:00:00'
WHERE id_vuelo = 97;

-- Actualizar estado de vuelo
-- El vuelo 94 Cancún -> Los Ángeles de Mexicana de Aviación.
UPDATE vuelo
SET estado = 'FINALIZADO'
WHERE id_vuelo = 94;

-- Reasignar aeropuerto donde se encuentra un piloto
-- La piloto Ana Sanchez Morales de Aeroméxico ahora se encuentra en el Aeropuerto Internacional de Cancún.
UPDATE piloto
SET id_aeropuerto = 4
WHERE id_empleado = 4;

-- Coambiar capacidad de un avión
-- Avión de Mexicana de Aviación ahora tiene capacidad de pasajeros de 210.
UPDATE avion
SET capacidad_pasajeros = 210
WHERE id_avion = 63;

-- Incrementar precio de tarifa_vuelo de la clase ECONOMICA del vuelo 2
UPDATE tarifa_vuelo
SET precio = 1250
WHERE id_tarifa = 2;



--DELETE

-- Eliminar un aeropuerto, no tiene elementos dependietes
-- Eliminamos el NAIM por cancelación.
DELETE FROM aeropuerto
WHERE id_aeropuerto = 5;

-- Eliminar una aerolínea
-- Se eliminó All Nippon Airways
DELETE FROM aerolinea
WHERE id_aerolinea = 25;

-- Eliminar un avión
-- Eliminado avión 175 Airbus A320neo de Frontier Airlines
DELETE FROM avion
WHERE id_avion = 119;

-- Eliminar un empleado sobrecargo de una aerolínea
-- Eliminado sobrecargo Valentina López Santos de Aeroméxico
DELETE FROM sobrecargo
WHERE id_empleado = 3;

-- Eliminar un boleto
-- Eliminado boleto del vuelo 17 y asiento 15
DELETE FROM boleto
WHERE id_vuelo = 17 AND numero_asiento = 15;



--SELECT

-- Listar todos los aeropuertos internacionales en México
SELECT id_aeropuerto, nombre, ciudad
FROM aeropuerto
WHERE tipo = 'INTERNACIONAL' AND pais = 'México';

-- Ver pilotos y su aerolínea
SELECT p.id_empleado, p.nombre, p.apellido_paterno, a.nombre AS aerolinea
FROM piloto p
JOIN aerolinea a ON p.id_aerolinea = a.id_aerolinea
ORDER BY a.nombre;

-- Contar vuelos por estado de vuelo
SELECT estado, COUNT(*) AS total_vuelos
FROM vuelo
GROUP BY estado;

-- Listar aviones con capacidad mayor a 150 asientos
SELECT id_avion, modelo, capacidad_pasajeros
FROM avion
WHERE capacidad_pasajeros > 150;

-- Listar vuelos (origen y destino) que salen desde el aeropuerto 19 Aeroporto Internacional Tancredo Neves
SELECT v.id_vuelo, a_origen.nombre AS origen, a_destino.nombre AS destino, v.estado
FROM vuelo v
JOIN aeropuerto a_origen ON v.origen = a_origen.id_aeropuerto
JOIN aeropuerto a_destino ON v.destino = a_destino.id_aeropuerto
WHERE a_origen.id_aeropuerto = 19;

-- Calcular el precio promedio de los vuelos por aerolínea
SELECT aerolinea.nombre AS aerolinea,
       AVG(tarifa_vuelo.precio) AS costo_promedio
FROM boleto
JOIN tarifa_vuelo ON boleto.id_tarifa = tarifa_vuelo.id_tarifa
JOIN vuelo ON boleto.id_vuelo = vuelo.id_vuelo
JOIN avion ON vuelo.id_avion = avion.id_avion
JOIN aerolinea ON avion.id_aerolinea = aerolinea.id_aerolinea
GROUP BY aerolinea.nombre
ORDER BY aerolinea.nombre;

-- Encontrar qué pilotos vuelan el modelo 'Boeing 737-800'
SELECT DISTINCT p.nombre, p.apellido_paterno, p.apellido_materno, a.modelo
FROM piloto p
JOIN vuelo v ON p.id_empleado = v.piloto
JOIN avion a ON v.id_avion = a.id_avion
WHERE a.modelo = 'Boeing 737-800';

-- Encontrar el vuelo programado más caro
SELECT vuelo.id_vuelo,
       tarifa_vuelo.precio AS precio
FROM boleto
JOIN tarifa_vuelo ON boleto.id_tarifa = tarifa_vuelo.id_tarifa
JOIN vuelo ON boleto.id_vuelo = vuelo.id_vuelo
WHERE tarifa_vuelo.precio = (
    SELECT MAX(precio)
    FROM tarifa_vuelo
)
AND vuelo.estado = 'PROGRAMADO'
ORDER BY vuelo.id_vuelo
LIMIT 1;


*/
