import java.lang.Math;
class dot {
private int dotPosition = -125;
private int centerX = 500;
private int centerY = 500;
private int centerYOffset = 75;
private int numberOfDots = 5;
private float x;
private float y;
private String s;
private boolean maximumX;
private boolean maximumY;
private float cappedLength;
private int maxDistance = 0;

  public void drawDots(int anglesH[], int distancesH[], int numberOfDots){
    
    
    
    for(int i = 0; i<numberOfDots; i++){
      x = (float)distancesH[i]*distanceToPixel*cos(radians(anglesH[i]));
      y = (float)distancesH[i]*distanceToPixel*sin(radians(anglesH[i]));
      
      maximumX = (Math.abs(x)>=Math.abs(y));
      maximumY = (Math.abs(y)>Math.abs(x));
      
      fill(color(100, 255, 0));  // Define color 'c');
      stroke(color(0, 255, 0));  // Define color 'c'
      if(maximumX){
        if(x>=500){
          x= 495;
          cappedLength = x/cos(radians(anglesH[i]));
          y = cappedLength*sin(radians(anglesH[i]));
          s = String.valueOf(distancesH[i]);
          textSize(15);
          stroke(color(255, 0, 0));  // Define color 'c'
          fill(color(255, 0, 0));  // Define color 'c'
          text(s, centerX + x -35, (centerY)-y+5);

        }
        if(x<=-500){
          x = -495;
          cappedLength = Math.abs(x/cos(radians(anglesH[i])));
          y = cappedLength*sin(radians(anglesH[i]));
          stroke(color(255, 0, 0));  // Define color 'c'
          fill(color(255, 0, 0));  // Define color 'c'
        }
      }
     if(maximumY){
        if(y>= 500) {
          y = 495;
          cappedLength = Math.abs(y/sin(radians(anglesH[i])));
          x = cappedLength*cos(radians(anglesH[i]));
          stroke(color(255, 0, 0));  // Define color 'c'
          fill(color(255, 0, 0));  // Define color 'c'
        }
        if(y<=-500){
          y = -495;
          cappedLength = Math.abs(y/sin(radians(anglesH[i])));
          x = cappedLength*cos(radians(anglesH[i]));
          stroke(color(255, 0, 0));  // Define color 'c'
          fill(color(255, 0, 0));  // Define color 'c'
        }
      }

      ellipse(centerX+x, (centerY)-y, 5, 5);
      //if(x <=495){
      s = String.valueOf(distancesH[i]);
      stroke(255);  // Define color 'c'
      textSize(15);
      text(s, centerX + x +5, (centerY)-y+5);
      //}
    }
  
  }
}
