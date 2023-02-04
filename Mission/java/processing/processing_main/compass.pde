class compass {
  private float x;
  private float y;
  private int arrowLength =75;
  private int xoffset=0;
  private int yoffset=0;
  
  public void  displayHeading(int Heading){
  
    x = (float)arrowLength*cos(radians(Heading));
    y = (float)arrowLength*sin(radians(Heading));
    stroke(color(0, 255, 0));
    strokeWeight(6);
    line(centerX+xoffset, centerY+yoffset, centerX+x, centerY-y);
    strokeWeight(1);
  
  }
  
  public void displayfieldComponents(int x, int y, int z){
    
    x /= 20;
    y /= 20;
    z /=20;
    
    stroke(color(0, 0, 255));
    line(centerX+xoffset, centerY+yoffset, centerX+x, centerY);
    line(centerX+xoffset, centerY+yoffset, centerX, centerY-y);
    line(centerX+xoffset, centerY+yoffset, centerX+z, centerY+z);
  }
}
