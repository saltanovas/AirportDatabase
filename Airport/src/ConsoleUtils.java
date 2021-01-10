import java.util.Scanner;

/*
 * ConsoleUtils exposes a few useful methods which can be used across a broad range of console apps.
 */
public final class ConsoleUtils {
    /*
     * This method will force execution to stop and wait until the user presses enter. It prompts the
     * user to press enter to continue. It is irrelevant if the user types any text, execution will
     * continue after 'Enter'.
     */
    public static void pauseExecution() {
        System.out.print("Press Enter to Continue... ");
        new Scanner(System.in).nextLine();
    }

    /*
     * This method can be used if a particular operation requires confirmation, it is ussful for delete
     * or irreversible operations. It forces that the uses explicitly enters "y/yes" or "n/no", any
     * other input will fail and the confirmation request will be presented again.
     */
    public static boolean requestConfirmation() {
        while (true) {
            System.out.print("Confirm Operation (y/n)... ");
            String in = new Scanner(System.in).nextLine().toLowerCase();
            if (in.equals("y") || in.equals("yes"))
                return true;
            else if (in.equals("n") || in.equals("no"))
                return false;
        }
    }
}