class bot {
  private int towerPosition = -125;          //default value
  private int towerAngle=50;                 //test value
  private int distanceMeasurement=310;       //test value
  private int distanceToPixel =500/500;      //px per mm
  
  public void display(int distanceToPixel, int distanceMeasurement, int towerAngle){
    
    float x = distanceToPixel*distanceMeasurement*cos(radians(towerAngle));
    float y = distanceToPixel*distanceMeasurement*sin(radians(towerAngle));
  
    fill(0, 200);
    stroke(255);
    rectMode(CENTER);
    rect(0, 0, 150, 250, 20);      //bot body
    //translate(0,  towerPosition);            //move tower up the screen
    //rotate(radians(90-towerAngle)); //rotate tower 90 degrees (looks right)
    //rect(0, towerPosition, 80, 20, 10);          //construct tower
    //rotate(radians(180));            //rotate modifier for line
    //line(0, towerPosition, x, -y);  //line to length
  }
}
