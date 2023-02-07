
class parseCommunication{
  private int a;
  private int d;
  private int h;
  private int x;
  private int y;
  private int z;
  private int s;
  private int f;
  private int fe;
  private JSONObject json = null;

  
  public boolean dataSet(String message){
  /* A built in processing method is used to decode a string in json format. The object is null if no the input string is nnot in the right format.  
     This is used to determine if a received message is in json format or just a simple string
  */
    try{
      json = parseJSONObject(message);
    } catch (Exception e){
      println("Message did not start with {");
      json = null;
    }
    if (json == null) {
      println(message);
      return false;                      //return false to let the main program know that no json string was parsed to not increment the counter 
    } else {
      this.a = json.getInt("a");
      this.d = json.getInt("d");
      this.h = json.getInt("h");
      this.x = json.getInt("x");
      this.y = json.getInt("y");
      this.z = json.getInt("z");
      this.s = json.getInt("s");
      this.f = json.getInt("f");
      this.fe =json.getInt("FE");
      return true;
    }
  }
}
