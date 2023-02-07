import java.io.*;
import java.net.*;
import java.util.Scanner;

class communication {
  Socket socket; 
  BufferedReader reader;
  BufferedWriter writer;
  String ip_address; 
  /* Method to initialize a new socket */
    public Socket initSocket(String ip_address, int port)throws IOException{
        Socket socket = new Socket(ip_address, port);
        println("Socket ready");
        return socket;
    }
    /* Method to set up a new buffered reader objects. Required to receive communication */
    public BufferedReader startReader(Socket socket) throws IOException{
        BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream())); // reading from
        println("Reader init");
        return reader;
    }
     /* Method to set up a new buffered writer objects. Required to send communication */
    public BufferedWriter startWriter(Socket socket) throws IOException{
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
        println("Writer init");
        return writer;
    }
  /*  Method which uses the Buffered reader object to determine if a message is waiting in the buffer and if it is to return it */
    public String receiveMsg(BufferedReader reader){
        String line = null;              //initialized with null to always return null unless reader writes a message into it
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
    
    
    /* Gets an input string and BufferedWriter object to sennd messages. No checks are needed for this buffer because this method only gets called when there is a message ready */
    public void sendMsg(BufferedWriter writer, String inputString){

          try {
               writer.write(inputString); // sends line to wifi module
              //writer.write(Main.movement);
              writer.newLine();
              writer.flush();
          } catch (IOException e) {
              e.printStackTrace();
          }
        }  
    }
    
