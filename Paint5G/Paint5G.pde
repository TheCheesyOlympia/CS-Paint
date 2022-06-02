import java.util.*;
import javax.swing.*;
import java.awt.*;

PImage save;
PImage canvas;
//PImage img;
ArrayList<Brush> brushes;
int mode;
color c;
ArrayList<Button> buttons;
//Buttons


void setup(){
  size(1080,870);
  canvas = loadImage("blankCanvas.png");
  save = canvas.copy();
  c = color(0,0,0);
  brushes = new ArrayList<Brush>();
  buttons = new ArrayList<Button>();
  brushes.add(new Brush(new float[25][25]));
  //intialize buttons
  
}

void mousePressed() {
  brushes.get(0).apply(canvas, mouseX, mouseY - 150, c);
}

void mouseDragged() {
  brushes.get(0).apply(canvas, mouseX, mouseY - 150, c);
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
