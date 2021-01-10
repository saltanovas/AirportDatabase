CREATE VIEW FlightAircrew AS
    SELECT Flight.*,
           STRING_AGG(FirstName || ' ' || LastName || '(' || Position || ')', ', ') AS Aircrew
    FROM Flight
    LEFT JOIN Aircrew
    ON FlightNumber = Aircrew.Flight
    GROUP BY FlightNumber
;

CREATE VIEW TicketInfo AS
    SELECT FlightNumber      AS Flight_Number, 
           SeatsNumber       AS Tickets_In_Total, 
           COUNT(T.*)        AS Tickets_On_Sale,
           COUNT(T.Customer) AS Bought,
           COUNT(T.*) - COUNT(T.Customer) AS Not_Sold
    FROM Flight F
    LEFT JOIN Ticket T
    ON F.FlightNumber = T.Flight
    JOIN Aircraft A
    ON F.Aircraft = A.AircraftCode
    GROUP BY F.FlightNumber, A.SeatsNumber
;

--kiek per paskutitnius tris menesius sumokejo kiekvienas klientas (REFRESH KIEKVIENO MENESIO PIRMA DIENA)
CREATE MATERIALIZED VIEW CustomerInfo AS
    SELECT Customer.Id, Customer.FirstName, Customer.LastName,
           COUNT(Flight) AS Bought_Tickets, 
           SUM(Price)    AS Spent_In_Last_Three_Months 
    FROM Customer, Ticket
    WHERE Customer.Id = Customer
    AND Price 
    BETWEEN date_trunc('MONTH', CURRENT_TIMESTAMP - INTERVAL '3 MONTH')) 
    AND CURRENT_TIMESTAMP - (date_part('DAY', CURRENT_TIMESTAMP) * INTERVAL '1 DAY')
    GROUP BY Customer.Id
WITH DATA
;
