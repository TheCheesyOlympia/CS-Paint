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
Button Save;
Button SelectColor;
Button Pencil;
Button Eraser;
Button Fill;
Button BrushSize;
Button Brushes;
Button Undo;
Button Redo;

void setup(){
  size(1080,870);
  background(245);
  canvas = loadImage("blankCanvas.png");
  save = canvas.copy();
  c = color(0,0,0);
  brushes = new ArrayList<Brush>();
  buttons = new ArrayList<Button>();
  brushes.add(new Brush(new float[25][25]));
  //intialize buttons
  Save = new Button(15, 15, 120, 80,"Save", 25);
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
