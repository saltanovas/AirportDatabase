import java.sql.Connection;

public class Main {
    public static void main(String[] args) {
        Connect.loadDriver();
        Connection connection = Connect.getConnection();

        if (connection == null) {
            System.exit(1);
        } else {
            new MyMenu(connection);
        }
    }
}
