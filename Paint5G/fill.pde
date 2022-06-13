class fill {
  color c;
  PImage img;
  int x, y, h, w;
  ArrayDeque<Point> p;
  int[] pixels;
  
  public fill(PImage img) {
    p = new ArrayDeque<Point>();
    pixels = img.pixels;
    x = 0;
    y = 0;
    h = 0;
    w = 0;
    c = color(0);
  }
  //floodfill algorithim
  void flood(int startX, int startY, int newColor, PImage img) {
    
  }
  void setColor(color newC) {
    c = newC;
  }
  void setColor(int red, int green, int blue) {
    c = color(red, green, blue);
  }
}
