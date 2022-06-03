public class Button {
  int x, y, h, w, x2, y2, fontSize, c;
  String name;
  boolean isClickable = false;
  boolean isPressed = false;
  
  public Button(int setX, int setY, int setH, int setW, 
  String t, int s, int corner) {
    x = setX;
    y = setY;
    h = setH;
    w = setW;
    x2 = x + w;
    y2 = y + h;
    name = t;
    fontSize = s;
    c = corner;
  }
  
  void drawButton(int r, int g, int b) {
    smooth();
    fill(r, g, b);
    stroke(0);
    rect(x, y, w, h, c);
    fill(0);
    textSize(fontSize);
    text(name, x + w / 2 - (textWidth(name) / 2), y + (h / 2));
  }
  
  void updateButton() {   
    //Check if hovering
    if(mouseX > x && mouseY > y && mouseX < x2 && mouseY < y2) {
      isClickable = true;
      
      //Check if pressed
      if (mousePressed) {isPressed = !isPressed;} 
    }
    else {isClickable = false;}
    //shade button
    if(isPressed) {drawButton(0,224,242); return;}
    if(isClickable) {drawButton(0,242,242); return;}
    {drawButton(255,255,255);}
  }
  
  boolean isPressed() {
    return isPressed;
  }
  
  String getButton() {
    return name;
  }
  
  void reset() {
    isPressed = false;
  }
}
