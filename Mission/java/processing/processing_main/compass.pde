import java.lang.Math;
class compass {
  private float x;
  private float y;
  private int arrowLength =75;
  private int xoffset=0;        //offsets are only required if the point of origin of the compass is NOT in the center of the screen
  private int yoffset=0;
  
  public void  displayHeading(int Heading){
    /* converts a heading in degrees to x and y values. Needed for the line method for the correct end points  of the line  */
    x = (float)arrowLength*cos(radians(Heading));
    y = (float)arrowLength*sin(radians(Heading));
    stroke(color(0, 255, 0));
    strokeWeight(6);
    line(centerX+xoffset, centerY+yoffset, centerX+x, centerY-y);      //arguments: start point x, start point y, end point x, end point y) 
    strokeWeight(1);
  
  }
  
  public void displayfieldComponents(int x, int y, int z){
    /* The  value of each field component can get quite large so a static scaler is applied to reduce them */
    x /= 10;
    y /= 10;
    z /=10;
    
    stroke(color(255, 255, 255));
    strokeWeight(2);
    line(900+xoffset, 100+yoffset, 900+x, 100);
    line(900+xoffset, 100+yoffset, 900, 100-y);
    line(900+xoffset, 100+yoffset, 900+z, 100+z);
  }
}
