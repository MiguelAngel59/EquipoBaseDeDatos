-----------------------------------------------INSERTS-----------------------------------------------

--...................VUELOS...................
-- PROGRAMACION DE VUELOS

-- AEROMÉXICO
-- AMX100 MEX(1) -> GDL(2) | avion 1, piloto 1
CALL registrar_vuelo_completo(
100, 1, 2, 'COMERCIAL', 'AMX100',
100, 1, 1, 1,
(now() + interval '2 hours')::timestamp,
(now() + interval '4 hours')::timestamp
);
-- AMX101 GDL(2) -> CUN(4) | avion 1, piloto 1
CALL registrar_vuelo_completo(
101, 2, 4, 'COMERCIAL', 'AMX101',
101, 1, 1, 7,
(now() + interval '8 hours')::timestamp,
(now() + interval '11 hours')::timestamp
);
-- AMX102 GDL(2) -> MTY(3) | avion 2, piloto 2
CALL registrar_vuelo_completo(
102, 2, 3, 'COMERCIAL', 'AMX102',
102, 2, 2, 7,
(now() + interval '3 hours')::timestamp,
(now() + interval '5 hours')::timestamp
);
-- AMX103 MTY(3) -> MEX(1) | avion 4, piloto 3
CALL registrar_vuelo_completo(
103, 3, 1, 'CARGA', 'AMX103',
103, 4, 3, 11,
(now() + interval '2 hours')::timestamp,
(now() + interval '4 hours')::timestamp
);
-- AMX104 CUN(4) -> JFK(11) | avion 1, piloto 1
CALL registrar_vuelo_completo(
104, 4, 11, 'COMERCIAL', 'AMX104',
104, 1, 1, 13,
(now() + interval '16 hours')::timestamp,
(now() + interval '21 hours')::timestamp
);
-- AMX105 JFK(11) -> MEX(1) | avion 1, piloto 1
CALL registrar_vuelo_completo(
105, 11, 1, 'COMERCIAL', 'AMX105',
105, 1, 1, 11,
(now() + interval '1 day 3 hours')::timestamp,
(now() + interval '1 day 8 hours')::timestamp
);
-- AMX106 MTY(3) -> QRO(8) | avion 4, piloto 3
CALL registrar_vuelo_completo(
106, 1, 8, 'COMERCIAL', 'AMX106',
106, 4, 3, 11,
(now() + interval '12 hours')::timestamp,
(now() + interval '13 hours 30 minutes')::timestamp
);



-- VOLARIS
-- VOL200 MEX(1) -> BJX(9) | avion 8, piloto 5
CALL registrar_vuelo_completo(
200, 1, 9, 'COMERCIAL', 'VOL200',
200, 8, 5, 1,
(now() + interval '1 hour')::timestamp,
(now() + interval '2 hours 30 minutes')::timestamp
);
-- VOL201 BJX(9) -> GDL(2) | avion 8, piloto 5
CALL registrar_vuelo_completo(
201, 9, 2, 'COMERCIAL', 'VOL201',
201, 8, 5, 7,
(now() + interval '6 hours')::timestamp,
(now() + interval '8 hours')::timestamp
);
-- VOL202 MTY(3) -> DFW(12) | avion 9, piloto 6
CALL registrar_vuelo_completo(
202, 3, 12, 'COMERCIAL', 'VOL202',
202, 9, 6, 11,
(now() + interval '4 hours')::timestamp,
(now() + interval '7 hours')::timestamp
);

-- VOL203 GDL(2) -> MID(6) | avion 8, piloto 5
CALL registrar_vuelo_completo(
203, 2, 6, 'COMERCIAL', 'VOL203',
203, 8, 5, 7,
(now() + interval '12 hours')::timestamp,
(now() + interval '14 hours')::timestamp
);
-- VOL204 MID(6) -> CUN(4) | avion 8, piloto 5
CALL registrar_vuelo_completo(
204, 6, 4, 'COMERCIAL', 'VOL204',
204, 8, 5, 6,
(now() + interval '18 hours')::timestamp,
(now() + interval '20 hours')::timestamp
);
-- VOL205 DFW(12) -> DEN(14) | avion 9, piloto 6
CALL registrar_vuelo_completo(
205, 12, 14, 'COMERCIAL', 'VOL205',
205, 9, 6, 12,
(now() + interval '14 hours')::timestamp,
(now() + interval '16 hours')::timestamp
);
-- VOL206 DEN(14) -> MEX(1) | avion 9, piloto 6
CALL registrar_vuelo_completo(
206, 14, 1, 'COMERCIAL', 'VOL206',
206, 9, 6, 14,
(now() + interval '22 hours')::timestamp,
(now() + interval '1 day 3 hours')::timestamp
);



-- VIVA AEROBUS
-- VIV300 MEX(1) -> MID(6) | avion 15, piloto 8
CALL registrar_vuelo_completo(
300, 1, 6, 'COMERCIAL', 'VIV300',
300, 15, 8, 1,
(now() + interval '2 hours')::timestamp,
(now() + interval '4 hours')::timestamp
);
-- VIV301 MID(6) -> CUN(4) | avion 15, piloto 8
CALL registrar_vuelo_completo(
301, 6, 4, 'COMERCIAL', 'VIV301',
301, 15, 8, 6,
(now() + interval '8 hours')::timestamp,
(now() + interval '10 hours')::timestamp
);
-- VIV302 GDL(2) -> MTY(3) | avion 16, piloto 9
CALL registrar_vuelo_completo(
302, 2, 3, 'COMERCIAL', 'VIV302',
302, 16, 9, 7,
(now() + interval '1 hours')::timestamp,
(now() + interval '3 hours 30 minutes')::timestamp
);
-- VIV303 MTY(3) -> DEN(14) | avion 20, piloto 9
CALL registrar_vuelo_completo(
303, 3, 14, 'COMERCIAL', 'VIV303',
303, 20, 9, 11,
(now() + interval '6 hours')::timestamp,
(now() + interval '9 hours')::timestamp
);
-- VIV304 CUN(4) -> MCO(15) | avion 18, piloto 8
CALL registrar_vuelo_completo(
304, 4, 15, 'COMERCIAL', 'VIV304',
304, 18, 8, 13,
(now() + interval '14 hours')::timestamp,
(now() + interval '18 hours')::timestamp
);
-- VIV305 MCO(15) -> CUN(4) | avion 18, piloto 8
CALL registrar_vuelo_completo(
305, 15, 4, 'COMERCIAL', 'VIV305',
305, 18, 8, 15,
(now() + interval '1 day 2 hours')::timestamp,
(now() + interval '1 day 6 hours')::timestamp
);
-- VIV306 DEN(14) -> LAX(10) | avion 20, piloto 9
CALL registrar_vuelo_completo(
306, 14, 10, 'COMERCIAL', 'VIV306',
306, 20, 9, 14,
(now() + interval '1 day 4 hours')::timestamp,
(now() + interval '1 day 8 hours')::timestamp
);




--...................BOLETOS...................
-- REGISTRAR COMPRA DE BOLETOS

---- AEROMÉXICO ----
-- TARIFAS DEL AMX100
INSERT INTO tarifa_vuelo (id_tarifa, id_programacion_vuelo, precio, clase) VALUES
(1, 100, 1200, 'ECONOMICA'),
(2, 100, 2200, 'EJECUTIVA'),
(3, 100, 3500, 'PREMIUM');
-- BOLETOS DEL AMX100
INSERT INTO boleto (id_programacion_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(100, 1, now()::TIMESTAMP, 1),
(100, 1, now()::TIMESTAMP, 2),
(100, 1, now()::TIMESTAMP, 3),
(100, 1, now()::TIMESTAMP, 4),
(100, 1, now()::TIMESTAMP, 5),
(100, 1, now()::TIMESTAMP, 6),
(100, 1, now()::TIMESTAMP, 7),
(100, 2, now()::TIMESTAMP, 8),
(100, 2, now()::TIMESTAMP, 9),
(100, 2, now()::TIMESTAMP, 10),
(100, 2, now()::TIMESTAMP, 11),
(100, 2, now()::TIMESTAMP, 12),
(100, 3, now()::TIMESTAMP, 13),
(100, 3, now()::TIMESTAMP, 14),
(100, 3, now()::TIMESTAMP, 15),
(100, 3, now()::TIMESTAMP, 16);


-- TARIFAS DEL AMX101
INSERT INTO tarifa_vuelo (id_tarifa, id_programacion_vuelo, precio, clase) VALUES
(4, 101, 1120, 'ECONOMICA'),
(5, 101, 1230, 'EJECUTIVA'),
(6, 101, 1200, 'PREMIUM');
-- BOLETOS DEL VUELO AMX101
INSERT INTO boleto (id_programacion_vuelo, id_tarifa, fecha_compra, numero_asiento) VALUES
(101, 1, now()::TIMESTAMP, 1),
(101, 1, now()::TIMESTAMP, 2),
(101, 1, now()::TIMESTAMP, 3),
(101, 1, now()::TIMESTAMP, 4),
(101, 1, now()::TIMESTAMP, 5),
(101, 1, now()::TIMESTAMP, 6),
(101, 1, now()::TIMESTAMP, 7),
(101, 2, now()::TIMESTAMP, 8),
(101, 2, now()::TIMESTAMP, 9),
(101, 2, now()::TIMESTAMP, 10),
(101, 2, now()::TIMESTAMP, 11),
(101, 2, now()::TIMESTAMP, 12),
(101, 3, now()::TIMESTAMP, 13),
(101, 3, now()::TIMESTAMP, 14),
(101, 3, now()::TIMESTAMP, 15),
(101, 3, now()::TIMESTAMP, 16);

-- AMX102
INSERT INTO tarifa_vuelo VALUES
(7, 102, 980,  'ECONOMICA'),
(8, 102, 1850, 'EJECUTIVA'),
(9, 102, 2900, 'PREMIUM');

INSERT INTO boleto VALUES
(102, 1, now(), 1),
(102, 1, now(), 2),
(102, 1, now(), 3),
(102, 1, now(), 4),
(102, 2, now(), 5),
(102, 2, now(), 6),
(102, 3, now(), 7);

-- AMX104
INSERT INTO tarifa_vuelo VALUES
(10, 104, 4200, 'ECONOMICA'),
(11, 104, 7200, 'EJECUTIVA'),
(12, 104, 9800, 'PREMIUM');
INSERT INTO boleto VALUES
(104, 1, now(), 1),
(104, 1, now(), 2),
(104, 1, now(), 3),
(104, 1, now(), 4),
(104, 2, now(), 5),
(104, 2, now(), 6),
(104, 2, now(), 7),
(104, 3, now(), 8),
(104, 3, now(), 9);

-- AMX105
INSERT INTO tarifa_vuelo VALUES
(13, 105, 4100, 'ECONOMICA'),
(14, 105, 6900, 'EJECUTIVA'),
(15, 105, 9500, 'PREMIUM');
INSERT INTO boleto VALUES
(105, 1, now(), 1),
(105, 1, now(), 2),
(105, 1, now(), 3),
(105, 2, now(), 4),
(105, 2, now(), 5),
(105, 3, now(), 6);

-- AMX106
INSERT INTO tarifa_vuelo VALUES
(16, 106, 850,  'ECONOMICA'),
(17, 106, 1500, 'EJECUTIVA'),
(18, 106, 2100, 'PREMIUM');
INSERT INTO boleto VALUES
(106, 1, now(), 1),
(106, 1, now(), 2),
(106, 1, now(), 3),
(106, 2, now(), 4),
(106, 3, now(), 5);
