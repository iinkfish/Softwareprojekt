import java.io.*;
import java.net.*;
import java.util.Scanner;

class communication {
  Socket socket; 
  BufferedReader reader;
  BufferedWriter writer;
  String ip_address; 
  
    public Socket initSocket(String ip_address, int port)throws IOException{
        Socket socket = new Socket(ip_address, port);
        println("Socket ready");
        return socket;
    }
    
    public BufferedReader startReader(Socket socket) throws IOException{
        BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream())); // reading from
        println("Reader init");
        return reader;
    }
    
    public BufferedWriter startWriter(Socket socket) throws IOException{
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
        println("Writer init");
        return writer;
    }

    public String receiveMsg(BufferedReader reader){
        String line = null;
         try {
          if (reader.ready()) {
            //try {
                line = reader.readLine(); // reads line from wifi module
                //System.out.println("server: " + line);
                }    
             } catch (Exception e) {
                //e.printStackTrace();
                println("Exception in receiveMsg function");
            }
           return line;
         }
    
    
    
    public void sendMsg(BufferedWriter writer, String inputString){

                 //if (br.ready()) {
                //if (Main.movement != "") {
                    try {
                        // output = br.readLine(); // reads line from this terminal

                         writer.write(inputString); // sends line to wifi module
                        //writer.write(Main.movement);
                        writer.newLine();
                        writer.flush();
                        //Main.movement = "";
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                //}
        }
      
      
    }
    
