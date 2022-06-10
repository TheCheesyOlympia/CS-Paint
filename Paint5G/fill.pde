class fill {
  color c;
  int x, y, x1, y1, size;
  
  public fill(int setX, int setY, int startX, int startY, color setC, int brushSize) {
    x = setX;
    y = setY;
    x1 = startX;
    y1 = startY;
    c = setC;
    size = brushSize;
  }
  void paint(PGraphics s) {
    s.beginDraw();
    s.pushStyle();
    s.stroke(c);
    s.strokeWeight(size);
    s.line(x,y,x1,y1);
    s.popStyle();
    s.endDraw();
  }
  
  void setColor(color newC) {
    c = newC;
  }
  
  void setColor(int red, int green, int blue) {
    c = color(red, green, blue);
  }
}
