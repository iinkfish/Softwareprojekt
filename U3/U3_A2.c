/*
  Blank Simple Project.c
  http://learn.parallax.com/propeller-c-tutorials 
*/
#include "simpletools.h"                      // Include simple tools
#include "fdserial.h"

#define Rx 8          //Do pin auf WX modul
#define Tx 7          //DI pin auf WX modul
#define TRx 31        //Input von Terminal
#define TTx 30        //Output von Terminal
#define MODE 0 
#define BAUDRATE 115200

int main()                                    // M  ain function
  {
 
   fdserial *TermCon = fdserial_open(TRx,TTx, MODE ,BAUDRATE);
   fdserial *wifiCon = fdserial_open(Rx, Tx, MODE, BAUDRATE);

   char c = NULL;
   char c2 = 0;
   char c3 = 0;
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
    // c2 = fdserial_rxCheck(TermCon);      //keep here in case rxReady just stays on the function and doesn't progress 
    c2 = fdserial_rxReady(TermCon);         //just puts -1 if nothing is in buffer otherwise return oldest byte (one that is typed first)
    if(c2 > 0){
            //  dprint(TermCon, "You typed something");
      c = fdserial_rxChar(TermCon); 
      arrIn[0] = c;                        //writes the oldest byte in the first position of the array
      
      while(c != '\r'){
        c = fdserial_rxChar(TermCon);
        if(c != -1){
          arrIn[count] = c;
          count++;
          }
        }
        //fdserial_rxFlush(TermCon);
        //dprint(TermCon, "You typed: %c \r", arrIn[0]);
        count = 1;
        c = NULL; 
        c2 = 0;
      
      length = strlen(arrIn);
      for(int i = 0; i < length; i++){
        fdserial_txChar(wifiCon, arrIn[i]);
        arrIn[i]= 0;
        }            
   }  
    // c3 =fdserial_rxCheck(wifiCon);                   //keep here in case rxReady just stays on the function and doesn't progress 
    c3 =fdserial_rxReady(wifiCon);
    pause(50);
    //dprint(TermCon, "nach wifi ready \r");
     if(c3 > 0){
      c = fdserial_rxChar(wifiCon);
      arrIn[0] = c;    
     // dprint(TermCon, "nach ersten c in wificon \r");
     
      while(c != '\r'){
        c = fdserial_rxChar(wifiCon);
        if(c != -1){
          arrIn[count] = c;
          count++;
          }
        }

        fdserial_rxFlush(wifiCon);
        count = 1;
        c = NULL;
        c3 = 0;
         //            dprint(TermCon, "nach c3 \r");

        length = strlen(arrIn);
        for(int i = 0; i < length; i++){
          fdserial_txChar(TermCon, arrIn[i]);
          arrIn[i]= 0;
          }        
    }     
  }      
   return 0; 
}
