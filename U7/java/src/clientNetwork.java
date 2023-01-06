
import java.io.*;
import java.net.*;
import java.util.Scanner;

public class clientNetwork {
    public static void main(String[] args) throws IOException {
        // String ip_address = "192.168.4.1";
        String ip_address = "localhost";
        // while (true) {
        Socket socket = new Socket(ip_address, 23);

        BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream())); // reading from wifi
                                                                                                    // module
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream())); // writing to wifi
                                                                                                      // module
        // PrintWriter pr = new PrintWriter(socket.getOutputStream());
        InputStreamReader r = new InputStreamReader(System.in); // reading from terminal
        BufferedReader br = new BufferedReader(r);

        // Scanner myInput = new Scanner(System.in);
        String output = "";

        String line = "";
        while (true) {
            boolean isFound = true;
            // Receiver:
            if (reader.ready()) {
                try {
                    line = reader.readLine(); // reads line from wifi module
                    System.out.println("server: " + line);
                    // System.out.println(line);
                    // isFound = line.indexOf("exit") != -1 ? false : true;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            // System.out.println("exit of while loop");

            // Sender
            if (br.ready()) {
                try {
                    // pr.println("String received");
                    // pr.flush();
                    // System.out.println("Your Input pls");
                    output = br.readLine(); // reads line from this terminal
                    // output = myInput.nextLine();
                    writer.write(output); // sends line to wifi module
                    writer.newLine();
                    writer.flush();
                    // writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
