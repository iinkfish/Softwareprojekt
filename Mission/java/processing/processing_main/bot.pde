class bot{

private int towerPosition = 0;
private int centerX = 500;
private int centerY = 500;
private float x;
private float y;
private float xl;
private float yl;

public void display(float pixelDistance, int towerAngle, int laserDistance){
  
      x = (float)pixelDistance*distanceToPixel*cos(radians(towerAngle));
      y = (float)pixelDistance*distanceToPixel*sin(radians(towerAngle));
      xl = (float)laserDistance*distanceToPixel*cos(radians(towerAngle));
      yl = (float)laserDistance*distanceToPixel*sin(radians(towerAngle));

pushMatrix();
  fill(0, 200);
  
  stroke(255);
  translate(centerX, centerY);
  rectMode(CENTER);
  rect(0, 0, 150, 200, 20);
  translate(0, towerPosition);
  rotate(radians(-90-towerAngle));
  rect(0, 0, 80, 20, 10);
  //rotate(radians(180));
  popMatrix();
  line(centerX, centerY, centerX+x, centerY-y);
  stroke(color(255, 0, 0));
  line(centerX, centerY, centerX+xl, centerY-yl);
  stroke(255);


  

}

}
