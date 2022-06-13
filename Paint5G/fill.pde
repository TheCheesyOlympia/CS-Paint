class fill {
  color c;
  PImage img;
  int x1, y1, l, r, h, w;
  ArrayDeque<Point> points;
  int[] pixel;
  
  public fill() {
    points = new ArrayDeque<Point>();
    pixel = new int[100];
    x1 = 0;
    y1 = 0;
    l = 0;
    r = 0;
    h = 0;
    w = 0;
    c = color(0);
  }
  //floodfill algorithim
  PImage flood(int startX, int startY, int imgColor, PImage img) {
     img.loadPixels();
     pixel = img.pixels;
     x1 = startX;
     y1 = startY;
     w = img.width;
     h = img.height;
     c = imgColor;
     int oldC = pixel[x1 + y1 * w];
     if(!isValid(startX, startY, pixel, w, h, c)) return img;
     if(oldC == c) return img;
     Point point = new Point(x1, y1);
     points.add(point);
     while(points.size() > 0) {
       point = points.removeFirst();
       if (isValid(point.x, point.y, pixel, w, h, oldC)) {
         l = r; 
         r = x1;
         while(isValid(w--, point.y, pixel, w, h, oldC)) {
           while(isValid(r++, point.y, pixel, w, h, oldC)) {
             for(int xP = l + 1; x < r; x++) {
               pixel[xP + point.y * w] = c;
               if(isValid(xP, point.y - 1, pixel, w, h, oldC)) {
                 points.add(new Point(xP, point.y - 1));
               }
               if(isValid(xP, point.y + 1, pixel, w, h, oldC)) {
                 points.add(new Point(xP, point.y + 1));
               }
             }
           }
         } 
       }
     }
     img.updatePixels();
     return img;
  }
  
  boolean isValid(int x, int y, int[] pxl, int wid, int hei, int c) {
    if(x < 0 && y < 0 && x >= wid && y >= height) {
      return false;
    }
    return (pxl[x + y * wid] == c);
  }
  
  void setColor(color newC) {
    c = newC;
  }
  void setColor(int red, int green, int blue) {
    c = color(red, green, blue);
  }
}

class Point {
  int x, y;
  public Point(int X, int Y) {
    x = X;
    y = Y;
  }
}
