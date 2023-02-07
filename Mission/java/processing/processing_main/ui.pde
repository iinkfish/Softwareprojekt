import java.lang.Math;

class ui { 
  /* Method definition to get the field strength in x, y and z direction */
  public float getMag(int x, int y, int z){
    return sqrt((float)Math.pow(x, 2) + (float)Math.pow(y, 2) + (float)Math.pow(z, 2));
  }
  public int getMagXY(int fe){
    return fe;
  }
  
  
  //public void fieldStrength(int x, int y, int z){
    
  //  mag = sqrt((float)Math.pow(x, 2) + (float)Math.pow(y, 2) + (float)Math.pow(z, 2));
  //  println(mag);
    
  //}    
}
