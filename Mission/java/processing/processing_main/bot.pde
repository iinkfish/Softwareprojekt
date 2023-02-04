class bot{

private int towerPosition = 0;
private int centerX = 500;
private int centerY = 500;
private float x;
private float y;

public void display(float pixelDistance, int towerAngle){
  
      x = (float)pixelDistance*distanceToPixel*cos(radians(towerAngle));
      y = (float)pixelDistance*distanceToPixel*sin(radians(towerAngle));

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

  

}

}
