public class Brush {
  float[][]brush;

  public Brush(float[][]size) {
    brush = size;
  }
  
  void apply(PImage image, int x, int y, color newColor) {
    for(int i = 0; i < brush.length; i++) {
      for(int j = 0; j < brush[0].length; j++) {
        if(isValid(x + i, y + j, image) == true) {
          image.set(x + i, y + j, newColor);
        }
      }
    } 
  }
  
  boolean isValid(int x, int y, PImage image) {
    return(x >= 0 && y >= 0 && x < image.width && y < image.height);
  }
  
  void applyCanvas(PImage image, color fill) {
    for(int x = 0; x < image.width; x++) {
      for(int y = 0; y < image.height; y++) {
        image.set(x ,y ,fill);
      } 
    }
  }
  
  int getSize()   {
    return brush.length;
  }
}
