
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

    try{
      json = parseJSONObject(message);
    } catch (Exception e){
      println("Message did not start with {");
      json = null;
    }
    if (json == null) {
      println(message);
      return false;
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
