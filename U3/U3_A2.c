/*
  Blank Simple Project.c
  http://learn.parallax.com/propeller-c-tutorials 
*/
#include "simpletools.h"                      // Include simple tools
#include "fdserial.h"

#define Rx 8          //mcu intern empfangen
#define Tx 7          //mcu intern senden
#define TRx 31        //empfangen am mcu
#define TTx 30        //senden an usb
#define MODE 0 
#define BAUDRATE 115200

int main()                                    // M  ain function
  {
 
   fdserial *TermCon = fdserial_open(TRx,TTx, MODE ,BAUDRATE);
   fdserial *wifiCon = fdserial_open(Rx, Tx, MODE, BAUDRATE);

   char c;
   char c2 = 'A';
   char c3 = 'A';
   char arrOut[50];
   char arrIn[50];
   int count = 1; 
   int count2 = 0;
   char testarr[] = "loserLOL";
   int length = 0;
   //length = strlen(arr);
   
   high(7);
   set_output(7, 0); 
   input(8);   
   

   while(1){
    c2 = fdserial_rxCheck(TermCon);
    if(c2 != -1){ 
    //if(c!=-1){
      c = fdserial_rxChar(TermCon);
      arrIn[0] = c;
      //c = fdserial_rxChar(TermCon);
      //arrIn[0] = c; 

    //}      
      
      while(c != '\r'){
        c = fdserial_rxChar(TermCon);
        if(c != -1){
          //fdserial_txChar(loopBack, c);
          //arrOut[0] = 'z';
          //arrIn[count] = fdserial_rxChar(loopBack);
          arrIn[count] = c;
          count++;
          }
        }
        //fdserial_txChar(toTerm, '\r');
        //fdserial_txChar(toTerm, arrOut[0]);
        //fdserial_txChar(toTerm, '\r');
        //c = ' ';
        fdserial_rxFlush(TermCon);
        //dprint(TermCon, "You typed: %c \r", arrIn[0]);
        count = 1;
     

      
     // if(c != -1){
      length = strlen(arrIn);
      for(int i = 0; i < length; i++){
        fdserial_txChar(wifiCon, arrIn[i]);
        arrIn[i]= 0;
        }        
     //}       
   }  
    c3 =fdserial_rxCheck(wifiCon);
     if(c3 != -1){
    //if(c!=-1){
      c = fdserial_rxChar(wifiCon);
      arrIn[0] = c; 
    //}      
      
      while(c != '\n'){
        c = fdserial_rxChar(wifiCon);
        if(c != -1){
          //fdserial_txChar(loopBack, c);
          //arrOut[0] = 'z';
          //arrIn[count] = fdserial_rxChar(loopBack);
          arrIn[count] = c;
          count++;
          }
        }
        //fdserial_txChar(toTerm, '\r');
        //fdserial_txChar(toTerm, arrOut[0]);
        //fdserial_txChar(toTerm, '\r');
        //c = ' '; 
                fdserial_rxFlush(wifiCon);
        count = 1;
     

      
     // if(c != -1){
      length = strlen(arrIn);
      for(int i = 0; i < length; i++){
        fdserial_txChar(TermCon, arrIn[i]);
        arrIn[i]= 0;
        }        
     //}       
   }          
      
  }      
   return 0; 
}
