class lasers {
  public int xoffset = 65;
  public int yoffset = -80;
  public float x;
  public float y;
  String s;
  
 
 public void display(int laserFront, int laserSide){
   /* Draw front and side laser in the x and y direction without adjusting the angle */
   x = (float)laserSide*distanceToPixel;
   y = (float)laserFront*distanceToPixel;
   /* Set style and draw the lines with distannce value on screen  */
    stroke(color(255, 0, 0));
    strokeWeight(2);
    line(centerX+xoffset, centerY+yoffset, centerX+xoffset+x, centerY+yoffset);
    line(centerX+xoffset, centerY+yoffset, centerX+xoffset, centerY+yoffset-y);
    fill(color(255, 204, 0));  // Define color 'c');
      stroke(color(0, 255, 0));  // Define color 'c'
      s = String.valueOf(laserFront);
      textSize(15);
      text(s, centerX+xoffset, centerY+yoffset-y);      //front
      s = String.valueOf(laserSide);
      text(s, centerX+xoffset+x-10, centerY+yoffset);  //side
   
 } 
}
