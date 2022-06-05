class Sketch {
  PGraphics pg;
  public Sketch(int w, int h, int c) {
    pg = createGraphics(w,h);
    pg.beginDraw();
    pg.background(c);
    pg.endDraw();
  }
  void addImage(PImage img) {
    pg.image(img,img.width,img.height);
  }
}
