/*
  Blank Simple Project.c
  http://learn.parallax.com/propeller-c-tutorials 
*/
#include "simpletools.h"                      // Include simple tools
#include "fdserial.h"

int main()                                    // M  ain function
  {
  int baudrate = 115200;
  int rxPin = 31; 
  int txPin = 30; 
  int mode = 0;  
 
   fdserial *con = fdserial_open	(rxPin,txPin,mode ,baudrate);

   char c;
   char arr[50];
   int count = 0; 
   char testarr[] = "loserLOL";
   int length = 0;
   length = strlen(arr);
   

   while(1){
      c = fdserial_rxChar(con);
      if(c  != -1){
        arr[count] = c;
        count++; 
        }
      if((c != -1) && (c == '\r'))
    {
      length = strlen(arr);
      //dprint(con, "You typed: %s \r", arr);
      for(int i = 0; i < length; i ++){
        fdserial_txChar(con, arr[i]);
        arr[i] = 0;
    }      
      count = 0;
    }
   }  
   return 0; 
}
