class fill {
  color c;
  PImage img;
  int w, h;
  ArrayDeque<Point> p = new ArrayDeque<Point>();
  
  public fill(int setX, int setY, int startX, int startY, color setC, int brushSize) {
    
  }
  //floodfill algorithim
  void flood() {
    
  }
  void setColor(color newC) {
    c = newC;
  }
  void setColor(int red, int green, int blue) {
    c = color(red, green, blue);
  }
}
