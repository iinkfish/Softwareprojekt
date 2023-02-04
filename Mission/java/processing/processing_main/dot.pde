import java.lang.Math;
class dot {
private int dotPosition = -125;
private int centerX = 500;
private int centerY = 500;
private int centerYOffset = 75;
private int numberOfDots = 5;
private float x;
private float y;
private float xl;
private float yl;
private String s;
private boolean maximumX;
private boolean maximumY;
private boolean maximumXL;
private boolean maximumYL;
private float cappedLength;
private float cappedLength2;
private int maxDistance = 0;
private String sl;

  

  public void drawDots(int anglesH[], int distancesH[], int distancesHL[], int numberOfDots){
    
    
    
    for(int i = 0; i<numberOfDots; i++){
      x = (float)distancesH[i]*distanceToPixel*cos(radians(anglesH[i]));
      y = (float)distancesH[i]*distanceToPixel*sin(radians(anglesH[i]));
      xl = (float)distancesHL[i]*distanceToPixel*cos(radians(anglesH[i]));
      yl = (float)distancesHL[i]*distanceToPixel*sin(radians(anglesH[i]));
      //print(xl);
      //println(yl);
      
      maximumX = (Math.abs(x)>=Math.abs(y));
      maximumY = (Math.abs(y)>Math.abs(x));
      maximumXL = (Math.abs(xl)>=Math.abs(yl));
      maximumYL = (Math.abs(yl)>Math.abs(xl));
      
      fill(color(0, 255, 0));  // Define color 'c');
      stroke(color(0, 255, 0));  // Define color 'c'
      if(maximumX){
        if(x>=500){
          x= 495;
          cappedLength = x/cos(radians(anglesH[i]));
          y = cappedLength*sin(radians(anglesH[i]));
          //s = String.valueOf(distancesH[i]);
          //textSize(15);
          //stroke(color(255, 0, 0));  // Define color 'c'
          //fill(color(255, 0, 0));  // Define color 'c'
          //text(s, centerX + x -35, (centerY)-y+5);

        }
        if(x<=-500){
          x = -495;
          cappedLength = Math.abs(x/cos(radians(anglesH[i])));
          y = cappedLength*sin(radians(anglesH[i]));
          //stroke(color(255, 0, 0));  // Define color 'c'
          //fill(color(255, 0, 0));  // Define color 'c'
        }
      }
     if(maximumY){
        if(y>= 500) {
          y = 495;
          cappedLength = Math.abs(y/sin(radians(anglesH[i])));
          x = cappedLength*cos(radians(anglesH[i]));
          //stroke(color(255, 0, 0));  // Define color 'c'
          //fill(color(255, 0, 0));  // Define color 'c'
        }
        if(y<=-500){
          y = -495;
          cappedLength = Math.abs(y/sin(radians(anglesH[i])));
          x = cappedLength*cos(radians(anglesH[i]));
          //stroke(color(255, 0, 0));  // Define color 'c'
          //fill(color(255, 0, 0));  // Define color 'c'
        }
      }
      
      if(maximumXL){
        if(xl>=500){
          xl= 495;
          cappedLength2 = xl/cos(radians(anglesH[i]));
          yl = cappedLength2*sin(radians(anglesH[i]));
          sl = String.valueOf(distancesHL[i]);
          textSize(15);
          stroke(color(255, 0, 0));  // Define color 'c'
          fill(color(255, 0, 0));  // Define color 'c'
          text(s, centerX + xl -35, (centerY)-yl+5);

        }
        if(xl<=-500){
          xl = -495;
          cappedLength2 = Math.abs(xl/cos(radians(anglesH[i])));
          yl = cappedLength*sin(radians(anglesH[i]));
          stroke(color(255, 0, 0));  // Define color 'c'
          fill(color(255, 0, 0));  // Define color 'c'
        }
      }
     if(maximumYL){
        if(yl>= 500) {
          yl = 495;
          cappedLength2 = Math.abs(yl/sin(radians(anglesH[i])));
          xl = cappedLength2*cos(radians(anglesH[i]));
          stroke(color(255, 0, 0));  // Define color 'c'
          fill(color(255, 0, 0));  // Define color 'c'
        }
        if(yl<=-500){
          yl = -495;
          cappedLength2 = Math.abs(yl/sin(radians(anglesH[i])));
          xl = cappedLength2*cos(radians(anglesH[i]));
          stroke(color(255, 0, 0));  // Define color 'c'
          fill(color(255, 0, 0));  // Define color 'c'
        }
      }
      ellipse(centerX+xl, (centerY)-yl, 10, 10);
      stroke(255);
      fill(255);
      ellipse(centerX+x, (centerY)-y, 10, 10);
      fill(color(100, 255, 0));  // Define color 'c');
      stroke(color(0, 255, 0));  // Define color 'c'

      //if(x <=495){
      
      s = String.valueOf(distancesH[i]);
      sl = String.valueOf(distancesHL[i]);
      stroke(255);  // Define color 'c'
      textSize(12);
      stroke(color(180, 180, 180));  // Define color 'c'
      fill(color(180, 188, 188));  // Define color 'c');
      //text(s, centerX + x +5, (centerY)-y+5);
      text(sl, centerX + xl +5, (centerY)-yl+5);
      //}
    }
  
  }
}
