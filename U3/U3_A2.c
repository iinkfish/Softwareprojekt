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

   void function pollConnection(fdserial *Term, fdserial *Wifi){
    char arrIn[50];
    char c;
    int count = 1;
    int length = 0; 
    //Eingabe am Terminal registrieren aufzeichen und abschicken 
      if(fdserial_rxCheck(Term)!= -1){
        c = fdserial_rxChar(Term);
        arrIn[0] = c; 
      //}      
        
        while(c != '\r'){
          c = fdserial_rxChar(Term);
          if(c != -1){
            //fdserial_txChar(loopBack, c);
            //arrOut[0] = 'z';
            //arrIn[count] = fdserial_rxChar(loopBack);
            arrIn[count] = c;
            count++;
            }
          }
          count = 1;
          if(c != -1){
          length = strlen(arrIn);
          for(int i = 0; i < length; i++){
            fdserial_txChar(Wifi, arrIn[i]);
            arrIn[i]= 0;
            }        
          }  
      }

      return; 
   } 
   

<<<<<<< HEAD
   while(1){                                                //haupt main schleife

   //Eingabe am Terminal registrieren aufzeichen und abschicken 
    if(fdserial_rxCheck(TermCon)!= -1){
      c = fdserial_rxChar(TermCon);
      arrIn[0] = c; 
=======
   while(1){
    c2 = fdserial_rxCheck(TermCon);
    if(c2 != -1){ 
    //if(c!=-1){
      c = fdserial_rxChar(TermCon);
      arrIn[0] = c;
      //c = fdserial_rxChar(TermCon);
      //arrIn[0] = c; 

>>>>>>> d0c6242a83c6c482fc8646b2ab5cc43e2f39ccbe
    //}      
      
      while(c != '\r'){
        c = fdserial_rxChar(TermCon);
<<<<<<< HEAD
=======
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
>>>>>>> d0c6242a83c6c482fc8646b2ab5cc43e2f39ccbe
        if(c != -1){
          //fdserial_txChar(loopBack, c);
          //arrOut[0] = 'z';
          //arrIn[count] = fdserial_rxChar(loopBack);
          arrIn[count] = c;
          count++;
          }
        }
<<<<<<< HEAD
        fdserial_rxFlush(TermCon);                            //flush des receive buffers vom terminal
=======
        //fdserial_txChar(toTerm, '\r');
        //fdserial_txChar(toTerm, arrOut[0]);
        //fdserial_txChar(toTerm, '\r');
        //c = ' '; 
                fdserial_rxFlush(wifiCon);
>>>>>>> d0c6242a83c6c482fc8646b2ab5cc43e2f39ccbe
        count = 1;
        if(c != -1){                                        //kann evtl entfernt werden weil bei senden der status von c schon uninteressant ist
        length = strlen(arrIn);
        for(int i = 0; i < length; i++){
          fdserial_txChar(wifiCon, arrIn[i]);
          arrIn[i]= 0;
          }        
        }  
    }

    //Empfang am Wifi Modul bzw am entsprechenden rx port
    if(fdserial_rxCheck(wifiCon)!= -1)J{
      c = fdserial_rxChar(wifiCon); 
      arrIn[0] = c; 
      
<<<<<<< HEAD
      while(c != '\r') {
        c = fdserial_rxChar(wifiCon);
        if(c != -1){
          arrIn[count] = c; 
          count++
        }
      }
      fdserial_rxFlush(wifiCon);                        //flush des receive buffers vom wifi modul
      count = 1;
      if(c != -1){
        length = strlen(arrIn);
        for(int i = 0; i< length; i++){
          fdserial_txChar(TermCon, arrIn[i]);
          arrIn[i] = NULL; 
        }
      }

    }
    
         
=======
     // if(c != -1){
      length = strlen(arrIn);
      for(int i = 0; i < length; i++){
        fdserial_txChar(TermCon, arrIn[i]);
        arrIn[i]= 0;
        }        
     //}       
   }          
>>>>>>> d0c6242a83c6c482fc8646b2ab5cc43e2f39ccbe
      
  }      
   return 0; 
}
