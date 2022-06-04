public class ColorSelect extends Button {
  int x, y, h, w, x2, y2, fontSize, c, Color;
  color bc;
  
  public ColorSelect(int setX, int setY, int setH, int setW, 
  String t, int s, int corner, color Color) {
    x = setX;
    y = setY;
    h = setH;
    w = setW;
    x2 = x + w;
    y2 = y + h;
    name = t;
    fontSize = s;
    c = corner;    
    bc = Color;
  }
  
  void drawButton() {
    smooth();
    fill(bc);
    stroke(0);
    rect(x, y, w, h, c);
    fill(getContrastColor(bc));
    textSize(fontSize);
    text(name, x + w / 2 - (textWidth(name) / 2), y + h - 5);
  }
  
  color getContrastColor(color c) {
    float y = (255 - red(bc) + 255 - green(bc) + 255 - blue(bc)) / 3;
    return (color)y;
  }
  
  void updateButton() {   
    //Check if hovering
    if(mouseX > x && mouseY > y && mouseX < x2 && mouseY < y2) {
      isClickable = true;
   
      //Check if pressed
      if (mousePressed) {isPressed = !isPressed;} 
    }
    else {isClickable = false;}
    if(isPressed) {drawButton(); return;}
    if(isClickable) {drawButton(); return;}
    {drawButton();}
  }
  
  void updateColor(color newColor) {
    bc = newColor;
  }
}
