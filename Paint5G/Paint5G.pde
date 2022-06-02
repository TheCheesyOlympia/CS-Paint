import java.util.*;
import javax.swing.*;
import java.awt.*;

PImage save;
PImage canvas;
//PImage img;
ArrayList<Brush> brushes;
String currentMode = "None";
Stack<String> mode = new Stack<String>();
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
  mode.push("default");
  //intialize arrays
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
  if(currentMode.equals("pencil")) {
    brushes.get(0).apply(canvas, mouseX, mouseY - 150, c);
  }
  if(currentMode.equals("eraser")) {
    brushes.get(0).apply(canvas, mouseX, mouseY - 150, 255);
  }
}

void mouseDragged() {
  if(currentMode.equals("pencil")) {
    brushes.get(0).apply(canvas, mouseX, mouseY - 150, c);
  }
  if(currentMode.equals("eraser")) {
    brushes.get(0).apply(canvas, mouseX, mouseY - 150, 255);
  }
}

void mouseClicked() {
  
}

void keyPressed() {
  //Color nc = JColorChooser.showDialog(null, "Choose a color", Color.RED);
  //if (nc != null) c = color(nc.getRed(), nc.getGreen(), nc.getBlue(), nc.getAlpha());
}

void draw() {
  //update mode
  currentMode = mode.peek();
  //inputs for mouse
  if (mousePressed == true){
    for(int i = 0; i < buttons.size(); i++) {
      if(buttons.get(i).isPressed()) {
        //detoggle brush options
        if (mode.peek().equals("Pencil")) {
          buttons.get(2).reset();
          mode.pop();
          currentMode = mode.peek();
        } 
        if (mode.peek().equals("Pencil")) {
          buttons.get(3).reset();
          mode.pop();
          currentMode = mode.peek();
        } 
        if (mode.peek().equals("Fill")) {
          buttons.get(4).reset();
          mode.pop();
          currentMode = mode.peek();
        } 
        if (mode.peek().equals("Picker")) {
          buttons.get(5).reset();
          mode.pop();
          currentMode = mode.peek();
        } 
        mode.push(buttons.get(i).getButton());
      }
    }
  }  
  //update buttons
  for(int i = 0; i < buttons.size(); i++) {
    buttons.get(i).updateButton();
  }
  //excecute modes that involve popups
  if (currentMode.equals("Color")) {
    Color nc = JColorChooser.showDialog(null, "Choose a color", Color.RED);
    if (nc != null) c = color(nc.getRed(), nc.getGreen(), nc.getBlue(), nc.getAlpha());
    //close popup
    buttons.get(7).reset();
    mode.pop();
    currentMode = mode.peek();
  }
  image(canvas,0,150);
  text(currentMode, 10, 10);
}
