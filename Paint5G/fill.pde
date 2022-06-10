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
  void paint(Sketch s) {
    s.pg.beginDraw();
    s.pg.pushStyle();
    s.pg.stroke(c);
    s.pg.strokeWeight(size);
    s.pg.line(x,y,x1,y1);
    s.pg.popStyle();
    s.pg.endDraw();
  }
  
  void setColor(color newC) {
    c = newC;
  }
  
  void setColor(int red, int green, int blue) {
    c = color(red, green, blue);
  }
}
