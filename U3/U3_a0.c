
#include <stdlib.h>
#include "fdserial.h"

int baudrate = 115200;
int rxPin = 31; 
int txPin = 30; 
int mode = 0;  

int main(int argc, char const *argv[])
{
   fdserial *con = fdserial_open	(rxPin,txPin,mode ,baudrate);

   char c; 

   while(1){
      c = fdserial_rxChar(con);
      if((c != -1) && )
    {
      dprint(con, "You typed: %c\r", c);
    }
   }  
   return 0; 
}
