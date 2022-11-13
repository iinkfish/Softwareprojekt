#include "simpletools.h"
#include "fdserial.h"

#define Rx 14
#define Tx 13
#define TRx 31
#define TTx 30

unsigned char C;


fdserial *cnn;
fdserial *trm;

int main()
{
  unsigned char L;

  simpleterm_close();

  trm = fdserial_open(TRx, TTx, FDSERIAL_MODE_NONE, 115200);
  cnn = fdserial_open(Rx, Tx, FDSERIAL_MODE_NONE, 115200);

  fdserial_txChar(trm, '>');
  pause(1000);
  fdserial_txChar(trm, '>');
  while(1)
  {
    if (fdserial_rxReady(cnn)>0)
    {
      C = fdserial_rxChar(cnn);
      if ((C > 'z') || (C < ' '))
      {
        dprint(trm, "<%2.2x>", C);
        if (C == '\r')
          fdserial_txChar(trm, C);
      }
      else
        fdserial_txChar(trm, C);
      if (C == '~')
      {
        dprint(trm, "Recv:");
        dprint(cnn, "%cARG:5,WORLD\r", 0xfe);
        dprint(cnn, "%cREPLY:5,200,8,8\r", 0xfe);
        dprint(cnn, "Whatever");
      }        
    }
    if (fdserial_rxReady(trm)>0)
    {
      C = fdserial_rxChar(trm);
      if (C == '!')
      {
        fdserial_txChar(cnn, 0xfe);
      }        
      else
        fdserial_txChar(cnn, C);
//      if (C == 0x0d)
//        fdserial_txChar(cnn, 0x0a);
    }      
  }  
}