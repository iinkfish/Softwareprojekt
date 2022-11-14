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
 
   fdserial *toTerm = fdserial_open(TRx,TTx, MODE ,BAUDRATE);
   fdserial *loopBack = fdserial_open(Rx, Tx, MODE, BAUDRATE);

   char c;
   char c2;
   char arrOut[50];
   char arrIn[50];
   int count = 0; 
   int count2 = 0;
   char testarr[] = "loserLOL";
   int length = 0;
   //length = strlen(arr);
   
   high(7);
   set_output(7, 0); 
   input(8);   
   

   while(1){
    
    if(c!=-1){
      c = fdserial_rxChar(toTerm);
    }      
      
      while(c != '\r'){
        c = fdserial_rxChar(toTerm);
        if(c != -1){
          fdserial_txChar(loopBack, c);
          //arrOut[0] = 'z';
          arrIn[count] = fdserial_rxChar(loopBack);
          count++;
          }
        }
        //fdserial_txChar(toTerm, '\r');
        //fdserial_txChar(toTerm, arrOut[0]);
        //fdserial_txChar(toTerm, '\r');
        //c = ' '; 
        count = 0;
     

      
      if(c != -1){
      length = strlen(arrIn);
      for(int i = 0; i < length; i++){
        fdserial_txChar(toTerm, arrIn[i]);
        arrIn[i]= 0;
        }        
     }       
         
      
  }      
   return 0; 
}
