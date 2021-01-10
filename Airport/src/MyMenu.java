import java.sql.Connection;

public class MyMenu {

    private MenuController menuController;
    Repository repo;
    public MyMenu(Connection connection){
    this.menuController = new MenuController(this, new Repository(connection, new Query()));
        authMenu();
    }

    public void authMenu(){
        Menu menu = new Menu();
        menu.setTitle("*** Menu ***");
        menu.addItem(new MenuItem("Prisijungimas", menuController, "login"));
        menu.addItem(new MenuItem("Registracija", menuController, "register"));
        menu.execute();
    }

    public void dashboardMenu(){
        Menu menu = new Menu();
        menu.setTitle("*** Pagrindinis ***");
        menu.addItem(new MenuItem("Skrydziu paieska", this, "searchMenu"));
        menu.addItem(new MenuItem("Jusu uzsakymai", menuController, "showOrders"));
        menu.addItem(new MenuItem("Paskyros salinimas", menuController, "deleteCustomer"));
        menu.execute();
    }

    public void searchMenu(){
        Menu menu = new Menu();
        menu.setTitle("*** Skrydziu paieska ***");
        menu.addItem(new MenuItem("Ieskoti skrydzio pagal data", menuController, "searchFlightByDate"));
        menu.addItem(new MenuItem("Ieskoti skrydzio pagal marsruta", menuController, "searchFlightByDestination"));
        menu.execute();
    }

    public void ordersMenu(){
        Menu menu = new Menu();
        menu.setTitle("*** Mano Uzsakymai ***");
        menu.addItem(new MenuItem("Keisti sedima vieta", menuController, "changeSeat"));
        menu.addItem(new MenuItem("Atsaukti pirkima", menuController, "cancelFlight"));
        menu.execute();
    }

    public void buyMenu(){
        Menu menu = new Menu();
        menu.setTitle("*** Bilietu Pirkimas ***");
        menu.addItem(new MenuItem("Pirkti bilieta", menuController, "buyTicket"));
        menu.execute();
    }
}
