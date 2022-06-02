class Button {
  int x, y, h, w, x2, y2, fontSize;
  String name;
  boolean isClickable = false;
  boolean isPressed = false;
  
  public Button(int setX, int setY, int setH, int setW, String t, int s) {
    x = setX;
    y = setY;
    h = setH;
    w = setW;
    x2 = x + w;
    y2 = y + h;
    name = t;
    fontSize = s;
  }
  
  void drawButton() {
    smooth();
    fill(255);
    stroke(0);
    rect(x, y, w, h, 5);
    fill(0);
    textSize(fontSize);
    text(name, x + w / 2 - (textWidth(name) / 2), y + h / 2 + (textAscent() / 2));
  }
}
