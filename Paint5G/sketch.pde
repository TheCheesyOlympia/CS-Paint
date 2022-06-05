class Sketch {
  PGraphics pg;
  public Sketch(int w, int h) {
    pg = createGraphics(w,h);
  }
  void addImage(PImage img) {
    pg.image(img,img.width,img.height);
  }
}
