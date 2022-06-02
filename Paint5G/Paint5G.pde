import java.util.*;
import javax.swing.*;
import java.awt.*;

PImage save;
PImage canvas;
//PImage img;
ArrayList<Brush> brushes;
String mode;
color c;
ArrayList<Button> buttons;
//Buttons
Button Open;
Button Brushes;
Button Pencil;
Button Eraser;
Button Fill;
Button Picker;
Button BrushSize;
Button ColorChooser;
Button Save;
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
  buttons.add(Open = new Button(15, 15, 120, 100,"Open", 25, 20));
  
  buttons.add(Brushes = new Button(150, 15, 120, 120, "Brushes", 25, 20));
  
  buttons.add(Pencil = new Button(295, 15, 25, 155, "Pencil", 15, 5));
  buttons.add(Eraser = new Button(295, 45, 25, 155, "Eraser", 15, 5));
  buttons.add(Fill = new Button(295, 75, 25, 155, "Fill", 15, 5));
  buttons.add(Picker = new Button(295, 105, 25, 155, "Picker", 15, 5));
  
  buttons.add(BrushSize = new Button(475, 15, 120, 120, "Size & Tips", 20, 20));
  
  buttons.add(ColorChooser = new Button (645, 15, 120, 80,"Color", 20, 10));
  
  buttons.add(Undo = new Button (830, 15, 50, 50, "Undo", 15, 10));
  buttons.add(Redo = new Button (890, 15, 50, 50, "Redo", 15, 10));
  
  buttons.add(Save = new Button (950, 15, 100, 100, "Save", 20, 10));
  //Partitions
  line(132,0,132,150);
  line(620,0,620,150);
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
  //Color nc = JColorChooser.showDialog(null, "Choose a color", Color.RED);
  //if (nc != null) c = color(nc.getRed(), nc.getGreen(), nc.getBlue(), nc.getAlpha());
}

void draw() {
  if (mousePressed == true){
    for(int i = 0; i < buttons.size(); i++) {
      buttons.get(i).updateButton();
    }
  }  
  for(int i = 0; i < buttons.size(); i++) {
    buttons.get(i).updateButton();
  }
  image(canvas,0,150);
  
}
