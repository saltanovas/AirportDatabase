SELECT * FROM Customer;
SELECT * FROM Airport;
SELECT * FROM Aircraft;
SELECT * FROM Flight;
SELECT * FROM Ticket;
SELECT * FROM Aircrew;

SELECT * FROM Ticket WHERE Flight = 'W68012';
SELECT * FROM Ticket WHERE Flight = 'TK1407';
SELECT * FROM Ticket WHERE Flight = 'BT610';
SELECT * FROM Ticket WHERE Flight = 'LO27463A';
SELECT * FROM Ticket WHERE Flight = 'B2803P42Q';
SELECT * FROM Ticket WHERE Flight = 'PAV650MNJ';
SELECT * FROM Ticket WHERE Flight = 'FR2244KL';
SELECT * FROM Ticket WHERE Flight = 'A2803G';
SELECT * FROM Ticket WHERE Flight = 'LH886';

SELECT * FROM pg_indexes WHERE schemaname = 'aisa6698';

SELECT trigger_name, event_manipulation, event_object_table, action_statement, action_orientation, action_timing
FROM information_schema.triggers
WHERE trigger_schema = 'aisa6698';

SELECT matviewname AS VIEWS FROM pg_matviews WHERE schemaname = 'aisa6698'
UNION
SELECT table_name FROM INFORMATION_SCHEMA.views WHERE table_schema = 'aisa6698';
