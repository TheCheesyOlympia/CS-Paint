public class KernelBrush {
  float[][]brush;

  public KernelBrush(float[][]size) {
    brush = size;
  }
  
  void apply(Sketch image, int x, int y, color newColor) {
    for(int i = 0; i < brush.length; i++) {
      for(int j = 0; j < brush[0].length; j++) {
        if(isValid(x + i, y + j, image) == true) {
          image.pg.set(x + i, y + j, newColor);
        }
      }
    } 
  }
  
  boolean isValid(int x, int y, Sketch image) {
    return(x >= 0 && y >= 0 && x < image.pg.width && y < image.pg.height);
  }
  
  void applyCanvas(Sketch image, color fill) {
    for(int x = 0; x < image.pg.width; x++) {
      for(int y = 0; y < image.pg.height; y++) {
        image.pg.set(x ,y ,fill);
      } 
    }
  }
  
  int getSize()   {
    return brush.length;
  }
}
