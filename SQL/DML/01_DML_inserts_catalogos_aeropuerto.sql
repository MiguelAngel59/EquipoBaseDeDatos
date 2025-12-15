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
(27, 'Fukuoka Airport', 'NACIONAL', 'Japón', 'Fukuoka', 'FUK'),

-- Alemania
(28, 'Aeropuerto Internacional de Frankfurt', 'INTERNACIONAL', 'Alemania', 'Frankfurt', 'FRA'),
(29, 'Aeropuerto Internacional de Múnich', 'INTERNACIONAL', 'Alemania', 'Múnich', 'MUC'),
(30, 'Aeropuerto de Berlín Brandenburg', 'INTERNACIONAL', 'Alemania', 'Berlín', 'BER'),

-- Francia
(31, 'Aeropuerto Charles de Gaulle', 'INTERNACIONAL', 'Francia', 'París', 'CDG'),
(32, 'Aeropuerto de Orly', 'NACIONAL', 'Francia', 'París', 'ORY'),
(33, 'Aeropuerto de Niza-Costa Azul', 'NACIONAL', 'Francia', 'Niza', 'NCE'),

-- Reino Unido
(34, 'London Heathrow Airport', 'INTERNACIONAL', 'Reino Unido', 'Londres', 'LHR'),
(35, 'London Gatwick Airport', 'INTERNACIONAL', 'Reino Unido', 'Londres', 'LGW'),
(36, 'Manchester Airport', 'NACIONAL', 'Reino Unido', 'Manchester', 'MAN'),

-- Italia
(37, 'Aeropuerto Internacional de Roma-Fiumicino', 'INTERNACIONAL', 'Italia', 'Roma', 'FCO'),
(38, 'Aeropuerto de Milán-Malpensa', 'INTERNACIONAL', 'Italia', 'Milán', 'MXP'),
(39, 'Aeropuerto de Venecia-Marco Polo', 'NACIONAL', 'Italia', 'Venecia', 'VCE'),

-- Canadá
(40, 'Toronto Pearson International Airport', 'INTERNACIONAL', 'Canadá', 'Toronto', 'YYZ'),
(41, 'Vancouver International Airport', 'INTERNACIONAL', 'Canadá', 'Vancouver', 'YVR'),
(42, 'Montréal-Pierre Elliott Trudeau International Airport', 'INTERNACIONAL', 'Canadá', 'Montreal', 'YUL'),

-- Argentina
(43, 'Aeropuerto Internacional Ministro Pistarini (Ezeiza)', 'INTERNACIONAL', 'Argentina', 'Buenos Aires', 'EZE'),
(44, 'Aeroparque Jorge Newbery', 'NACIONAL', 'Argentina', 'Buenos Aires', 'AEP'),
(45, 'Aeropuerto Internacional de Córdoba', 'NACIONAL', 'Argentina', 'Córdoba', 'COR'),

-- Chile
(46, 'Aeropuerto Internacional Comodoro Arturo Merino Benítez', 'INTERNACIONAL', 'Chile', 'Santiago', 'SCL'),
(47, 'Aeropuerto de Antofagasta', 'NACIONAL', 'Chile', 'Antofagasta', 'ANF'),
(48, 'Aeropuerto de Puerto Montt-El Tepual', 'NACIONAL', 'Chile', 'Puerto Montt', 'PMC'),

-- Australia
(49, 'Sydney Kingsford Smith International Airport', 'INTERNACIONAL', 'Australia', 'Sídney', 'SYD'),
(50, 'Melbourne Tullamarine Airport', 'INTERNACIONAL', 'Australia', 'Melbourne', 'MEL'),
(51, 'Brisbane Airport', 'NACIONAL', 'Australia', 'Brisbane', 'BNE'),

-- China
(52, 'Beijing Capital International Airport', 'INTERNACIONAL', 'China', 'Beijing', 'PEK'),
(53, 'Shanghai Pudong International Airport', 'INTERNACIONAL', 'China', 'Shanghái', 'PVG'),
(54, 'Guangzhou Baiyun International Airport', 'INTERNACIONAL', 'China', 'Guangzhou', 'CAN'),

-- India
(55, 'Indira Gandhi International Airport', 'INTERNACIONAL', 'India', 'Nueva Delhi', 'DEL'),
(56, 'Chhatrapati Shivaji Maharaj International Airport', 'INTERNACIONAL', 'India', 'Mumbai', 'BOM'),
(57, 'Kempegowda International Airport', 'NACIONAL', 'India', 'Bangalore', 'BLR'),

-- Sudáfrica
(58, 'O. R. Tambo International Airport', 'INTERNACIONAL', 'Sudáfrica', 'Johannesburgo', 'JNB'),
(59, 'Cape Town International Airport', 'INTERNACIONAL', 'Sudáfrica', 'Ciudad del Cabo', 'CPT'),
(60, 'King Shaka International Airport', 'NACIONAL', 'Sudáfrica', 'Durban', 'DUR');





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


-- Alemania ----------------------------------------------------
-- FRA (id = 28)
(53, 28, 1, 'Terminal 1', 25),
(54, 28, 2, 'Terminal 2', 20),
(55, 28, 3, 'Terminal 3', 38),

-- MUC (id = 29)
(56, 29, 1, 'Terminal A', 15),
(57, 29, 2, 'Terminal B', 12),
(58, 29, 3, 'Terminal C', 10),

-- BER (id = 30)
(59, 30, 1, 'Terminal S', 18),
(60, 30, 2, 'Terminal N', 6);





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
(78, 38, 2, 'CNF-T1-2', 180),

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
(106, 52, 2, 'FUK-T1-2', 180);





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
(25, 'All Nippon Airways',    'Japón', 'ANA', '1952-12-27'),          --BORRAR
-- Alemania
(26, 'Lufthansa',             'Alemania', 'DLH', '1953-01-06'),
(27, 'Eurowings',             'Alemania', 'EWG', '1993-02-01'),
(28, 'Condor Flugdienst',     'Alemania', 'CFG', '1955-12-21'),

-- Francia
(29, 'Air France',            'Francia', 'AFR', '1933-10-07'),
(30, 'Transavia France',      'Francia', 'TVF', '2007-05-01'),
(31, 'Corsair International', 'Francia', 'CRL', '1981-01-17'),

-- Reino Unido
(32, 'British Airways',       'Reino Unido', 'BAW', '1974-03-31'),
(33, 'EasyJet',               'Reino Unido', 'EZY', '1995-03-18'),
(34, 'Virgin Atlantic',       'Reino Unido', 'VIR', '1984-06-22'),

-- Italia
(35, 'ITA Airways',           'Italia', 'ITY', '2020-10-16'),
(36, 'Neos',                  'Italia', 'NOS', '2001-06-22'),
(37, 'Air Dolomiti',          'Italia', 'DLA', '1991-01-30'),

-- Canadá
(38, 'Air Canada',            'Canadá', 'ACA', '1937-04-10'),
(39, 'WestJet',               'Canadá', 'WJA', '1996-06-29'),
(40, 'Porter Airlines',       'Canadá', 'POE', '2006-02-02'),

-- Argentina
(41, 'Aerolíneas Argentinas', 'Argentina', 'ARG', '1950-12-07'),
(42, 'Flybondi',              'Argentina', 'FBZ', '2016-12-01'),
(43, 'JetSmart Argentina',    'Argentina', 'JES', '2018-06-01'),

-- Chile
(44, 'LATAM Chile',           'Chile', 'LAN', '1929-12-21'),
(45, 'Sky Airline',           'Chile', 'SKU', '2001-12-01'),
(46, 'JetSmart Chile',        'Chile', 'JAT', '2017-07-01'),

-- Australia
(47, 'Qantas Airways',        'Australia', 'QFA', '1920-11-16'),
(48, 'Virgin Australia',      'Australia', 'VOZ', '2000-08-31'),
(49, 'Regional Express Airlines', 'Australia', 'RXA', '2002-08-01'),

-- China
(50, 'Air China',             'China', 'CCA', '1988-07-01'),
(51, 'China Eastern Airlines', 'China', 'CES', '1988-06-25'),
(52, 'China Southern Airlines', 'China', 'CSN', '1988-07-01'),

-- India
(53, 'Air India',             'India', 'AIC', '1932-07-29'),
(54, 'IndiGo',                'India', 'IGO', '2006-08-04'),
(55, 'SpiceJet',              'India', 'SEJ', '2004-05-05'),

-- Sudáfrica
(56, 'South African Airways', 'Sudáfrica', 'SAA', '1934-02-01'),
(57, 'Comair',                'Sudáfrica', 'CAW', '1946-07-01'),
(58, 'Mango Airlines',        'Sudáfrica', 'MNO', '2006-10-30'),

-- Turquía
(59, 'Turkish Airlines',      'Turquía', 'THY', '1933-05-20'),
(60, 'Pegasus Airlines',      'Turquía', 'PGT', '1990-12-01');





-- AVIONES
INSERT INTO avion (id_avion, id_aeropuerto, id_aerolinea, modelo, capacidad_pasajeros, matricula, estado_avion) VALUES
---------------MEXICO------------------
-- Aeroméxico
(1, 1, 1, 'Boeing 737-800', 160, 'MX-A0001', 'OPERATIVO'),
(2, 2, 1, 'Boeing 737 MAX 9', 180, 'MX-A0002', 'OPERATIVO'),
(3, 2, 1, 'Boeing 787-9 Dreamliner', 290, 'MX-A0003', 'OPERATIVO'),
(4, 3, 1, 'Embraer 190', 99, 'MX-A0004', 'OPERATIVO'),
(5, 4, 1, 'Boeing 737-700', 144, 'MX-A0005', 'RETIRADO'),
(6, 1, 1, 'Boeing 737 MAX 8', 175, 'MX-A0006', 'MANTENIMIENTO'),
(7, 2, 1, 'Boeing 787-8 Dreamliner', 250, 'MX-A0007', 'OPERATIVO'),
-- Volaris
(8, 1, 2, 'Airbus A320neo', 186, 'MX-A0008', 'OPERATIVO'),
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
(56, 3, 8, 'Boeing 737-400', 159, 'MX-A0056', 'OPERATIVO'),
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
(3, 1, 2, 'Carlos', 'Ramírez', 'Vega', '1978-11-03', 'Mexicana'),
(4, 1, 1, 'Ana', 'Sánchez', 'Morales', '1990-01-18', 'Mexicana'),
-- Volaris
(5, 2, 1, 'Luis', 'Torres', 'Reyes', '1982-05-27', 'Mexicana'),
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
(195, 24, 27, 'Miyuki', 'Ito', 'Kawasaki', '1990-06-25', 'Japonesa'),

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





INSERT INTO licencia_piloto (id_licencia, id_piloto, tipo_licencia, numero_licencia, fecha_emision, fecha_vencimiento, autoridad_emisora) VALUES
-- Aeroméxico Piloto 1
(1, 1, 'CPL', 'MX-CPL-1', '2016-05-10', '2030-05-10', 'DGAC México'),
(2, 1, 'ATPL', 'MX-ATPL-1', '2018-07-15', '2032-07-15', 'DGAC México'),
-- Aeroméxico Piloto 2
(3, 2, 'CPL', 'MX-CPL-2', '2017-03-12', '2031-03-12', 'DGAC México'),
(4, 2, 'ATPL', 'MX-ATPL-2', '2019-09-20', '2033-09-20', 'DGAC México'),
-- Aeroméxico Piloto 3
(5, 3, 'CPL', 'MX-CPL-3', '2015-11-01', '2030-11-01', 'DGAC México'),
(6, 3, 'ATPL', 'MX-ATPL-3', '2018-02-14', '2032-02-14', 'DGAC México'),
-- Aeroméxico Piloto 4
(7, 4, 'CPL', 'MX-CPL-4', '2014-06-01', '2020-06-01', 'DGAC México'),

-- Volaris Piloto 5
(8, 5, 'CPL', 'MX-CPL-5', '2016-08-10', '2030-08-10', 'DGAC México'),
(9, 5, 'ATPL', 'MX-ATPL-5', '2019-01-05', '2033-01-05', 'DGAC México'),
-- Volaris Piloto 6
(10, 6, 'CPL', 'MX-CPL-6', '2017-04-12', '2031-04-12', 'DGAC México'),
(11, 6, 'ATPL', 'MX-ATPL-6', '2019-10-20', '2033-10-20', 'DGAC México'),
-- Volaris Piloto 7
(12, 7, 'CPL', 'MX-CPL-7', '2013-09-01', '2021-09-01', 'DGAC México'),

-- Viva Aerobus Piloto 8
(13, 8, 'CPL', 'MX-CPL-8', '2016-07-10', '2030-07-10', 'DGAC México'),
(14, 8, 'ATPL', 'MX-ATPL-8', '2018-11-05', '2032-11-05', 'DGAC México'),
-- Viva Aerobus Piloto 9
(15, 9, 'CPL', 'MX-CPL-9', '2017-05-12', '2031-05-12', 'DGAC México'),
(16, 9, 'ATPL', 'MX-ATPL-9', '2019-08-20', '2033-08-20', 'DGAC México'),
-- Viva Aerobus Piloto 10
(17, 10, 'CPL', 'MX-CPL-10', '2014-04-01', '2020-04-01', 'DGAC México'),

-- Interjet Piloto 11
(18, 11, 'CPL', 'MX-CPL-11', '2016-06-10', '2030-06-10', 'DGAC México'),
(19, 11, 'ATPL', 'MX-ATPL-11', '2018-09-05', '2032-09-05', 'DGAC México'),
-- Interjet Piloto 12
(20, 12, 'CPL', 'MX-CPL-12', '2017-02-12', '2031-02-12', 'DGAC México'),
(21, 12, 'ATPL', 'MX-ATPL-12', '2019-07-20', '2033-07-20', 'DGAC México'),
-- Interjet Piloto 13
(22, 13, 'CPL', 'MX-CPL-13', '2013-05-01', '2021-05-01', 'DGAC México'),

-- Calafia Airlines Piloto 14
(23, 14, 'CPL', 'MX-CPL-14', '2016-03-10', '2030-03-10', 'DGAC México'),
(24, 14, 'ATPL', 'MX-ATPL-14', '2018-06-05', '2032-06-05', 'DGAC México'),
-- Calafia Airlines Piloto 15
(25, 15, 'CPL', 'MX-CPL-15', '2017-01-12', '2031-01-12', 'DGAC México'),
(26, 15, 'ATPL', 'MX-ATPL-15', '2019-05-20', '2033-05-20', 'DGAC México'),
-- Calafia Airlines Piloto 16
(27, 16, 'CPL', 'MX-CPL-16', '2014-02-01', '2020-02-01', 'DGAC México'),

-- Aeromar Piloto 17
(28, 17, 'CPL', 'MX-CPL-17', '2016-09-10', '2030-09-10', 'DGAC México'),
(29, 17, 'ATPL', 'MX-ATPL-17', '2018-12-05', '2032-12-05', 'DGAC México'),
-- Aeromar Piloto 18
(30, 18, 'CPL', 'MX-CPL-18', '2017-08-12', '2031-08-12', 'DGAC México'),
(31, 18, 'ATPL', 'MX-ATPL-18', '2019-11-20', '2033-11-20', 'DGAC México'),
-- Aeromar Piloto 19 
(32, 19, 'CPL', 'MX-CPL-19', '2014-01-01', '2020-01-01', 'DGAC México'),

-- Aerus Piloto 20
(33, 20, 'CPL', 'MX-CPL-20', '2016-05-10', '2030-05-10', 'DGAC México'),
(34, 20, 'ATPL', 'MX-ATPL-20', '2018-07-15', '2032-07-15', 'DGAC México'),
-- Aerus Piloto 21
(35, 21, 'CPL', 'MX-CPL-21', '2017-03-12', '2031-03-12', 'DGAC México'),
(36, 21, 'ATPL', 'MX-ATPL-21', '2019-09-20', '2033-09-20', 'DGAC México'),
-- Aerus Piloto 22 
(37, 22, 'CPL', 'MX-CPL-22', '2014-06-01', '2020-06-01', 'DGAC México'),

-- Magnicharters Piloto 23
(38, 23, 'CPL', 'MX-CPL-23', '2016-08-10', '2030-08-10', 'DGAC México'),
(39, 23, 'ATPL', 'MX-ATPL-23', '2019-01-05', '2033-01-05', 'DGAC México'),
-- Magnicharters Piloto 24
(40, 24, 'CPL', 'MX-CPL-24', '2017-04-12', '2031-04-12', 'DGAC México'),
(41, 24, 'ATPL', 'MX-ATPL-24', '2019-10-20', '2033-10-20', 'DGAC México'),
-- Magnicharters Piloto 25 (último → vencida)
(42, 25, 'CPL', 'MX-CPL-25', '2013-09-01', '2021-09-01', 'DGAC México'),

-- Mexicana de Aviación Piloto 26
(43, 26, 'CPL', 'MX-CPL-26', '2016-07-10', '2030-07-10', 'DGAC México'),
(44, 26, 'ATPL', 'MX-ATPL-26', '2018-11-05', '2032-11-05', 'DGAC México'),
-- Mexicana de Aviación Piloto 27
(45, 27, 'CPL', 'MX-CPL-27', '2017-05-12', '2031-05-12', 'DGAC México'),
(46, 27, 'ATPL', 'MX-ATPL-27', '2019-08-20', '2033-08-20', 'DGAC México'),
-- Mexicana de Aviación Piloto 28 (último → vencida)
(47, 28, 'CPL', 'MX-CPL-28', '2014-04-01', '2020-04-01', 'DGAC México'),


-- American Airlines Piloto 29
(100, 29, 'CPL', 'US-CPL-29', '2016-05-10', '2030-05-10', 'FAA USA'),
(101, 29, 'ATPL', 'US-ATPL-29', '2018-07-15', '2032-07-15', 'FAA USA'),
-- American Airlines Piloto 30
(102, 30, 'CPL', 'US-CPL-30', '2017-03-12', '2031-03-12', 'FAA USA'),
(103, 30, 'ATPL', 'US-ATPL-30', '2019-09-20', '2033-09-20', 'FAA USA'),
-- American Airlines Piloto 31 
(104, 31, 'CPL', 'US-CPL-31', '2014-06-01', '2020-06-01', 'FAA USA'),

-- Delta Air Lines Piloto 32
(105, 32, 'CPL', 'US-CPL-32', '2016-08-10', '2030-08-10', 'FAA USA'),
(106, 32, 'ATPL', 'US-ATPL-32', '2019-01-05', '2033-01-05', 'FAA USA'),
-- Delta Air Lines Piloto 33
(107, 33, 'CPL', 'US-CPL-33', '2017-04-12', '2031-04-12', 'FAA USA'),
(108, 33, 'ATPL', 'US-ATPL-33', '2019-10-20', '2033-10-20', 'FAA USA'),
-- Delta Air Lines Piloto 34
(109, 34, 'CPL', 'US-CPL-34', '2013-09-01', '2021-09-01', 'FAA USA'),

-- United Airlines Piloto 35
(110, 35, 'CPL', 'US-CPL-35', '2016-07-10', '2030-07-10', 'FAA USA'),
(111, 35, 'ATPL', 'US-ATPL-35', '2018-11-05', '2032-11-05', 'FAA USA'),
-- United Airlines Piloto 36
(112, 36, 'CPL', 'US-CPL-36', '2017-05-12', '2031-05-12', 'FAA USA'),
(113, 36, 'ATPL', 'US-ATPL-36', '2019-08-20', '2033-08-20', 'FAA USA'),
-- United Airlines Piloto 37 
(114, 37, 'CPL', 'US-CPL-37', '2014-04-01', '2020-04-01', 'FAA USA'),

-- Southwest Airlines Piloto 38
(115, 38, 'CPL', 'US-CPL-38', '2016-06-10', '2030-06-10', 'FAA USA'),
(116, 38, 'ATPL', 'US-ATPL-38', '2018-09-05', '2032-09-05', 'FAA USA'),
-- Southwest Airlines Piloto 39
(117, 39, 'CPL', 'US-CPL-39', '2017-02-12', '2031-02-12', 'FAA USA'),
(118, 39, 'ATPL', 'US-ATPL-39', '2019-07-20', '2033-07-20', 'FAA USA'),
-- Southwest Airlines Piloto 40 
(119, 40, 'CPL', 'US-CPL-40', '2013-05-01', '2021-05-01', 'FAA USA'),

-- JetBlue Airways Piloto 41
(120, 41, 'CPL', 'US-CPL-41', '2016-03-10', '2030-03-10', 'FAA USA'),
(121, 41, 'ATPL', 'US-ATPL-41', '2018-06-05', '2032-06-05', 'FAA USA'),
-- JetBlue Airways Piloto 42
(122, 42, 'CPL', 'US-CPL-42', '2017-01-12', '2031-01-12', 'FAA USA'),
(123, 42, 'ATPL', 'US-ATPL-42', '2019-05-20', '2033-05-20', 'FAA USA'),
-- JetBlue Airways Piloto 43 
(124, 43, 'CPL', 'US-CPL-43', '2014-02-01', '2020-02-01', 'FAA USA'),

-- Alaska Airlines Piloto 44
(125, 44, 'CPL', 'US-CPL-44', '2016-09-10', '2030-09-10', 'FAA USA'),
(126, 44, 'ATPL', 'US-ATPL-44', '2018-12-05', '2032-12-05', 'FAA USA'),
-- Alaska Airlines Piloto 45
(127, 45, 'CPL', 'US-CPL-45', '2017-08-12', '2031-08-12', 'FAA USA'),
(128, 45, 'ATPL', 'US-ATPL-45', '2019-11-20', '2033-11-20', 'FAA USA'),
-- Alaska Airlines Piloto 46 
(129, 46, 'CPL', 'US-CPL-46', '2014-01-01', '2020-01-01', 'FAA USA'),

-- Spirit Airlines Piloto 47
(130, 47, 'CPL', 'US-CPL-47', '2016-05-10', '2030-05-10', 'FAA USA'),
(131, 47, 'ATPL', 'US-ATPL-47', '2018-07-15', '2032-07-15', 'FAA USA'),
-- Spirit Airlines Piloto 48
(132, 48, 'CPL', 'US-CPL-48', '2017-03-12', '2031-03-12', 'FAA USA'),
(133, 48, 'ATPL', 'US-ATPL-48', '2019-09-20', '2033-09-20', 'FAA USA'),
-- Spirit Airlines Piloto 49 
(134, 49, 'CPL', 'US-CPL-49', '2014-06-01', '2020-06-01', 'FAA USA'),

-- Frontier Airlines Piloto 50
(135, 50, 'CPL', 'US-CPL-50', '2016-08-10', '2030-08-10', 'FAA USA'),
(136, 50, 'ATPL', 'US-ATPL-50', '2019-01-05', '2033-01-05', 'FAA USA'),
-- Frontier Airlines Piloto 51
(137, 51, 'CPL', 'US-CPL-51', '2017-04-12', '2031-04-12', 'FAA USA'),
(138, 51, 'ATPL', 'US-ATPL-51', '2019-10-20', '2033-10-20', 'FAA USA'),
-- Frontier Airlines Piloto 52 
(139, 52, 'CPL', 'US-CPL-52', '2013-09-01', '2021-09-01', 'FAA USA'),


-- LATAM Brasil Piloto 53
(140, 53, 'CPL', 'BR-CPL-53', '2016-05-10', '2030-05-10', 'ANAC Brasil'),
(141, 53, 'ATPL', 'BR-ATPL-53', '2018-07-15', '2032-07-15', 'ANAC Brasil'),
-- LATAM Brasil Piloto 54
(142, 54, 'CPL', 'BR-CPL-54', '2017-03-12', '2031-03-12', 'ANAC Brasil'),
(143, 54, 'ATPL', 'BR-ATPL-54', '2019-09-20', '2033-09-20', 'ANAC Brasil'),
-- LATAM Brasil Piloto 55 
(144, 55, 'CPL', 'BR-CPL-55', '2014-06-01', '2020-06-01', 'ANAC Brasil'),

-- Gol Linhas Aéreas Piloto 56
(145, 56, 'CPL', 'BR-CPL-56', '2016-08-10', '2030-08-10', 'ANAC Brasil'),
(146, 56, 'ATPL', 'BR-ATPL-56', '2019-01-05', '2033-01-05', 'ANAC Brasil'),
-- Gol Linhas Aéreas Piloto 57
(147, 57, 'CPL', 'BR-CPL-57', '2017-04-12', '2031-04-12', 'ANAC Brasil'),
(148, 57, 'ATPL', 'BR-ATPL-57', '2019-10-20', '2033-10-20', 'ANAC Brasil'),
-- Gol Linhas Aéreas Piloto 58 (último → vencida)
(149, 58, 'CPL', 'BR-CPL-58', '2013-09-01', '2021-09-01', 'ANAC Brasil'),

-- Azul Linhas Aéreas Piloto 59
(150, 59, 'CPL', 'BR-CPL-59', '2016-07-10', '2030-07-10', 'ANAC Brasil'),
(151, 59, 'ATPL', 'BR-ATPL-59', '2018-11-05', '2032-11-05', 'ANAC Brasil'),
-- Azul Linhas Aéreas Piloto 60
(152, 60, 'CPL', 'BR-CPL-60', '2017-05-12', '2031-05-12', 'ANAC Brasil'),
(153, 60, 'ATPL', 'BR-ATPL-60', '2019-08-20', '2033-08-20', 'ANAC Brasil'),
-- Azul Linhas Aéreas Piloto 61
(154, 61, 'CPL', 'BR-CPL-61', '2014-04-01', '2020-04-01', 'ANAC Brasil'),


-- Iberia Piloto 62
(155, 62, 'CPL', 'ES-CPL-62', '2016-05-10', '2030-05-10', 'AESA España'),
(156, 62, 'ATPL', 'ES-ATPL-62', '2018-07-15', '2032-07-15', 'AESA España'),
-- Iberia Piloto 63
(157, 63, 'CPL', 'ES-CPL-63', '2017-03-12', '2031-03-12', 'AESA España'),
(158, 63, 'ATPL', 'ES-ATPL-63', '2019-09-20', '2033-09-20', 'AESA España'),
-- Iberia Piloto 64 (último → vencida)
(159, 64, 'CPL', 'ES-CPL-64', '2014-06-01', '2020-06-01', 'AESA España'),

-- Air Europa Piloto 65
(160, 65, 'CPL', 'ES-CPL-65', '2016-08-10', '2030-08-10', 'AESA España'),
(161, 65, 'ATPL', 'ES-ATPL-65', '2019-01-05', '2033-01-05', 'AESA España'),
-- Air Europa Piloto 66
(162, 66, 'CPL', 'ES-CPL-66', '2017-04-12', '2031-04-12', 'AESA España'),
(163, 66, 'ATPL', 'ES-ATPL-66', '2019-10-20', '2033-10-20', 'AESA España'),
-- Air Europa Piloto 67 (último → vencida)
(164, 67, 'CPL', 'ES-CPL-67', '2013-09-01', '2021-09-01', 'AESA España'),

-- Vueling Piloto 68
(165, 68, 'CPL', 'ES-CPL-68', '2016-07-10', '2030-07-10', 'AESA España'),
(166, 68, 'ATPL', 'ES-ATPL-68', '2018-11-05', '2032-11-05', 'AESA España'),
-- Vueling Piloto 69
(167, 69, 'CPL', 'ES-CPL-69', '2017-05-12', '2031-05-12', 'AESA España'),
(168, 69, 'ATPL', 'ES-ATPL-69', '2019-08-20', '2033-08-20', 'AESA España'),
-- Vueling Piloto 70 (último → vencida)
(169, 70, 'CPL', 'ES-CPL-70', '2014-04-01', '2020-04-01', 'AESA España'),

  
-- Japan Airlines Piloto 71
(170, 71, 'CPL', 'JP-CPL-71', '2016-05-10', '2030-05-10', 'JCAB Japón'),
(171, 71, 'ATPL', 'JP-ATPL-71', '2018-07-15', '2032-07-15', 'JCAB Japón'),
-- Japan Airlines Piloto 72
(172, 72, 'CPL', 'JP-CPL-72', '2017-03-12', '2031-03-12', 'JCAB Japón'),
(173, 72, 'ATPL', 'JP-ATPL-72', '2019-09-20', '2033-09-20', 'JCAB Japón'),
-- Japan Airlines Piloto 73
(174, 73, 'CPL', 'JP-CPL-73', '2015-11-01', '2030-11-01', 'JCAB Japón'),
(175, 73, 'ATPL', 'JP-ATPL-73', '2018-02-14', '2032-02-14', 'JCAB Japón'),
-- Japan Airlines Piloto 74 (último → vencida)
(176, 74, 'CPL', 'JP-CPL-74', '2014-06-01', '2020-06-01', 'JCAB Japón');
