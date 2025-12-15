-----------------------------------------------INSERTS-----------------------------------------------

--...................VUELOS...................
-- PROGRAMACION DE VUELOS

-- AEROMÉXICO
-- AMX100 MEX(1) -> GDL(2) | avion 1, piloto 1
CALL registrar_vuelo_completo(
100, 1, 2, 'COMERCIAL', 'AMX100',
100, 1, 1, 1,
now() + interval '2 hours',
now() + interval '4 hours'
);
-- AMX101 GDL(2) -> CUN(4) | avion 1, piloto 1
CALL registrar_vuelo_completo(
101, 2, 4, 'COMERCIAL', 'AMX101',
101, 1, 1, 7,
now() + interval '8 hours',
now() + interval '11 hours'
);
-- AMX102 GDL(2) -> MTY(3) | avion 2, piloto 2
CALL registrar_vuelo_completo(
102, 2, 3, 'COMERCIAL', 'AMX102',
102, 2, 2, 7,
now() + interval '3 hours',
now() + interval '5 hours'
);
-- AMX103 MTY(3) -> MEX(1) | avion 4, piloto 3
CALL registrar_vuelo_completo(
103, 3, 1, 'CARGA', 'AMX103',
103, 4, 3, 11,
now() + interval '6 hours',
now() + interval '8 hours'
);
-- AMX104 CUN(4) -> JFK(11) | avion 1, piloto 1
CALL registrar_vuelo_completo(
104, 4, 11, 'COMERCIAL', 'AMX104',
104, 1, 1, 13,
now() + interval '16 hours',
now() + interval '21 hours'
);
-- AMX105 JFK(11) -> MEX(1) | avion 1, piloto 1
CALL registrar_vuelo_completo(
105, 11, 1, 'COMERCIAL', 'AMX105',
105, 1, 1, 11,
now() + interval '1 day 3 hours',
now() + interval '1 day 8 hours'
);
-- AMX106 MTY(3) -> QRO(8) | avion 4, piloto 3
CALL registrar_vuelo_completo(
106, 3, 8, 'COMERCIAL', 'AMX106',
106, 4, 3, 11,
now() + interval '12 hours',
now() + interval '13 hours 30 minutes'
);



-- VOLARIS
-- VOL200 MEX(1) -> BJX(9) | avion 8, piloto 5
CALL registrar_vuelo_completo(
200, 1, 9, 'COMERCIAL', 'VOL200',
200, 8, 5, 1,
now() + interval '1 hour',
now() + interval '2 hours 30 minutes'
);
-- VOL201 BJX(9) -> GDL(2) | avion 8, piloto 5
CALL registrar_vuelo_completo(
201, 9, 2, 'COMERCIAL', 'VOL201',
201, 8, 5, 7,
now() + interval '6 hours',
now() + interval '8 hours'
);
-- VOL202 MTY(3) -> DFW(12) | avion 9, piloto 6
CALL registrar_vuelo_completo(
202, 3, 12, 'COMERCIAL', 'VOL202',
202, 9, 6, 11,
now() + interval '4 hours',
now() + interval '7 hours'
);
-- VOL203 CUN(4) -> MEX(1) | avion 14, piloto 6
CALL registrar_vuelo_completo(
203, 4, 1, 'COMERCIAL', 'VOL203',
203, 14, 6, 13,
now() + interval '9 hours',
now() + interval '11 hours'
);
-- VOL204 GDL(2) -> MID(6) | avion 8, piloto 5
CALL registrar_vuelo_completo(
204, 2, 6, 'COMERCIAL', 'VOL204',
204, 8, 5, 7,
now() + interval '12 hours',
now() + interval '14 hours'
);
-- VOL205 MID(6) -> CUN(4) | avion 8, piloto 5
CALL registrar_vuelo_completo(
205, 6, 4, 'COMERCIAL', 'VOL205',
205, 8, 5, 6,
now() + interval '18 hours',
now() + interval '20 hours'
);
-- VOL206 DFW(12) -> DEN(14) | avion 9, piloto 6
CALL registrar_vuelo_completo(
206, 12, 14, 'COMERCIAL', 'VOL206',
206, 9, 6, 12,
now() + interval '14 hours',
now() + interval '16 hours'
);
-- VOL207 DEN(14) -> MEX(1) | avion 9, piloto 6
CALL registrar_vuelo_completo(
207, 14, 1, 'COMERCIAL', 'VOL207',
207, 9, 6, 14,
now() + interval '22 hours',
now() + interval '1 day 3 hours'
);



-- VIVA AEROBUS
-- VIV300 MEX(1) -> MID(6) | avion 15, piloto 8
CALL registrar_vuelo_completo(
300, 1, 6, 'COMERCIAL', 'VIV300',
300, 15, 8, 1,
now() + interval '2 hours',
now() + interval '4 hours'
);
-- VIV301 MID(6) -> CUN(4) | avion 15, piloto 8
CALL registrar_vuelo_completo(
301, 6, 4, 'COMERCIAL', 'VIV301',
301, 15, 8, 6,
now() + interval '8 hours',
now() + interval '10 hours'
);
-- VIV302 GDL(2) -> QRO(8) | avion 16, piloto 9
CALL registrar_vuelo_completo(
302, 2, 8, 'COMERCIAL', 'VIV302',
302, 16, 9, 7,
now() + interval '3 hours',
now() + interval '4 hours 30 minutes'
);
-- VIV303 MTY(3) -> DEN(14) | avion 20, piloto 9
CALL registrar_vuelo_completo(
303, 3, 14, 'COMERCIAL', 'VIV303',
303, 20, 9, 11,
now() + interval '6 hours',
now() + interval '9 hours'
);
-- VIV304 CUN(4) -> MCO(15) | avion 18, piloto 8
CALL registrar_vuelo_completo(
304, 4, 15, 'COMERCIAL', 'VIV304',
304, 18, 8, 13,
now() + interval '14 hours',
now() + interval '18 hours'
);
-- VIV305 MCO(15) -> CUN(4) | avion 18, piloto 8
CALL registrar_vuelo_completo(
305, 15, 4, 'COMERCIAL', 'VIV305',
305, 18, 8, 15,
now() + interval '1 day 2 hours',
now() + interval '1 day 6 hours'
);
-- VIV306 QRO(8) -> MEX(1) | avion 16, piloto 9
CALL registrar_vuelo_completo(
306, 8, 1, 'COMERCIAL', 'VIV306',
306, 16, 9, 8,
now() + interval '12 hours',
now() + interval '13 hours 15 minutes'
);
-- VIV307 DEN(14) -> LAX(10) | avion 20, piloto 9
CALL registrar_vuelo_completo(
307, 14, 10, 'COMERCIAL', 'VIV307',
307, 20, 9, 14,
now() + interval '1 day 4 hours',
now() + interval '1 day 8 hours'
);




--...................BOLETOS...................
-- REGISTRAR COMPRA DE BOLETOS

