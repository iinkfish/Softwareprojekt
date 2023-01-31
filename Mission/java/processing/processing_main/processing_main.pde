import java.io.*;
import java.net.*;
import java.util.Scanner;
//String IP_ADDRESS = "localhost";
communication MyComms = new communication();
boolean pinged = true;
String time = "hoi";
//String ip_address = "localhost";
String ip_address = "192.168.4.1";
String receiveMsg = "null";
int port = 23; 
int centerX = 500;
int centerY = 500;
float distanceToPixel = 500/500;

parseCommunication dataParse = new parseCommunication();

BufferedReader reader;
BufferedWriter writer;
Socket socket;


void setup(){
  size(1000, 1000); 
  background(0);
  noFill();
  //MyComms.emptyPrint();
    try{
      socket = MyComms.initSocket(ip_address, port);
      reader = MyComms.startReader(socket);
      writer = MyComms.startWriter(socket);
  } catch (IOException e){
    e.printStackTrace();
  }
}


void draw(){
  //thread("MyComms.receiveMsg(reader)");

    receiveMsg = MyComms.receiveMsg(reader);
if(receiveMsg != null){
   //parseData(receiveMsg);
   dataParse.dataSet(receiveMsg);
   
   println("Winkel: " + dataParse.a + " Distanz: " + dataParse.d + " Heading: " + dataParse.h + " MagX: " + dataParse.x + " MagY: " + dataParse.y + " MagZ: " + dataParse.z + " FrontLaser: " + dataParse.f + " SideLaser: " + dataParse.s );
}
  if(pinged){
    MyComms.sendMsg(writer, "Hello");
    pinged = false;  
  }
  //background(0);
  //circle(500, 500, 300);
  //stroke(255, 153, 0);
  //rect(500, 500, 300, 300);
  
  drawCoordinateSystem();
  drawbot();
  
  
}


public void changeVariable(){
  time = "thread exec";
}

public void  drawbot(){
  background(0);
  noFill();
  stroke(255, 153, 0);
  line(500, 0, 500, 1000);
  line(0, 500, 1000, 500);
  circle(500, 500, 300);
  circle(500, 500, 500);
  circle(500, 500, 700);
  circle(500, 500, 900);
  
  fill(0, 200);
  
  stroke(255);
  translate(centerX, centerY);
  rotate(0);
  rectMode(CENTER);
  rect(0, 0, 150, 250, 20);
  translate(0, -125);
  
  rotate(radians(90-dataParse.a));
  rect(0, 0, 80, 20, 10);
  rotate(radians(180));
  
  line(0, 0, 0, distanceToPixel*(float)dataParse.d);
}

public void drawCoordinateSystem(){
  noFill();
  stroke(255, 153, 0);
  line(500, 0, 500, 1000);
  line(0, 500, 1000, 500);
  circle(500, 500, 300);
  circle(500, 500, 500);
  circle(500, 500, 700);
  circle(500, 500, 900);
}

void keyPressed(){
  String latestKey;
  latestKey = Character.toString(key);
  MyComms.sendMsg(writer, latestKey);
  //println(key);
}
