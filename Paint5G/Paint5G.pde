import java.util.*;
import javax.swing.*;
import java.awt.*;

//PGraphics save;
PGraphics canvas;
PImage img;
int click = 0;
Brush[] brushes;
int mode;
color c;
//Taskbar
JFrame f;
JButton b, b1, b2;
JLabel l;

void setup(){
  frameRate(60);
  size(1080,870);
  canvas = createGraphics(1080,720);
  img = loadImage("redcar.png");
  //save = canvas.copy();
  image(canvas,0,150);
  mode = click;
  c = color(0,0,0);
  brushes = new Brush[7];
  brushes[0] = new Brush(new float[25][25]);

}

void mousePressed() {
  brushes[0].apply(canvas, mouseX, mouseY - 150, c);
}

void mouseDragged() {
  brushes[0].apply(canvas, mouseX, mouseY - 150, c);
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
  image(canvas,0,150);
  
}
