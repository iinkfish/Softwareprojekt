import java.io.*;
import java.net.*;
import java.util.Scanner;

class communication {

    public void startCom() {
        // String ip_address = "192.168.4.1";
        try {
            String ip_address = "localhost";

            Socket socket = new Socket(ip_address, 23);

            BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream())); // reading from
                                                                                                        // wifi //
                                                                                                        // module
            BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream())); // writing to
                                                                                                          // wifi module
            InputStreamReader r = new InputStreamReader(System.in); // reading from terminal
            BufferedReader br = new BufferedReader(r);

             //Scanner myInput = new Scanner(System.in);
            String output = "";

            String line = "";
            // String movement = "";

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

                // Sender
                 if (br.ready()) {
                //if (Main.movement != "") {
                    try {
                        // output = br.readLine(); // reads line from this terminal

                        // writer.write(output); // sends line to wifi module
                        //writer.write(Main.movement);
                        writer.newLine();
                        writer.flush();
                        //Main.movement = "";
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
