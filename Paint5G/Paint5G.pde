import controlP5.*;
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
  size(1080,870);
  editable = loadImage("blankCanvas.png");
  save = editable;
  image(editable,0,150);
  //input = new Taskbar();
  mode = click;
  c = color(0,0,0);
  brushes = new Brush[7];
  brushes[0] = new Brush(new float[25][25]);
  fill(0, 80);
  rect(50, 90, 275, 80);
  
}

void mousePressed() {
  brushes[0].apply(editable, mouseX, mouseY - 150, c);
}

void mouseReleased() {
  
}

void mouseDragged() {
  brushes[0].apply(editable, mouseX, mouseY - 150, c);
}

void mouseClicked() {
  
}

void draw() {
  if (mousePressed == true){
    image(editable,0,150);
  }  
  javax.swing.SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                createAndShowGUI();
            }
        });
}
