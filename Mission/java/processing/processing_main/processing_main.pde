import java.io.*;
import java.net.*;
import controlP5.*;
//String IP_ADDRESS = "localhost";
String ip_address = "192.168.4.1";
int port = 23; 
communication MyComms = new communication();
bot bot1 = new bot();
dot dots1 = new dot();
parseCommunication dataParse = new parseCommunication();
compass compass1 = new compass();
lasers laser1 = new lasers();
ui ui1 = new ui();
ControlP5 cp5;
String receiveMsg = "null";
int centerX = 500;
int centerY = 500;
float distanceToPixel = 500/500;
int counter = 0;
int NOM = 20;
BufferedReader reader;
BufferedWriter writer;
Socket socket;
int anglesH[] = new int[NOM];
int distancesH[] = new int [NOM];
int distancesHL[] = new int [NOM];
String latestKey =  "1";
boolean ultrasonicToggle = true;
boolean laserToggle = true;
//int anglesH[] = {10, 20, 30, 70, 90};
//int distancesH[] = {310, 200, 100, 800, 50}; 

void setup(){
  size(1000, 1000); 
  background(0);
  noFill();
  cp5 = new ControlP5(this);
  
  cp5.addSlider("PixPerMM")
    .setRange(0.25, 3)
    .setValue(1)
    .setPosition(0, 965)
    .setSize(120, 15);
    ;

  cp5.addSlider("FieldStrength")
    .setRange(0, 5000)
    .setValue(0)
    .setPosition(0, 985)
    .setSize(250, 15)
    ;
  
    try{
      socket = MyComms.initSocket(ip_address, port);
      reader = MyComms.startReader(socket);
      writer = MyComms.startWriter(socket);
  } catch (IOException e){
    e.printStackTrace();
  }
}


void draw(){

  receiveMsg = MyComms.receiveMsg(reader);
  //println(receiveMsg);
    
if(receiveMsg != null){
   dataParse.dataSet(receiveMsg);   
   println("Winkel: " + dataParse.a + " Distanz: " + dataParse.d + " Heading: " + dataParse.h + " MagX: " + dataParse.x + " MagY: " + dataParse.y + " MagZ: " + dataParse.z + " FrontLaser: " + dataParse.f + " SideLaser: " + dataParse.s );
   anglesH[counter]= dataParse.a;
   distancesH[counter] = dataParse.d;
   distancesHL[counter] = dataParse.f;
   counter ++;
   if(counter >= NOM) counter =0;
}
 

  drawCoordinateSystem();
  bot1.display(dataParse.d, dataParse.a, dataParse.f);
  laser1.display(dataParse.f, dataParse.s);
  compass1.displayHeading(dataParse.h);
  compass1.displayfieldComponents(dataParse.x, dataParse.y, dataParse.z);
  dots1.drawDots(anglesH, distancesH, distancesHL, NOM);
  //ui1.fieldStrength(dataParse.x, dataParse.y, dataParse.z);
  cp5.getController("FieldStrength").setValue(ui1.getMag(dataParse.x, dataParse.y, dataParse.z));
  //ui1.distanceMode(latestKey, distanceToPixel);
  
}

public void drawCoordinateSystem(){
  background(0);
  noFill();
  stroke(255, 153, 0);
  line(500, 0, 500, 1000);
  line(0, 500, 1000, 500);
  circle(500, 500, 300);
  circle(500, 500, 500);
  circle(500, 500, 700);
  circle(500, 500, 900);
}

public void distanceModeSelect(String pressedKey){

   switch(pressedKey){
     case "1":
       println("Far Mode");
       distanceToPixel = 500.0/700.0;
       break;
     case "2":
       println("Mid Mode");
       distanceToPixel = 500.0/500.0;
       break;
     case "3": 
       println("Near Mode");
       distanceToPixel = 500.0/100.0;
     default:
       break; 
   }
}

void PixPerMM(float theRes) {
  distanceToPixel = (float)theRes;
  println("a slider event. setting resolutionn to "+theRes);
}

void keyPressed(){
  String latestKey= Character.toString(key);
  if((key != 'v') || (key != '1') || (key != '2') || (key != '3')){
    MyComms.sendMsg(writer, latestKey);
  }
  //distanceModeSelect(latestKey);
  
  //println(key);
}
