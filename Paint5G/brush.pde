class brush {
  color c;
  int x, y, x1, y1;
  
  public brush(int setX, int setY, int startX, int startY, color setC) {
    x = setX;
    y = setY;
    x1 = startX;
    y1 = startY;
    c = setC;
  }
  void paint(Sketch s) {
    s.pg.beginDraw();
    s.pg.pushStyle();
    
    s.pg.popStyle();
    s.pg.endDraw();
  }
  
}
