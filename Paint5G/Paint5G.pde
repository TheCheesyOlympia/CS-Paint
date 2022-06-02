PImage save;
PImage editable;
int click = 0;
Brush[] brushes;
import java.util.*;
import javax.swing.colorchooser.*;
int mode;
color Color;
//Taskbar input;

void setup(){
  size(1080,870);
  editable = loadImage("blankCanvas.png");
  save = editable;
  image(editable,0,150);
  //input = new Taskbar();
  mode = click;
  Color = color(0,0,0);
  brushes = new Brush[7];
  brushes[0] = new Brush(new float[25][25]);
}

void mousePressed() {
  brushes[0].apply(editable, mouseX, mouseY - 150, Color);
}

void mouseReleased() {
  
}

void mouseDragged() {
  brushes[0].apply(editable, mouseX, mouseY - 150, Color);
}

void mouseClicked() {
  
}



void draw() {
  if (mousePressed == true){
    image(editable,0,150);
  }
  
}
