class parseCommunication{
  private int a;
  private int d;
  private int h;
  private int x;
  private int y;
  private int z;
  private int s;
  private int f;
  
  public void dataSet(String message){
    JSONObject json = parseJSONObject(message);
    if (json == null) {
      println("JSONObject could not be parsed");
    } else {
      this.a = json.getInt("a");
      this.d = json.getInt("d");
      this.h = json.getInt("h");
      this.x = json.getInt("x");
      this.y = json.getInt("y");
      this.z = json.getInt("z");
      this.s = json.getInt("s");
      this.f = json.getInt("f");
    }
  }
}
