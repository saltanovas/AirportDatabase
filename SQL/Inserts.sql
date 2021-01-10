INSERT INTO aisa6698.CUSTOMER VALUES(1, 'Jurgis',   'Kuncinas', 'jurgis@gmail.com',    '+37061111111', 'Vilniaus 1', 'Alytus',   'Lietuva',    '12345',      '1111111111111111', '2021-08-31');
INSERT INTO aisa6698.CUSTOMER VALUES(2, 'Antanas',  'Skema',    'skema@gmail.com',     '+37062222222', 'Vilties 2',  'Cikaga',   'Amerika',    '12345-4321', '2222222222222222', '2022-08-31');
INSERT INTO aisa6698.CUSTOMER VALUES(3, 'Jonas',    'Radvanas', 'jonas@gmail.com',     '+37063333333', 'Vingio 3',   'Alytus',   'Lietuva',    '54321',      '3333333333333333', '2023-08-31');
INSERT INTO aisa6698.CUSTOMER VALUES(4, 'Vincas',   'Kudirka',  'vincas@gmail.com',    '+37064444444', 'Geroji 4',   'Kaunas',   'Lietuva',    '98765-5678', '4444444444444444', '2021-01-31');
INSERT INTO aisa6698.CUSTOMER VALUES(5, 'Jonas',    'Biliunas', 'biliunas@gmail.com',  '+37065555555', 'Zemynos 1',  'Lodze',    'Lenkija',    '12345',      '5555555555555555', '2022-02-27');
INSERT INTO aisa6698.CUSTOMER VALUES(6, 'Vincas',   'Kreve',    'kreve@gmail.com',     '+37061111111', 'Zemynos 15', 'Varena',   'Lietuva',    '12345',      '1111111111111111', '2023-03-31');
INSERT INTO aisa6698.CUSTOMER VALUES(7, 'Jurgis',   'Savickis', 'jurgsa@gmail.com',    '+37062222222', 'Rutu 2',     'Paryzius', 'Prancuzija', '55882',      '1111111111111111', '2021-04-30');
INSERT INTO aisa6698.CUSTOMER VALUES(8, 'Jonas',    'Aistis',   'jonaistis@gmail.com', '+37063333333', 'Rygos 3',    'Kaunas',   'Lietuva',    '14725',      '1234567891234567', '2022-05-31');
INSERT INTO aisa6698.CUSTOMER VALUES(9, 'Salomeja', 'Neris',    'neris@gmail.com',     '+37061111111', 'Rygos 3',    'Kaunas',   'Lietuva',    '14725',      '1234567891234567', '2023-06-30');


INSERT INTO aisa6698.Airport VALUES('VNO', 'Tarptautinis Vilniaus Oro uostas',  'Lietuva',  'Vilnius');
INSERT INTO aisa6698.Airport VALUES('WRO', 'Varsuvos Sopeno oro uostas',        'Lenkija',  'Varsuva');
INSERT INTO aisa6698.Airport VALUES('DUB', 'Dublino Tarptautinis oro uostas',   'Airija',   'Dublinas');
INSERT INTO aisa6698.Airport VALUES('MAD', 'Madrido Barachaso oro uostas',      'Ispanija', 'Madridas');
INSERT INTO aisa6698.Airport VALUES('ATH', 'Tarptautinis Atenu oro uostas',     'Graikija', 'Atenai');


INSERT INTO aisa6698.Aircraft VALUES('9I2L3NYH7I',  'Boeing 737', 'Ryanair',    4,  '1998-10-01');
INSERT INTO aisa6698.Aircraft VALUES('A2CQQZ159P',  'Airbus A15', 'Wizzair',    8,  '2002-03-17');
INSERT INTO aisa6698.Aircraft VALUES('3U8ZJNFIPI',  'Airbus 98K', 'Lufthansa',  3,  NULL);
INSERT INTO aisa6698.Aircraft VALUES('N0TI7PN8R9',  'Boeing 252', 'Ryanair',    6,  NULL);
INSERT INTO aisa6698.Aircraft VALUES('86K33RGR75',  'Boeing B52', 'AirBaltic',  7,  '2015-07-10');
INSERT INTO aisa6698.Aircraft VALUES('VCXDM0OS1V',  'Boeing 757', 'Ryanair',    12, '2010-04-18');
INSERT INTO aisa6698.Aircraft VALUES('TL2PUWWK3Q',  'Airbus 86A', 'Wizzair',    8,   NULL);


INSERT INTO aisa6698.Flight VALUES('W68012',    'VNO', '2020-12-28 07:25:00', 'DUB', '2020-12-28 08:55:00', 'VCXDM0OS1V');
INSERT INTO aisa6698.Flight VALUES('TK1407',    'DUB', '2021-10-21 12:38:00', 'MAD', '2021-10-21 14:10:00', 'TL2PUWWK3Q');
INSERT INTO aisa6698.Flight VALUES('BT610',     'WRO', '2021-01-12 22:20:00', 'ATH', '2021-01-13 01:20:00', 'N0TI7PN8R9');
INSERT INTO aisa6698.Flight VALUES('LO27463A',  'ATH', '2020-12-22 17:10:00', 'DUB', '2020-12-22 19:45:00', 'A2CQQZ159P');
INSERT INTO aisa6698.Flight VALUES('B2803P42Q', 'DUB', '2020-12-19 23:30:00', 'VNO', '2020-12-20 00:35:00', 'A2CQQZ159P');
INSERT INTO aisa6698.Flight VALUES('PAV650MNJ', 'ATH', '2020-11-20 08:40:00', 'MAD', '2020-11-20 09:55:00', 'VCXDM0OS1V');
INSERT INTO aisa6698.Flight VALUES('FR2244KL',  'VNO', '2020-12-27 23:00:00', 'WRO', '2020-12-28 00:05:00', '9I2L3NYH7I');
INSERT INTO aisa6698.Flight VALUES('A2803G',    'WRO', '2020-12-28 15:00:00', 'DUB', '2020-12-28 17:40:00', 'N0TI7PN8R9');
INSERT INTO aisa6698.Flight VALUES('LH886',     'MAD', '2020-12-27 05:10:00', 'WRO', '2020-12-28 08:55:00', 'TL2PUWWK3Q');


INSERT INTO aisa6698.Ticket VALUES('W68012', 1,  'Economy',  '31.50',  NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('W68012', 2,  'Economy',  '32.50',  NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('W68012', 3,  'Economy',  '33.50',  NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('W68012', 4,  'Economy',  '31.50',  NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('W68012', 5,  'Economy',  '34.50',  NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('W68012', 6,  'Economy',  '32.50',  NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('W68012', 7,  'Business', '44.50',  NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('W68012', 8,  'Business', '45.50',  NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('W68012', 9,  'Business', '44.50',  NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('W68012', 10, 'First',    '131.50', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('W68012', 11, 'First',    '132.50', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('W68012', 14, 'First',    '133.50', NULL, NULL, NULL);

INSERT INTO aisa6698.Ticket VALUES('TK1407', 1, 'First', '80.0', NULL, NULL, NULL); 
INSERT INTO aisa6698.Ticket VALUES('TK1407', 2, 'First', '80.0', NULL, NULL, NULL); 
INSERT INTO aisa6698.Ticket VALUES('TK1407', 3, 'First', '80.0', NULL, NULL, NULL); 
INSERT INTO aisa6698.Ticket VALUES('TK1407', 4, 'First', '80.0', NULL, NULL, NULL); 
INSERT INTO aisa6698.Ticket VALUES('TK1407', 5, 'First', '80.0', NULL, NULL, NULL); 
INSERT INTO aisa6698.Ticket VALUES('TK1407', 6, 'First', '80.0', NULL, NULL, NULL); 
INSERT INTO aisa6698.Ticket VALUES('TK1407', 7, 'First', '80.0', NULL, NULL, NULL); 
INSERT INTO aisa6698.Ticket VALUES('TK1407', 8, 'First', '80.0', NULL, NULL, NULL); 

INSERT INTO aisa6698.Ticket VALUES('BT610', 1, 'Economy',  '20.47', NULL, NULL, NULL); 
INSERT INTO aisa6698.Ticket VALUES('BT610', 2, 'Economy',  '20.47', NULL, NULL, NULL); 
INSERT INTO aisa6698.Ticket VALUES('BT610', 3, 'Business', '30.39', NULL, NULL, NULL); 
INSERT INTO aisa6698.Ticket VALUES('BT610', 4, 'Business', '38.49', NULL, NULL, NULL); 
INSERT INTO aisa6698.Ticket VALUES('BT610', 5, 'Business', '50.00', NULL, NULL, NULL); 
INSERT INTO aisa6698.Ticket VALUES('BT610', 6, 'First',    '55.00', NULL, NULL, NULL); 

INSERT INTO aisa6698.Ticket VALUES('LO27463A', 1, 'Economy', '30.99', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('LO27463A', 2, 'Economy', '30.99', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('LO27463A', 3, 'Economy', '30.99', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('LO27463A', 4, 'Economy', '30.99', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('LO27463A', 5, 'Economy', '30.99', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('LO27463A', 6, 'Economy', '30.99', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('LO27463A', 7, 'Economy', '30.99', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('LO27463A', 8, 'Economy', '30.99', NULL, NULL, NULL);

INSERT INTO aisa6698.Ticket VALUES('B2803P42Q', 1, 'Business', '100.00', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket VALUES('B2803P42Q', 2, 'Business', '101.99', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('B2803P42Q', 3, 'Business', '102.99', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('B2803P42Q', 4, 'First',    '131.79', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('B2803P42Q', 5, 'First',    '132.89', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('B2803P42Q', 6, 'First',    '133.99', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('B2803P42Q', 7, 'First',    '134.00', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('B2803P42Q', 8, 'First',    '136.39', NULL, NULL, NULL);

INSERT INTO aisa6698.Ticket Values('PAV650MNJ', 1,  'Economy', '21.00', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('PAV650MNJ', 2,  'Economy', '22.00', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('PAV650MNJ', 3,  'Economy', '22.00', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('PAV650MNJ', 4,  'Economy', '25.00', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('PAV650MNJ', 5,  'Economy', '25.00', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('PAV650MNJ', 6,  'Economy', '25.00', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('PAV650MNJ', 7,  'Economy', '27.00', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('PAV650MNJ', 8,  'First',   '50.99', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('PAV650MNJ', 9,  'First',   '50.99', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('PAV650MNJ', 10, 'First',   '50.99', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('PAV650MNJ', 11, 'First',   '50.99', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('PAV650MNJ', 12, 'First',   '50.99', NULL, NULL, NULL, NULL);

INSERT INTO aisa6698.Ticket Values('FR2244KL', 1, DEFAULT, '18.60', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('FR2244KL', 2, DEFAULT, '18.60', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('FR2244KL', 3, DEFAULT, '18.60', NULL, NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('FR2244KL', 4, DEFAULT, '18.60', NULL, NULL, NULL, NULL);

INSERT INTO aisa6698.Ticket Values('A2803G', 1, 'Business', '60.50', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('A2803G', 2, 'Business', '61.50', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('A2803G', 3, 'Business', '62.50', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('A2803G', 4, 'Business', '60.50', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('A2803G', 5, 'Business', '61.50', NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('A2803G', 6, 'Business', '62.50', NULL, NULL, NULL);

INSERT INTO aisa6698.Ticket Values('LH886', 1, 'Economy',  '20.00',  NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('LH886', 2, 'Business', '31.50',  NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('LH886', 3, 'Business', '32.50',  NULL, NULL, NULL);
INSERT INTO aisa6698.Ticket Values('LH886', 4, 'Business', '32.50',  NULL, NULL, NULL, NULL);


INSERT INTO aisa6698.Aircrew VALUES(1, 'Arvydas',  'Sabonis',      'Pilotas',    'W68012');
INSERT INTO aisa6698.Aircrew VALUES(2, 'Sarunas',  'Marciulionis', 'Stiuardo',   'W68012');
INSERT INTO aisa6698.Aircrew VALUES(3, 'Gintaras', 'Krapikas',     'Stiuardo',   'FR2244KL');
INSERT INTO aisa6698.Aircrew VALUES(4, 'Rimas',    'Kurtinaitis',  'Pilotas',    'FR2244KL');
INSERT INTO aisa6698.Aircrew VALUES(5, 'Gintaras', 'Einikis',      'Pilotas',    'LO27463A');
INSERT INTO aisa6698.Aircrew VALUES(6, 'Juste',    'Jucyte',       'Pilote',     'B2803P42Q');
INSERT INTO aisa6698.Aircrew VALUES(7, 'Saulius',  'Stombergas',   'Stiuardo',   'B2803P42Q');
INSERT INTO aisa6698.Aircrew VALUES(8, 'Tomas',    'Pacesas',      'Stiuardo',   'LO27463A');
INSERT INTO aisa6698.Aircrew VALUES(9, 'Agne',     'Onaite',       'Stiuardese', NULL);


UPDATE aisa6698.Ticket SET Customer = 3 								          					       WHERE Flight = 'W68012' AND Seat = 1;
UPDATE aisa6698.Ticket SET Customer = 3, PassengerFirstName = 'Satrijos', PassengerLastName = 'Ragana'     WHERE Flight = 'W68012' AND Seat = 2;
UPDATE aisa6698.Ticket SET Customer = 3, PassengerFirstName = 'Antanas',  PassengerLastName = 'Skema'      WHERE Flight = 'W68012' AND Seat = 1;
UPDATE aisa6698.Ticket SET Customer = 1, PassengerFirstName = 'Valdas',   PassengerLastName = 'Kazlauskas' WHERE Flight = 'W68012' AND Seat = 14;

UPDATE aisa6698.Ticket SET Customer = 1 WHERE Flight = 'TK1407' AND Seat = 1;
UPDATE aisa6698.Ticket SET Customer = 2 WHERE Flight = 'TK1407' AND Seat = 2;
UPDATE aisa6698.Ticket SET Customer = 3 WHERE Flight = 'TK1407' AND Seat = 3;
UPDATE aisa6698.Ticket SET Customer = 4 WHERE Flight = 'TK1407' AND Seat = 4;

UPDATE aisa6698.Ticket SET Customer = 5 WHERE Flight = 'LO27463A' AND Seat = 1;
UPDATE aisa6698.Ticket SET Customer = 6 WHERE Flight = 'LO27463A' AND Seat = 2;
UPDATE aisa6698.Ticket SET Customer = 7 WHERE Flight = 'LO27463A' AND Seat = 3;

UPDATE aisa6698.Ticket SET Customer = 6, PassengerFirstName = 'Marcelijus', PassengerLastName = 'Martinaitis', PurchaseTime = '2020-11-11 21:22:00' WHERE Flight = 'PAV650MNJ' AND Seat = 1;
UPDATE aisa6698.Ticket SET Customer = 6, PurchaseTime = '2020-11-11 21:22:00' WHERE Flight = 'PAV650MNJ' AND Seat = 2;
UPDATE aisa6698.Ticket SET Customer = 7, PurchaseTime = '2020-11-10 20:17:00' WHERE Flight = 'PAV650MNJ' AND Seat = 3;
UPDATE aisa6698.Ticket SET Customer = 8, PurchaseTime = '2020-10-10 18:15:00' WHERE Flight = 'PAV650MNJ' AND Seat = 4;
UPDATE aisa6698.Ticket SET Customer = 9, PurchaseTime = '2020-11-19 13:40:00' WHERE Flight = 'PAV650MNJ' AND Seat = 5;

UPDATE aisa6698.Ticket SET Customer = 4 WHERE Flight = 'FR2244KL' AND Seat = 1;
UPDATE aisa6698.Ticket SET Customer = 8 WHERE Flight = 'FR2244KL' AND Seat = 2;
UPDATE aisa6698.Ticket SET Customer = 7 WHERE Flight = 'FR2244KL' AND Seat = 3;
UPDATE aisa6698.Ticket SET Customer = 7, PassengerFirstName = 'Henrikas', PassengerLastName = 'Radauskas' WHERE Flight = 'FR2244KL' AND Seat = 4;

UPDATE aisa6698.Ticket SET Customer = 5, PurchaseTime = '2020-11-05' WHERE Flight = 'LH886' AND Seat = 4;
