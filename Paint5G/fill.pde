class fill {
  color c;
  PImage image;
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
  void flood(int startX, int startY, int imgColor, PImage img) {
     img.loadPixels();
     pixel = img.pixels;
     x1 = startX;
     y1 = startY;
     w = img.width;
     h = img.height;
     c = imgColor;
     int oldC = pixel[x1 + y1 * w];
     if(!isValid(startX, startY, pixel, w, h, c)) return;
     if(oldC == c) return;
     Point point = new Point(x1, y1);
     points.add(point);
     while(points.size() > 0) {
       point = points.removeFirst();
       if (isValid(point.x, point.y, pixel, w, h, oldC)) {
         l = r; 
         r = x1;
         while(isValid(w--, point.y, pixel, w, h, oldC)) {
           while(isValid(r++, point.y, pixel, w, h, oldC)) {
             for(int xP = l + 1; xP < r; xP++) {
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
     image = img;
  }
  
  boolean isValid(int x, int y, int[] pxl, int wid, int hei, int c) {
    if(x < 0 && y < 0 && x >= wid && y >= height) {
      return false;
    }
    return (pxl[x + y * wid] == c);
  }
  
  PImage getResult() {
    return image;
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
