import java.io.*;
import java.net.*;
import controlP5.*;
//String ip_address = "localhost";
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
int NOM = 144;
int HistorySize = 3;
boolean isJson;
BufferedReader reader;
BufferedWriter writer;
Socket socket;
int anglesH[] = new int[NOM];
int distancesH[] = new int [NOM];
int distancesHL[] = new int [NOM];
int anglesH2[] = new int[NOM];
int distancesH2[] = new int [NOM];
int distancesHL2[] = new int [NOM];
int anglesH3[] = new int[NOM];
int distancesH3[] = new int [NOM];
int distancesHL3[] = new int [NOM];
int anglesH4[] = new int[NOM];
int distancesH4[] = new int [NOM];
int distancesHL4[] = new int [NOM];
int history = 0;
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
    
      // create a toggle
  cp5.addToggle("Previous")
     .setPosition(960,960)
     .setSize(50,20)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     ;
  
    
      // create a toggle
  cp5.addToggle("History1")
     .setPosition(960,940)
     .setSize(50,20)
     .setValue(false)
     .setMode(ControlP5.SWITCH)
     ;
     
     // create a toggle
  cp5.addToggle("History2")
     .setPosition(960,920)
     .setSize(50,20)
     .setValue(false)
     .setMode(ControlP5.SWITCH)
     ;
     
       // create a toggle
  cp5.addToggle("History3")
     .setPosition(960,900)
     .setSize(50,20)
     .setValue(false)
     .setMode(ControlP5.SWITCH)
     ;
     
    try{
      socket = MyComms.initSocket(ip_address, port);
      reader = MyComms.startReader(socket);
      writer = MyComms.startWriter(socket);
  } catch (Exception e){
    e.printStackTrace();
    //println("IO Exception");
  }
}


void draw(){
  //println("hello");

  receiveMsg = MyComms.receiveMsg(reader);
  //println(receiveMsg);
  
  //debugHistory();
    
if(receiveMsg != null){
   isJson =dataParse.dataSet(receiveMsg);
   if(isJson){
     println("Winkel: " + dataParse.a + " Distanz: " + dataParse.d + " Heading: " + dataParse.h + " MagX: " + dataParse.x + " MagY: " + dataParse.y + " MagZ: " + dataParse.z + " FrontLaser: " + dataParse.f + " SideLaser: " + dataParse.s  + "FieldStrength " + dataParse.fe);
     distancesHL[counter] = dataParse.f;
     distancesH[counter] = dataParse.d;
     anglesH[counter] = dataParse.a;
     counter ++;
     if(counter >= NOM){ 
       counter =0;
     }
   }
}
 

  drawCoordinateSystem();
  bot1.display(dataParse.d, dataParse.a, dataParse.f);
  laser1.display(dataParse.f, dataParse.s);
  compass1.displayHeading(dataParse.h);
  compass1.displayfieldComponents(dataParse.x, dataParse.y, dataParse.z);
  
  switch(history){
    case 0:
      dots1.drawDots(anglesH, distancesH, distancesHL, HistorySize, NOM, history);
      break;
    case 1:
      dots1.drawDots(anglesH2, distancesH2, distancesHL2, HistorySize, NOM, history);
      break;
    case 2:
      dots1.drawDots(anglesH3, distancesH3, distancesHL3, HistorySize, NOM, history);
      break;
    case 3:
      dots1.drawDots(anglesH4, distancesH4, distancesHL4, HistorySize, NOM, history);
      break;
    default:
      dots1.drawDots(anglesH, distancesH, distancesHL, HistorySize, NOM, history);
      break;
  }
  
  
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

void PixPerMM(float theRes) {
  distanceToPixel = (float)theRes;
  println("a slider event. setting resolutionn to "+theRes);
}

void Previous(boolean theFlag) {
  if(theFlag == true){
    history = 0;
    cp5.getController("History1").setValue(0);
    cp5.getController("History2").setValue(0);
    cp5.getController("History3").setValue(0);
  }
}

void History1(boolean theFlag) {
  if(theFlag == true){
    history = 1;
    cp5.getController("Previous").setValue(0);
    cp5.getController("History2").setValue(0);
    cp5.getController("History3").setValue(0);
  }
}

void History2(boolean theFlag) {
  if(theFlag == true){
    history = 2;
    cp5.getController("Previous").setValue(0);
    cp5.getController("History1").setValue(0);
    cp5.getController("History3").setValue(0);
  }
}

void History3(boolean theFlag) {
  if(theFlag == true){
    history = 3;
    cp5.getController("Previous").setValue(0);
    cp5.getController("History2").setValue(0);
    cp5.getController("History1").setValue(0);
  }
}

void saveDraw(String latestKey){

  for(int i = 0; i<NOM; i++){
    switch(latestKey){
      case "7":
        anglesH2[i] = anglesH[i];;
        distancesH2[i] = distancesH[i];
        distancesHL2[i] = distancesHL[i];
        break;
       case "8":
        anglesH3[i] = anglesH[i];
        distancesH3[i] = distancesH[i];
        distancesHL3[i] = distancesHL[i];
        break;
       case "9":
        anglesH4[i] = anglesH[i];
        distancesH4[i] = distancesH[i];
        distancesHL4[i] = distancesHL[i];
         break;
       default:
         break; 
    }
  }
}



void keyPressed(){
  String latestKey= Character.toString(key);
  if((key != 'v') && (key != '7') && (key != '8') && (key != '9')){
    MyComms.sendMsg(writer, latestKey);
  }else{
    saveDraw(latestKey);
    println("savedraw");
  }
  //distanceModeSelect(latestKey);
  
  //println(key);
}
