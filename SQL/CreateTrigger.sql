--autoincrement id
CREATE OR REPLACE FUNCTION CreateCustomerId()
  RETURNS trigger AS
$$BEGIN
	IF NEW.Id IS NULL THEN
		NEW.Id = (SELECT COALESCE(MAX(Id),0)+1 FROM Customer);
	END IF;
	RETURN NEW;
END;$$
LANGUAGE 'plpgsql';

CREATE TRIGGER CreateCustomerId
    BEFORE INSERT ON Customer
    FOR EACH ROW
    EXECUTE PROCEDURE CreateCustomerId()
;

--------------------------------------------------------------------------------

--autoincrement id
CREATE OR REPLACE FUNCTION CreateAircrewId()
  RETURNS trigger AS
$$BEGIN
	IF NEW.Id IS NULL THEN
    	NEW.Id = (SELECT COALESCE(MAX(Id),0)+1 FROM Aircrew);
    END IF;
    RETURN NEW;
END;$$
LANGUAGE 'plpgsql';

CREATE TRIGGER CreateAircrewId
    BEFORE INSERT ON Aircrew
    FOR EACH ROW
    EXECUTE PROCEDURE CreateAircrewId()
;

--------------------------------------------------------------------------------

--negalima update airport, tik delete
CREATE OR REPLACE FUNCTION UpdateAirport()
  RETURNS trigger AS
$$BEGIN
    RAISE EXCEPTION 'Information about airport cannot be changed! Please create a new airport and delete the old one';
    RETURN NEW;
END;$$
LANGUAGE 'plpgsql';

CREATE TRIGGER UpdateAirport
    BEFORE UPDATE ON Airport
    FOR EACH ROW
    EXECUTE PROCEDURE UpdateAirport()
;

--------------------------------------------------------------------------------

--negalima tureti daugiau bilietu nei lektuvas turi sedimu vietu
CREATE OR REPLACE FUNCTION MaxSeats()
  RETURNS trigger AS
$$BEGIN
	IF (SELECT COUNT(*) FROM Ticket
		WHERE Flight = New.Flight) >= (SELECT SeatsNumber FROM Flight, Aircraft 
									   WHERE Flight.FlightNumber = NEW.Flight AND Flight.Aircraft = Aircraft.AircraftCode)
	THEN RAISE EXCEPTION 'Cannot add any more tickets';
	END IF;
    RETURN NEW;
END;$$
LANGUAGE 'plpgsql';

CREATE TRIGGER MaxSeats
	BEFORE INSERT ON Ticket
	FOR EACH ROW
	EXECUTE PROCEDURE MaxSeats()
;

--------------------------------------------------------------------------------

--default reiksmes passengerfirstname/passengerlastname, jeigu jos nera nurodomos. 
--negalima nenuorodyti customerid, jei dedamas passengerfirstname/passengerlastname
CREATE OR REPLACE FUNCTION AddDefault()
  RETURNS trigger AS
$$BEGIN	
	IF NEW.PassengerFirstName IS NULL AND NEW.PassengerLastName IS NULL AND NEW.Customer IS NOT NULL THEN 
		NEW.PassengerFirstName = (SELECT FirstName FROM Customer WHERE NEW.Customer = Customer.Id);
		NEW.PassengerLastName  = (SELECT LastName  FROM Customer WHERE NEW.Customer = Customer.Id);
		RETURN NEW;
	END IF;
	
	--leidziama istrinti bilieto pirkima nunulinus tik customer
	--taciau vistiek negalima pirkti bilieto nenurodzius customer id
	IF NEW.Customer IS NULL AND (NEW.PassengerFirstName IS NOT NULL OR NEW.PassengerLastName IS NOT NULL) 
	THEN
		IF OLD.PassengerFirstName IS NULL AND OLD.PassengerLastName IS NULL 
			THEN
				RAISE EXCEPTION 'Please add customer id as well';
			ELSE
				NEW.PassengerFirstName = NULL;
				NEW.PassengerLastName = NULL;
				NEW.PurchaseTime = NULL;
		RETURN NEW;
		END IF;
	RETURN NEW;
	END IF;
	
	IF NEW.PassengerFirstName IS NULL AND NEW.PassengerLastName IS NOT NULL THEN
		RAISE EXCEPTION 'Please add first name as well';
		RETURN NEW;
	END IF;
	
	IF NEW.PassengerFirstName IS NOT NULL AND NEW.PassengerLastName IS NULL THEN
		RAISE EXCEPTION 'Please add last name as well';
		RETURN NEW;
	END IF;

    RETURN NEW;
END;$$
LANGUAGE 'plpgsql';

CREATE TRIGGER AddDefault
	BEFORE UPDATE ON Ticket
	FOR EACH ROW
	EXECUTE PROCEDURE AddDefault()
;

--------------------------------------------------------------------------------

--galimas pirkimo atsaukimas pakeiciant customer id i null
CREATE OR REPLACE FUNCTION CancelPurchaseByCustomerId()
  RETURNS trigger AS
$$BEGIN
	IF NEW.Customer IS NULL THEN
		NEW.PassengerFirstName = NULL;
		NEW.PassengerLastName = NULL;
		NEW.PurchaseTime = NULL;
	ELSE RETURN NEW;
	END IF;
	RETURN NEW;
END;$$
LANGUAGE 'plpgsql';


CREATE TRIGGER CancelPurchaseByCustomerId
	BEFORE UPDATE ON Ticket
	FOR EACH ROW
	EXECUTE PROCEDURE CancelPurchaseByCustomerId()
;

--------------------------------------------------------------------------------

--passengername/pasengerlastname negali buti tame paciame skrydyje!! BET PATS CUSTOMER GALI
CREATE OR REPLACE FUNCTION SamePassenger()
  RETURNS trigger AS
$$BEGIN
	IF EXISTS (SELECT * FROM Ticket
		WHERE Flight = New.Flight
		AND   Customer = NEW.Customer
		AND   PassengerFirstName = NEW.PassengerFirstName
		AND   PassengerLastName = NEW.PassengerLastName)
	THEN RAISE EXCEPTION 'Trying to add the same passenger';
	END IF;
	
	IF OLD.Customer IS NOT NULL AND (OLD.Customer <> NEW.Customer)
	THEN 
		RAISE EXCEPTION 'Cannot buy already bought ticket';
	END IF;
	
    RETURN NEW;
END;$$
LANGUAGE 'plpgsql';

CREATE TRIGGER SamePassenger
	BEFORE UPDATE ON Ticket
	FOR EACH ROW
	EXECUTE PROCEDURE SamePassenger()
;

--------------------------------------------------------------------------------

--negalima pirkti bilieto likus 6 valandoms iki skrydzio ir veliau
--negalima nenurodant customer ideti purchasetime
--ideda default purchasetime jeigu jis nera nurodomas, bet tuo paciu turi buti nurodytas customer
CREATE OR REPLACE FUNCTION CheckPurchaseTime()
  RETURNS trigger AS
$$BEGIN
	IF NEW.Customer IS NULL AND NEW.PurchaseTime IS NOT NULL THEN
		RAISE EXCEPTION 'Cannot add PurchaseTime without customer';
		RETURN NEW;
	END IF;

	IF NEW.Customer IS NOT NULL AND NEW.PurchaseTime IS NULL THEN 
		NEW.PurchaseTime = CURRENT_TIMESTAMP;
	END IF;

	IF ((SELECT DepartureTime FROM Flight 
		WHERE New.Flight = FlightNumber) - INTERVAL '6 HOUR') <= NEW.PurchaseTime
	THEN RAISE EXCEPTION 'Cannot buy the ticket six hours before the flight';
	END IF;
    RETURN NEW;
END;$$
LANGUAGE 'plpgsql';

CREATE TRIGGER CheckPurchaseTime
	BEFORE UPDATE ON Ticket
	FOR EACH ROW
	EXECUTE PROCEDURE CheckPurchaseTime()
;

--------------------------------------------------------------------------------

--bilieta galima pirkti tik tuomet, kai jis yra duomenu bazeje. 
--t.y. negalima ideti iskart jau nupirkto bilieto 
CREATE OR REPLACE FUNCTION AddTicketWitoutPurchase()
  RETURNS trigger AS
$$BEGIN
	IF  NEW.CUSTOMER IS NOT NULL OR
		NEW.PassengerFirstNAme IS NOT NULL OR
		NEW.PassengerLastName IS NOT NULL OR
		NEW.PurchaseTime IS NOT NULL
	THEN
		RAISE EXCEPTION 'Cannot add already purchased ticket. Please add ticket separetely';
	END IF;

    RETURN NEW;
END;$$
LANGUAGE 'plpgsql';

CREATE TRIGGER AddTicketWitoutPurchase
	BEFORE INSERT ON Ticket
	FOR EACH ROW
	EXECUTE PROCEDURE AddTicketWitoutPurchase()
;

--------------------------------------------------------------------------------

--negalima pirkti nupirkto bilieto
--t.y.negalima keisti customer id, turime istrinti ir tik tada priskirti nauja

--------------------------------------------------------------------------------

-- kad galeciau ideti pradinius duomenis, abu triggeriai sukuriami po insert'u
-- --negalima keisti informacijos apie skrydi, kai skrydis jau ivyko
-- CREATE OR REPLACE FUNCTION FlightDeparted()
--   RETURNS trigger AS
-- $$BEGIN	
-- 	IF (SELECT DepartureTime FROM Flight 
-- 		WHERE NEW.FlightNumber = FlightNumber) <= CURRENT_TIMESTAMP
-- 	THEN 
-- 		RAISE EXCEPTION 'Cannot update departed flight';
-- 	END IF;
-- END;$$
-- LANGUAGE 'plpgsql';

-- CREATE TRIGGER FlightDeparted
-- 	BEFORE UPDATE ON Flight
-- 	FOR EACH ROW
-- 	EXECUTE PROCEDURE FlightDeparted()
-- ;

--------------------------------------------------------------------------------

-- --negalima insert, update skrydzio bilietu, kai skrydis jau ivyko
-- CREATE OR REPLACE FUNCTION FlightDepartedInsert()
--   RETURNS trigger AS
-- $$BEGIN	
-- 	IF (SELECT DepartureTime FROM Flight 
-- 		WHERE NEW.Flight = FlightNumber) <= CURRENT_TIMESTAMP
--	THEN
-- 		RAISE EXCEPTION 'Cannot add or update ticket on departed flight';
-- 	END IF;
--     RETURN NEW;
-- END;$$
-- LANGUAGE 'plpgsql';

-- CREATE TRIGGER FlightDepartedInsert
-- 	BEFORE INSERT OR UPDATE ON Ticket
-- 	FOR EACH ROW
-- 	EXECUTE PROCEDURE FlightDepartedInsert()
-- ;

--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION RefreshMVT()
  RETURNS trigger AS
$$BEGIN	
	IF date_part('DAY', CURRENT_TIMESTAMP) = 1 --refresh vyks kiekvieno menesio pirma diena, bet vyks daug kartu ta diena
	THEN REFRESH MATERIALIZED VIEW TicketInfo;
	END IF;
    RETURN NULL;
END;$$
LANGUAGE 'plpgsql';

CREATE TRIGGER RefreshCustomer
	AFTER INSERT OR UPDATE OR DELETE ON Customer
	FOR EACH ROW
	EXECUTE PROCEDURE RefreshMVT()
;
CREATE TRIGGER RefreshTicket
	AFTER INSERT OR UPDATE OR DELETE ON Ticket
	FOR EACH ROW
	EXECUTE PROCEDURE RefreshMVT()
;
