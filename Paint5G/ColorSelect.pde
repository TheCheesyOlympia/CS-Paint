public class ColorSelect extends Button {
  int x, y, h, w, x2, y2, fontSize, c, Color;
  String name;
  boolean isClickable = false;
  boolean isPressed = false;
  color bc;
  
  public ColorSelect(int setX, int setY, int setH, int setW, 
  String t, int s, int corner, color Color) {
    super(setX, setY, setH, setW, t, s, corner);
    bc = Color;
  }
  
  void drawButton(color c) {
    smooth();
    fill(c);
    stroke(0);
    rect(x, y, w, h, c);
    fill(0);
    textSize(fontSize);
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
    {drawButton(bc);}
  }
}
