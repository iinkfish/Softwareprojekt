class bot{

private int towerPosition = 0;
private int centerX = 500;
private int centerY = 500;
private float x;
private float y;
private float xl;
private float yl;

public void display(float pixelDistance, int towerAngle, int laserDistance){
  /* Distances and angle need to be converted to a pixel value which is drawn on screen. A scaler (pixelDistance) is used to scale mm to a pixel count */
      x = (float)pixelDistance*distanceToPixel*cos(radians(towerAngle));
      y = (float)pixelDistance*distanceToPixel*sin(radians(towerAngle));
      xl = (float)laserDistance*distanceToPixel*cos(radians(towerAngle));
      yl = (float)laserDistance*distanceToPixel*sin(radians(towerAngle));

/*Draws bot body and it's tower to the center of the screen */
  pushMatrix();
    fill(0, 200);
    stroke(255);
    translate(centerX, centerY);
    rectMode(CENTER);
    rect(0, 0, 150, 200, 20);
    translate(0, towerPosition);
    rotate(radians(-90-towerAngle));        //the rotate function substracts -90 deg. constantly  to always look right when 0 deg. is received 
    rect(0, 0, 80, 20, 10);
  popMatrix();
    line(centerX, centerY, centerX+x, centerY-y);
    stroke(color(255, 0, 0));
    line(centerX, centerY, centerX+xl, centerY-yl);
    stroke(255);

}

}
