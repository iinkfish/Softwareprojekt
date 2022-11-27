package U3.javaServ;

import java.io.*;
import java.net.*;

public class client {
    public static void main(String[] args) throws IOException {
        // String ip_address = "192.168.4.1";
        String ip_address = "localhost";

        Socket socket = new Socket(ip_address, 25);
        BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
        PrintWriter pr = new PrintWriter(socket.getOutputStream());

        String line = "";
        boolean isFound = true;
        // Receiver:
        while (isFound) {
            try {
                line = reader.readLine();
                System.out.println("server: " + line);
                // System.out.println(line);
                isFound = line.indexOf("exit") != -1 ? false : true;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // System.out.println("exit of while loop");

        // Sender
        try {
            // pr.println("String received");
            // pr.flush();
            String output = "String received";
            writer.write(output);
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
