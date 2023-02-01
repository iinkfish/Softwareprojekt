bot bot1 = new bot();
tower tower1 = new tower();
PGraphics pg;
int increaseAngle = 1;
int currAngle = 9;
int distanceMeasurement=310;       //test value
int distanceToPixel =500/500;      //px per mm
int numberOfPoints =2;


void setup(){
 size(1000, 1000);
 pg = createGraphics(1000, 1000);

}

void draw(){
  
    float x = distanceMeasurement*distanceToPixel*cos(radians(currAngle*numberOfPoints));
    float y = distanceMeasurement*distanceToPixel*sin(radians(currAngle*numberOfPoints));

background(0);
translate(500, 500);
bot1.display(1, 310, currAngle);
//while(numberOfPoints <20){
x = distanceMeasurement*distanceToPixel*cos(radians(currAngle*numberOfPoints));
y = distanceMeasurement*distanceToPixel*sin(radians(currAngle*numberOfPoints));
tower1.display(numberOfPoints);
ellipse(x, -y-125, 20, 20);
++numberOfPoints;
//}
if(numberOfPoints >= 20){
numberOfPoints = 0;
}
//tower1.display();
//pg.beginDraw();
//pg.noFill();
//pg.fill(0, 3);
//pg.stroke(255);
//pg.ellipse(0, 0, 50, 50);
//pg.endDraw();

//image(pg, 0, 0);

//if(true){
//  currAngle += increaseAngle;
//}


}

/**
 * Create Graphics. 
 * 
 * The createGraphics() function creates an object from 
 * the PGraphics class. PGraphics is the main graphics and 
 * rendering context for Processing. The beginDraw() method 
 * is necessary to prepare for drawing and endDraw() is
 * necessary to finish. Use this class if you need to draw 
 * into an off-screen graphics buffer or to maintain two 
 * drawing surfaces with different properties.
 */

//PGraphics pg;

//void setup() {
//  size(640, 360);
//  pg = createGraphics(400, 200);
//}

//void draw() {
//  fill(0, 200);
//  rect(0, 0, width, height);
//  fill(255);
//  noStroke();
//  ellipse(mouseX, mouseY, 60, 60);
  
//  pg.beginDraw();
//  //pg.background(0);
//  pg.noFill();
//  pg.fill(0, 3);
//  pg.stroke(255);
//  pg.ellipse(mouseX-120, mouseY-60, 60, 60);
//  pg.endDraw();
  
//  // Draw the offscreen buffer to the screen with image() 
//  image(pg, 120, 60); 
//}
