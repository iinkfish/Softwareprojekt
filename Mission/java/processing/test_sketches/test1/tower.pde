class tower{
  
  private int towerPosition = -125;          //default value
  private int towerAngle=9;                 //test value
  private int distanceMeasurement=310;       //test value
  private int distanceToPixel =500/500;      //px per mm

  public void display(int posmulti){
    float x = distanceMeasurement*distanceToPixel*cos(radians(towerAngle*posmulti));
    float y = distanceMeasurement*distanceToPixel*sin(radians(towerAngle*posmulti));
    //translate(0,  towerPosition);            //move tower up the screen
    //rotate(radians(90-towerAngle*posmulti)); //rotate tower 90 degrees (looks right)
    rect(0, towerPosition, 80, 20, 10);          //construct tower
    //rotate(radians(180));            //rotate modifier for line
    line(0, towerPosition, x , -y+towerPosition);  //line to length

  }

}
