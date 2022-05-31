public class Brush {
  float[][]brush;

  public Brush(float[][]size) {
    brush = size;
  }
  
  void apply(PImage image, int x, int y, color newColor) {
    
  }
  
  void applyCanvas(PImage image, color fill) {
    for(int x = 0; x < image.width; x++) {
      for(int y = 0; y < image.height; y++) {
        image.set(x ,y ,fill);
      } 
    }
  }
}
