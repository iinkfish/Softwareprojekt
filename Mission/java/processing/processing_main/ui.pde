import java.lang.Math;

class ui {
  
  private float mag;
  
  public float getMag(int x, int y, int z){
    return sqrt((float)Math.pow(x, 2) + (float)Math.pow(y, 2) + (float)Math.pow(z, 2));
  }
  
  
  public void fieldStrength(int x, int y, int z){
    
    mag = sqrt((float)Math.pow(x, 2) + (float)Math.pow(y, 2) + (float)Math.pow(z, 2));
    println(mag);
    
      String s = String.valueOf(mag);
      textSize(15);
      mag = mag/100;
      text(s, 950, 965-mag);
      println("adjust mag " + mag);
    
    if(mag>=300) mag = 300;
    
    pushMatrix();
    rectMode(CORNER);
    translate(970, 970);
    rotate(radians(180));
    fill(color(0, 255, 0));  // Define color 'c');
    stroke(color(0, 255, 0));  // Define color 'c'
    rect(0, 0, 20, mag);
    popMatrix();
    
  }  
  public void distanceMode(String pressedkey, float ratio){
    String string = String.format("%2f pix/mm", ratio);
    if(pressedkey == "1") { 
      fill(color(255, 0 , 0));
      rect(50, 900, 65, 25);
      textSize(12);
      fill(255);
      text(string, 50, 920);
    }else if(pressedkey == "2"){
      fill(color(200, 200 , 0));
      rect(50, 900, 65, 25);
      textSize(12);
      fill(255);
      text(string, 50, 920);
    } else if(pressedkey =="3"){
      fill(color(100, 200 , 0));
      rect(50, 900, 65, 25);
      textSize(12);
      fill(255);
      text(string, 50, 920);
    }
  }
  
}
