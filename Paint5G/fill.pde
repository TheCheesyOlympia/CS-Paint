class fill {
  color c;
  PImage img;
  int x, y, h, w;
  ArrayDeque<Point> p;
  int[] pixels;
  
  public fill() {
    p = new ArrayDeque<Point>();
    pixels = new int[100];
    x = 0;
    y = 0;
    h = 0;
    w = 0;
    c = color(0);
  }
  //floodfill algorithim
  void flood(int startX, int startY, int newColor, PImage img) {
     img.loadPixels();
     pixels = img.pixels;
     w = img.width;
     h = img.height;
     
  }
  
  void setColor(color newC) {
    c = newC;
  }
  void setColor(int red, int green, int blue) {
    c = color(red, green, blue);
  }
}
