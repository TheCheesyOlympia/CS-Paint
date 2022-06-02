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
Button Brushes;
Button Pencil;
Button Eraser;
Button Fill;
Button Picker;
Button BrushSize;
Button ColorChooser;
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
  //intialize buttons (setX, setY, setH, setW, text, font size, corner radius)
  buttons.add(Save = new Button(15, 15, 120, 100,"Save", 25, 20));
  
  buttons.add(Brushes = new Button(150, 15, 120, 120, "Brushes", 25, 20));
  
  buttons.add(Pencil = new Button(300, 15, 25, 150, "Pencil", 15, 5));
  buttons.add(Eraser = new Button(300, 45, 25, 150, "Eraser", 15, 5));
  buttons.add(Fill = new Button(300, 75, 25, 150, "Fill", 15, 5));
  buttons.add(Picker = new Button(300, 105, 25, 150, "Picker", 15, 5));
  
  buttons.add(ColorChooser = new Button (500, 15, 120, 80,"Color", 20, 10));
  //Partitions
  line(132,0,132,150);
  line(475,0,475,150);
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
  for(int i = 0; i < buttons.size(); i++) {
    buttons.get(i).drawButton();
  }
  image(canvas,0,150);
  
}
