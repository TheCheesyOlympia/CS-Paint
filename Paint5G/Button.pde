public class Button {
  String name;
  boolean isClickable = false;
  boolean isPressed = false;
  int x = 15;
  int y = 15;
  int w = 15;
  int h = 15;
  int f = 10;
  int x2 = 30;
  int y2 = 30;
  
  void drawButton(int r, int g, int b) {
    smooth();
    fill(r, g, b);
    stroke(0);
    rect(x, y, w, h, c);
    fill(0);
    textSize(10);
    text(name, x + w / 2 - (textWidth(name) / 2), y + h - 5);
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
  
  String getMode() {
    return null;
  }
  
  void reset() {
    isPressed = false;
  }
}
