import java.util.*;
import javax.swing.*;
import java.awt.*;

PImage save;
PImage editable;
int click = 0;
Brush[] brushes;
int mode;
color c;
//Taskbar input;

void setup(){
  frameRate(60);
  size(1080,870);
  editable = loadImage("blankCanvas.png");
  save = editable;
  image(editable,0,150);
  //input = new Taskbar();
  mode = click;
  c = color(0,0,0);
  brushes = new Brush[7];
  brushes[0] = new Brush(new float[25][25]);
  
}

void mousePressed() {
  brushes[0].apply(editable, mouseX, mouseY - 150, c);
}

void mouseDragged() {
  brushes[0].apply(editable, mouseX, mouseY - 150, c);
}

void mouseClicked() {
  
}

void keyPressed() {
  Color nc = JColorChooser.showDialog(null, "Choose a color", Color.RED);
  if (nc != null) c = color(nc.getRed(), nc.getGreen(), nc.getBlue(), nc.getAlpha());
}

void draw() {
  if (mousePressed == true){
    
  }  
  image(editable,0,150);
  
}
