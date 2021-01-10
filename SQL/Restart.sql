\i DropIndex.sql;
\i DropTrigger.sql;
\i DropView.sql
\i DropTable.sql;
\i CreateTable.sql;
\i CreateIndex.sql
\i CreateTrigger.sql;
\i CreateView.sql;
\timing on
\i Inserts.sql;
REFRESH MATERIALIZED VIEW CustomerInfo;
\timing off


--negalima keisti informacijos apie skrydi, kai skrydis jau ivyko
CREATE OR REPLACE FUNCTION FlightDeparted()
  RETURNS trigger AS
$$BEGIN	
	IF NEW.DepartureTime <= CURRENT_TIMESTAMP OR NEW.ArriveTime <= CURRENT_TIMESTAMP
	THEN 
		RAISE EXCEPTION 'Cannot add or update departed flight';
		RETURN NEW;
	END IF;
	RETURN NEW;
END;$$
LANGUAGE 'plpgsql';

CREATE TRIGGER FlightDeparted
	BEFORE INSERT OR UPDATE ON Flight
	FOR EACH ROW
	EXECUTE PROCEDURE FlightDeparted()
;



--negalima keisti/update skrydzio bilietu, kai skrydis jau ivyko
CREATE OR REPLACE FUNCTION FlightDepartedInsert()
  RETURNS trigger AS
$$BEGIN	
	IF (SELECT DepartureTime FROM Flight
		WHERE NEW.Flight = FlightNumber) <= CURRENT_TIMESTAMP
    THEN
		RAISE EXCEPTION 'Cannot add or update ticket on departed flight';
	END IF;
    RETURN NEW;
END;$$
LANGUAGE 'plpgsql';

CREATE TRIGGER FlightDepartedInsert
	BEFORE INSERT OR UPDATE ON Ticket
	FOR EACH ROW
	EXECUTE PROCEDURE FlightDepartedInsert()
;

