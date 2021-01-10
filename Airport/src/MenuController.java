import java.time.LocalDate;
import java.util.*;
import java.sql.Date;

public class MenuController {

    private Scanner in = new Scanner(System.in);
    private int identity;
    private MyMenu menu;
    private Repository repo;

    public MenuController(MyMenu menu, Repository repo) {
        this.menu = menu;
        this.repo = repo;
    }

    public void login() {
        printTable(repo.getAllCustomers());
        System.out.print("Iveskite elektronini pasta: ");
        var customer = repo.getCustomerByEmail(in.nextLine());

        if (customer.isEmpty()) {
            System.out.println("Elektroninis pastas nesutampa");
            ConsoleUtils.pauseExecution();
        } else {
            identity = Integer.parseInt(customer.get(0).get("id").toString());
            System.out.println("Sekmingas prisijungimas");
            ConsoleUtils.pauseExecution();
            menu.dashboardMenu();
        }
    }

    public void register() {
        List<Object> list = new LinkedList<>();
        System.out.print("\n\nIveskite varda: ");
        list.add(in.nextLine());
        System.out.print("\nIveskite pavarde: ");
        list.add(in.nextLine());
        System.out.print("\nIveskite pasta: ");
        String email = in.nextLine();
        list.add(email);
        System.out.print("\nIveskite telefono numeri: ");
        list.add(in.nextLine());
        System.out.print("\nIveskite gatve: ");
        list.add(in.nextLine());
        System.out.print("\nIveskite miesta: ");
        list.add(in.nextLine());
        System.out.print("\nIveskite sali: ");
        list.add(in.nextLine());
        System.out.print("\nIveskite pasto koda: ");
        list.add(in.nextLine());
        System.out.print("\nIveskite korteles numeri: ");
        list.add(in.nextLine());
        System.out.print("\nIveskite korteles galiojimo laika: ");

        Date expiryDate;
        try {
            expiryDate = Date.valueOf(in.nextLine());
        } catch (IllegalArgumentException e) {
            System.out.println("Neteisingai ivesta data");
            return;
        }

        if (expiryDate.compareTo(Date.valueOf(LocalDate.now())) < 0) {
            System.out.println("Kortele turi buti galiojanti");
            return;
        }
        list.add(expiryDate);

        int rows = repo.registerNewCustomer(list);
        if (rows == 0) {
            ConsoleUtils.pauseExecution();
        } else {
            identity = repo.getCustomerIdByEmail(email);
            System.out.println("Registracija sekminga");
            ConsoleUtils.pauseExecution();
            menu.dashboardMenu();
        }
    }

    public void deleteCustomer() {
        if (ConsoleUtils.requestConfirmation()) {
            if (repo.deleteCustomerById(identity) != 0) {
                identity = 0;
                System.out.println("Jusu paskyra sekmingai pasalinta");
                // TODO: need to go back in the menu
            }
        } else {
            System.out.println("Paskyros salinimas atsauktas!");
        }
        ConsoleUtils.pauseExecution();
    }

    public void showOrders() {
        var orders = repo.getCustomerTickets(identity);

        if (orders.isEmpty()) {
            System.out.println("Nesate nusipirke jokio bilieto!");
            ConsoleUtils.pauseExecution();
        } else {
            printTable(orders);
            menu.ordersMenu();
        }
    }

    public void cancelFlight() {
        System.out.print("Iveskite skrydzio koda: ");
        String flight = in.nextLine();

        if (repo.getCustomerTickets(identity).stream().noneMatch(map -> map.containsValue(flight))) {
            System.out.println("Siam skrydziui bilietu neturite");
            ConsoleUtils.pauseExecution();
            return;
        }

        int seat;
        try {
            System.out.print("Iveskite sedimos vietos numeri: ");
            seat = Integer.parseInt(in.nextLine());
        } catch (NumberFormatException e) {
            System.out.println("Neteisingai ivestas skaicius");
            return;
        }

        if (repo.cancelFlight(identity, flight, seat) == 0) {
            System.out.println("Uzsakymu nerasta");
        } else {
            System.out.println("Skrydis sekmingai atsauktas");
        }
        ConsoleUtils.pauseExecution();
        //TODO: need to go back in the menu
    }

    public void changeSeat() {
        System.out.print("Iveskite skrydzio koda: ");
        String flight = in.nextLine();

        if (repo.getCustomerTickets(identity).stream().noneMatch(map -> map.containsValue(flight))) {
            System.out.println("Siam skrydziui bilietu neturite");
            ConsoleUtils.pauseExecution();
            return;
        }

        var freeSeats = repo.getFreeSeatsOnFlight(flight);
        if (freeSeats.isEmpty()) {
            System.out.println("Laisvu vietu skrydyje nerasta");
            ConsoleUtils.pauseExecution();
            return;
        }

        int oldSeat, newSeat;
        try {
            System.out.print("Iveskite keiciamos vietos numeri: ");
            oldSeat = Integer.parseInt(in.nextLine());
            printTable(freeSeats);
            System.out.print("Iveskite naujos vietos numeri: ");
            newSeat = Integer.parseInt(in.nextLine());
        } catch (NumberFormatException e) {
            System.out.println("Bloga ivestis");
            ConsoleUtils.pauseExecution();
            return;
        }

        if (repo.changeSeat(identity, flight, newSeat, oldSeat)) {
            System.out.println("Skrydzio vieta sekmingai pakeista");
        } else {
            System.out.println("Skrydzio vieta nepakeista");
        }
        ConsoleUtils.pauseExecution();
        //TODO: need to go back in the menu
    }

    public void searchFlightByDate() {
        Date fromDate, toDate;
        try {
            System.out.print("Iveskite pradzios data: ");
            fromDate = Date.valueOf(in.nextLine());

            if (fromDate.compareTo(Date.valueOf(LocalDate.now())) < 0) {
                System.out.println("Negalima ivesti praaejusios datos");
                return;
            }

            System.out.print("Iveskite pabaigos data: ");
            toDate = Date.valueOf(in.nextLine());
        } catch (IllegalArgumentException e) {
            System.out.println("Neteisingai ivesta data");
            ConsoleUtils.pauseExecution();
            return;
        }

        if (fromDate.compareTo(toDate) >= 0) {
            System.out.println("Antroji data turi buti didesne uz pirmaja");
            ConsoleUtils.pauseExecution();
            return;
        }

        var flights = repo.getFlightsByDate(fromDate, toDate);
        if (flights.isEmpty()) {
            System.out.println("Skrydziu nerasta");
            ConsoleUtils.pauseExecution();
        } else {
            printTable(flights);
            menu.buyMenu();
        }
    }

    public void searchFlightByDestination() {
        printTable(repo.getAirports());

        System.out.print("Iveskite isvykimo vieta (oro uosto koda): ");
        String departurePlace = in.nextLine();
        System.out.print("Iveskite atvykimo vieta (oro uosto koda): ");
        String arrivePlace = in.nextLine();

        var flights = repo.getFlightsByDestination(departurePlace, arrivePlace);
        if (flights.isEmpty()) {
            System.out.println("Skrydziu is " + departurePlace + " i " + arrivePlace + " nerasta");
            ConsoleUtils.pauseExecution();
        } else {
            printTable(flights);
            menu.buyMenu();
        }
    }

    public void buyTicket() {
        System.out.print("Iveskite isvykimo vieta (oro uosto koda): ");
        String departurePlace = in.nextLine();
        System.out.print("Iveskite atvykimo vieta (oro uosto koda): ");
        String arrivePlace = in.nextLine();

        var freeSeats = repo.getFreeSeatsByDestination(departurePlace, arrivePlace);
        if (freeSeats.isEmpty()) {
            System.out.println("Aktyviu skrydziu bilietu is " + departurePlace + " i " + arrivePlace + " nerasta");
            ConsoleUtils.pauseExecution();
            return;
        }

        printTable(freeSeats);
        int seat;

        System.out.print("Iveskite skrydzio numeri, kuriuo norite skristi: ");
        String flightNumber = in.nextLine();
        try{
            System.out.print("Iveskite sedima vieta: ");
            seat = Integer.parseInt(in.nextLine());
        } catch (NumberFormatException e) {
            System.out.println("Neteisinga ivestis");
            ConsoleUtils.pauseExecution();
            return;
        }

        if (repo.buyTicket(identity, flightNumber, seat) == 0) {
            System.out.println("Blogai ivesti duomenys");
        } else {
            System.out.println("Bilietas sekmingai nupirktas");
        }
        ConsoleUtils.pauseExecution();
        //TODO: need to go back in the menu
    }

    public void printTable(List<Map<String, Object>> list) {
        List<String> columnNames = new ArrayList<>(list.get(0).keySet());

        System.out.println("\n");
        for (String columnName : columnNames) {
            System.out.format("%30s", columnName);
        }

        for (Map<String, Object> map : list) {
            System.out.println();
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                System.out.format("%30s", entry.getValue());
            }
        }
        System.out.println("\n");
    }
}
