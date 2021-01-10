import java.sql.*;

public final class Connect {

    private static final String dbUrl = "";
    private static final String dbUsername = "";
    private static final String dbPassword = "";
    private static final String driverName = "org.postgresql.Driver";
    private static Connection postGresConn;

    private Connect() {
        /*
        Prevents instantiation
         */
    }

    public static void loadDriver() {
        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            System.out.println("Couldn't find driver class!");
            System.exit(1);
        }
    }

    public static Connection getConnection() {
        try {
            postGresConn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        } catch (SQLException sqle) {
            System.out.println("Couldn't connect to database!");
            return null;
        }
        System.out.println("Successfully connected to Postgres Database");

        return postGresConn;
    }

    public static void closeConnection() {
        try {
            postGresConn.close();
        } catch (SQLException e) {
            System.out.println("Error while closing connection to database");
        }
    }
}
