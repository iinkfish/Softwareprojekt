package U3.javaServ;

import java.io.*;
import java.net.*;

public class server {
    public static void main(String[] args) throws IOException {

        ServerSocket socket = new ServerSocket(25);
        Socket s = socket.accept();

        System.out.println("client connected");
        InputStreamReader in = new InputStreamReader(s.getInputStream());
        BufferedReader bf = new BufferedReader(in);

        PrintWriter pr = new PrintWriter(s.getOutputStream());
        pr.println("message1");
        pr.flush();
        pr.println("message2");
        pr.flush();
        pr.println("message3");
        pr.flush();
        pr.println("exit");
        pr.flush();

        String str = bf.readLine();
        System.out.println("client: " + str);
    }
}