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
        String data[] = {
                "{ \"a\": 0, \"d\": 92, \"h\": 227, \"x\": -1607, \"y\": -1694, \"z\": -4096, \"s\": 60, \"f\": 8191,  \"FE\": 387}",
                "cookies, nom",
                "{ \"a\": 10, \"d\": 92, \"h\": 227, \"x\": -1609, \"y\": -1694, \"z\": -4096, \"s\": 60, \"f\": 8191,  \"FE\": 387 }",
                "{ \"a\": 20, \"d\": 100, \"h\": 227, \"x\": -1609, \"y\": -1694, \"z\": -4096, \"s\": 66, \"f\": 8191,  \"FE\": 387 }",
                "{ \"a\": 30, \"d\": 350, \"h\": 227, \"x\": -1609, \"y\": -1694, \"z\": -4096, \"s\": 66, \"f\": 8191,  \"FE\": 387 }",
                "more, nom",
                "{ \"a\": 40, \"d\": 350, \"h\": 227, \"x\": -1607, \"y\": -1675, \"z\": -4096, \"s\": 66, \"f\": 8191,  \"FE\": 387 }",
                "{ \"a\": 50, \"d\": 357, \"h\": 227, \"x\": -1607, \"y\": -1675, \"z\": -4096, \"s\": 61, \"f\": 8191,  \"FE\": 387 }",
                "{ \"a\": 60, \"d\": 835, \"h\": 227, \"x\": -1607, \"y\": -1675, \"z\": -4096, \"s\": 61, \"f\": 8191,  \"FE\": 387 }",
                "{ \"a\": 70, \"d\": 745, \"h\": 226, \"x\": -1606, \"y\": -1659, \"z\": -4096, \"s\": 61, \"f\": 8191,  \"FE\": 387 }",
                "{ \"a\": 80, \"d\": 750, \"h\": 226, \"x\": -1606, \"y\": -1659, \"z\": -4096, \"s\": 61, \"f\": 8191,  \"FE\": 387 }",
                "{ \"a\": 90, \"d\": 910, \"h\": 226, \"x\": -1606, \"y\": -1659, \"z\": -4096, \"s\": 61, \"f\": 8191,  \"FE\": 387 }",
                "{ \"a\": 200, \"d\": 915, \"h\": 226, \"x\": -1605, \"y\": -1661, \"z\": -4096, \"s\": 61, \"f\": 8191,  \"FE\": 387 }",
                "{ \"a\": 210, \"d\": 1482, \"h\": 226, \"x\": -1605, \"y\": -1661, \"z\":-4096, \"s\": 63, \"f\": 8191,  \"FE\": 387 }",
                "{ \"a\": 220, \"d\": 0, \"h\": 226, \"x\": -1609, \"y\": -1715, \"z\":-4096, \"s\": 63, \"f\": 8191,  \"FE\": 387 }",
                "{ \"a\": 230, \"d\": 0, \"h\": 227, \"x\": -1609, \"y\": -1715, \"z\":-4096, \"s\": 63, \"f\": 8191,  \"FE\": 387 }",
                "{ \"a\": 240, \"d\": 0, \"h\": 227, \"x\": -1609, \"y\": -1715, \"z\":-4096, \"s\": 63, \"f\": 8191,  \"FE\": 387 }",
                // "{ \"a\": 250, \"d\": 452, \"h\": 227, \"x\": -1609, \"y\": -1715, \"z\":
                // -4096, \"s\": 63, \"f\": 8191 }",
                // "{ \"a\": 260, \"d\": 440, \"h\": 226, \"x\": -1605, \"y\": -1653, \"z\":
                // -4096, \"s\": 63, \"f\": 8191 }",
                // "{ \"a\": 270, \"d\": 440, \"h\": 226, \"x\": -1605, \"y\": -1653, \"z\":
                // -4096, \"s\": 66, \"f\": 8191 }",
                // "{ \"a\": 280, \"d\": 447, \"h\": 226, \"x\": -1605, \"y\": -1653, \"z\":
                // -4096, \"s\": 66, \"f\": 8191 }"
        };

        PrintWriter pr = new PrintWriter(s.getOutputStream());

        // writer.write("Are you there?");
        for (int i = 0; i < data.length; i++) {
            System.out.println(data[i]);
            writer.write(data[i]);
            writer.newLine();
            writer.flush();
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

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