import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.*;

public class Repository {

    private Connection connection;
    private Query query;

    public Repository(Connection connection, Query query) {
        this.connection = connection;
        this.query = query;
    }

    public List<Map<String, Object>> getAllCustomers() {
        try {
            return query.queryData(connection.prepareStatement(Statements.getAllCustomers()), new LinkedList<>());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return Collections.emptyList();
    }

    public List<Map<String, Object>> getCustomerByEmail(String email) {
        try {
            return query.queryData(connection.prepareStatement(Statements.getCustomerByEmail()), new LinkedList<>(Collections.singletonList(email)));
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return Collections.emptyList();
    }

    public int registerNewCustomer(List<Object> list) {
        try {
            return query.updateData(connection.prepareStatement(Statements.insertCustomer()), list);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public int deleteCustomerById(int customerId) {
        try {
            return query.updateData(connection.prepareStatement(Statements.deleteCustomerById()), new LinkedList<>(Collections.singletonList(customerId)));
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public int getCustomerIdByEmail(String email) {
        try {
            return Integer.parseInt(query.queryData(connection.prepareStatement(Statements.getCustomerIdByEmail()), new LinkedList<>(Collections.singletonList(email))).get(0).get("id").toString());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public List<Map<String, Object>> getCustomerTickets(int customerId) {
        try {
            return query.queryData(connection.prepareStatement(Statements.getCustomerTickets()), new LinkedList<>(Collections.singletonList(customerId)));
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return Collections.emptyList();
    }

    public List<Map<String, Object>> getFreeSeatsOnFlight(String flight) {
        try {
            return query.queryData(connection.prepareStatement(Statements.getFreeSeatsOnFlight()), new LinkedList<>(Collections.singletonList(flight)));
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return Collections.emptyList();
    }

    public List<Map<String, Object>> getAirports() {
        try {
            return query.queryData(connection.prepareStatement(Statements.getAirports()), new LinkedList<>());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return Collections.emptyList();
    }

    public List<Map<String, Object>> getFlightsByDestination(String departurePlace, String arrivePlace) {
        try {
            return query.queryData(connection.prepareStatement(Statements.searchFlightByDestination()), new LinkedList<>(Arrays.asList(departurePlace, arrivePlace)));
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return Collections.emptyList();
    }

    public List<Map<String, Object>> getFlightsByDate(Date fromDate, Date toDate) {
        try {
            return query.queryData(connection.prepareStatement(Statements.searchFlightByDate()), new LinkedList<>(Arrays.asList(fromDate, toDate)));
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return Collections.emptyList();
    }

    public List<Map<String, Object>> getFreeSeatsByDestination(String departurePlace, String arrivePlace) {
        try {
            return query.queryData(connection.prepareStatement(Statements.searchFreeTicketsByDestination()), new LinkedList<>(Arrays.asList(departurePlace, arrivePlace)));
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return Collections.emptyList();
    }

    public int cancelFlight(int customerId, String flight, int seat) {
        try {
            return query.updateData(connection.prepareStatement(Statements.cancelFlight()), new LinkedList<>(Arrays.asList(customerId, flight, seat)));
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public boolean changeSeat(int customerId, String flight, int newSeat, int oldSeat) {
        try {
            connection.setAutoCommit(false);
            query.updateData(connection.prepareStatement(Statements.cancelFlight()), new LinkedList<>(Arrays.asList(customerId, flight, oldSeat)));
            if (query.updateData(connection.prepareStatement(Statements.buyTicket()), new LinkedList<>(Arrays.asList(customerId, flight, newSeat))) == 0) {
                connection.rollback();
            } else {
                connection.commit();
                connection.setAutoCommit(true);
                return true;
            }
        } catch (SQLException e) {
            try {
                connection.rollback();
                connection.setAutoCommit(true);
            } catch (SQLException ignored) {

            }
        }
        return false;
    }

    public int buyTicket(int customerId, String flight, int seat) {
        try {
            return query.updateData(connection.prepareStatement(Statements.buyTicket()), new LinkedList<>(Arrays.asList(customerId, flight, seat)));
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
}
