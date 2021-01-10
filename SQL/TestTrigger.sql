--negalima update airport, tik delete
UPDATE Airport SET AirportCode = 'VLN' WHERE AirportCode = 'VNO';

--negalima tureti daugiau bilietu nei lektuvas turi sedimu vietu
INSERT INTO aisa6698.Ticket VALUES('W68012', 13, 'First', '133.50', 9, NULL, NULL); --neleis
INSERT INTO aisa6698.Ticket Values('LH886', 5, 'Business', '32.50',  6, NULL, NULL, '2020-11-05'); --leis

--passengername/pasengerlastname negali buti tame paciame skrydyje!! BET PATS CUSTOMER GALI
INSERT INTO aisa6698.Ticket Values('LH886', 6, 'Business', '32.50',  5, NULL, NULL, '2020-11-05'); -- neleis
INSERT INTO aisa6698.Ticket Values('LH886', 7, 'Business', '32.50',  5, 'Balys', 'Sruoga', '2020-11-05'); -- leis
UPDATE Ticket SET Customer = 7 WHERE Flight = 'LH886' AND Seat = 1; --leis
UPDATE Ticket SET Customer = 7 WHERE Flight = 'LH886' AND Seat = 2; --neleis
UPDATE Ticket SET Customer = 7, PassengerFirstName = 'sita', PassengerLastName = 'leis' WHERE Flight = 'LH886' AND Seat = 2; --leis
SELECT * FROM Ticket WHERE Flight = 'LH886';

--default reiksmes passengerfirstname/lastname, jeigu jos nera nurodomos. 
INSERT INTO aisa6698.Ticket Values('LH886', 8, DEFAULT, '32.50',  9); --magija
SELECT * FROM Ticket WHERE Flight = 'LH886';

-- negalima nenuorodyti customerid, jei dedamas firstname/lastname
INSERT INTO aisa6698.Ticket Values('LH886', 9, DEFAULT, '32.50',  NULL, 'NEGALIMA', 'SITAIP', NULL); --neleis
INSERT INTO aisa6698.Ticket Values('LH886', 9, DEFAULT, '32.50',  NULL, NULL, 'IR SITAIP NEGALIMA', NULL); --neleis
INSERT INTO aisa6698.Ticket Values('LH886', 9, DEFAULT, '32.50',  NULL, 'IR SITAIP NEGALIMA', NULL, NULL); --neleis
INSERT INTO aisa6698.Ticket Values('LH886', 9, DEFAULT, '32.50',  5, 'IR SITAIP NEGALIMA', NULL, NULL); --neleis
INSERT INTO aisa6698.Ticket Values('LH886', 9, DEFAULT, '32.50',  5, NULL, 'IR SITAIP NEGALIMA', NULL); --neleis
INSERT INTO aisa6698.Ticket Values('LH886', 9, DEFAULT, '32.50',  NULL, NULL, NULL, '2020-11-19'); --neleis
INSERT INTO aisa6698.Ticket Values('LH886', 9, DEFAULT, '32.50'); --leis
SELECT * FROM Ticket WHERE Flight = 'LH886';

-- negalima pirkti bilieto likus 6 valandoms iki skrydzio ir veliau
INSERT INTO Flight VALUES('NAUJAS', 'VNO', '2020-12-17 12:00:00', 'ATH', '2020-12-17 15:00:00', 'VCXDM0OS1V');
INSERT INTO Ticket VALUES('NAUJAS', 1, DEFAULT, '50.00'); --leis
SELECT * FROM Ticket WHERE Flight = 'NAUJAS';
UPDATE Ticket SET Customer = 1 WHERE Flight = 'NAUJAS'; --neleis

-- negalima keisti informacijos apie skrydi, kai skrydis jau ivyko 
UPDATE Flight SET DeparturePlace = 'VNO' WHERE FlightNumber = 'PAV650MNJ'; --neleis

-- negalima ideti skrydzio atgaline data
INSERT INTO aisa6698.Flight VALUES('KITAS', 'ATH', '2020-11-01 08:40:00', 'MAD', '2020-11-01 09:55:00', 'VCXDM0OS1V'); --neleis
INSERT INTO aisa6698.Flight VALUES('KITAS', 'ATH', '2021-11-01 08:40:00', 'MAD', '2021-11-01 09:55:00', 'VCXDM0OS1V'); --leis

-- negalima insert, update skrydzio bilietu, kai skrydis jau ivyko
DELETE FROM Ticket WHERE Flight = 'PAV650MNJ'; --leis istrinti
INSERT INTO Ticket VALUES('PAV650MNJ', 1, DEFAULT, '32.50'); --bet neleis ideti, nes skrydis jau yra ivykes
