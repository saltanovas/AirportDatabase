public final class Statements {

    private Statements() {
        /*
        Prevents instantiation
         */
    }

    public static String getAllCustomers() {
        return "SELECT Email     AS \"Pastas\", " +
                "      FirstName AS \"Vardas\", " +
                "      LastName  AS \"Pavarde\" " +
                "FROM Customer " +
                "ORDER BY 2, 3";
    }

    public static String getCustomerByEmail() {
        return "SELECT * FROM Customer WHERE Email=?";
    }

    public static String insertCustomer() {
        return "INSERT INTO Customer VALUES(NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    }

    public static String deleteCustomerById() {
        return "DELETE FROM Customer WHERE Id=?";
    }

    public static String getCustomerIdByEmail() {
        return "SELECT Id FROM Customer WHERE Email=?";
    }

    public static String getCustomerTickets() {
        return "SELECT Flight         AS \"Skrydzio numeris\", " +
                "      DeparturePlace AS \"Isvykimo vieta\", " +
                "      ArrivePlace    AS \"Atvykimo vieta\", " +
                "      DepartureTime  AS \"Isvykimo laikas\", " +
                "      ArriveTime     AS \"Atvykimo laikas\", " +
                "      Seat           AS \"Vieta\", " +
                "      SeatClass      AS \"Klase\" " +
                "FROM Ticket, Flight " +
                "WHERE Ticket.Flight = Flight.FlightNumber " +
                "AND Ticket.Customer = ? " +
                "ORDER BY DepartureTime, Seat";
    }

    public static String getFreeSeatsOnFlight() {
        return "SELECT Seat        AS \"Vieta\", " +
                "      Price       AS \"Kaina\", " +
                "      SeatClass   AS \"Klase\" " +
                "FROM Ticket " +
                "WHERE Customer IS NULL " +
                "AND Flight = ? " +
                "ORDER BY Seat";
    }

    public static String buyTicket() {
        return "UPDATE ticket SET Customer = ? WHERE Flight = ? AND Seat = ? AND Customer IS NULL";
    }

    public static String cancelFlight() {
        return "UPDATE Ticket SET Customer = NULL WHERE Customer = ? AND Flight = ? AND Seat = ?";
    }

    public static String searchFlightByDate() {
        return "SELECT FlightNumber   AS \"Skrydzio numeris\", " +
                "      DeparturePlace AS \"Isvykimo vieta\", " +
                "      DepartureTime  AS \"Isvykimo laikas\", " +
                "      ArrivePlace    AS \"Atvykimo vieta\", " +
                "      ArriveTime     AS \"Atvykimo laikas\" " +
                "FROM Flight " +
                "WHERE DepartureTime > (CURRENT_TIMESTAMP - INTERVAL '6 HOURS') " +
                "AND DepartureTime BETWEEN ? AND ? " +
                "ORDER BY DepartureTime, FlightNumber";
    }

    public static String getAirports() {
        return "SELECT AirportCode AS \"Kodas\", " +
                "      Name        AS \"Pavadinimas\", " +
                "      Country     AS \"Salis\" " +
                "From Airport " +
                "ORDER BY AirportCode";
    }

    public static String searchFlightByDestination() {
        return "SELECT FlightNumber   AS \"Skrydzio numeris\", " +
                "      DeparturePlace AS \"Isvykimo vieta\", " +
                "      DepartureTime  AS \"Isvykimo laikas\", " +
                "      ArrivePlace    AS \"Atvykimo vieta\", " +
                "      ArriveTime     AS \"Atvykimo laikas\" " +
                "FROM Flight " +
                "WHERE DepartureTime > (CURRENT_TIMESTAMP - INTERVAL '6 HOURS') " +
                "AND DeparturePlace = ? " +
                "AND ArrivePlace = ? " +
                "ORDER BY DepartureTime, FlightNumber";
    }

    public static String searchFreeTicketsByDestination() {
        return "SELECT Ticket.Flight  AS \"Skrydzio numeris\", " +
                "      Seat           AS \"Vieta\", " +
                "      SeatClass      AS \"Klase\", " +
                "      Price          AS \"Kaina\" " +
                "FROM Flight, Ticket " +
                "WHERE Ticket.Flight = Flight.FlightNumber " +
                "AND Ticket.Customer IS NULL " +
                "AND Flight.DeparturePlace = ? " +
                "AND Flight.ArrivePlace = ? " +
                "AND DepartureTime > (CURRENT_TIMESTAMP - INTERVAL '6 HOURS') " +
                "ORDER BY Seat";
    }
}
