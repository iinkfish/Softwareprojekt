package U3.javaServ;

import java.io.*;
import java.net.*;
import java.util.Scanner;

public class server {
    public static void main(String[] args) throws IOException {

        ServerSocket socket = new ServerSocket(23);
        // while (true) {
        Socket s = socket.accept();

        System.out.println("client connected");
        InputStreamReader in = new InputStreamReader(s.getInputStream());
        BufferedReader bf = new BufferedReader(in);
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(s.getOutputStream()));

        InputStreamReader r = new InputStreamReader(System.in);
        BufferedReader br = new BufferedReader(r);

        Scanner myInput = new Scanner(System.in);
        String output = "";
        String data = "{ \"a\": 50, \"d\": 310, \"h\": 288, \"x\": 126, \"y\": -381, \"z\": -519, \"s\": 218, \"f\": 333 }";

        PrintWriter pr = new PrintWriter(s.getOutputStream());

        // writer.write("Are you there?");
        writer.write(data);
        writer.newLine();
        writer.flush();
        while (true) {

            if (bf.ready()) {
                String str = bf.readLine();
                System.out.println("client: " + str);
            }

            if (br.ready()) {

                output = br.readLine();
                writer.write(output);
                writer.newLine();
                writer.flush();
            }

        }
    }
}