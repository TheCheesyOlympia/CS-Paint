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

//Buttons (NOTE TO SELF: ALL BUTTONS SHOULD HAVE THEIR
//OWN SUBCLASSES OF BUTTON FOR EASIER IMPLEMENTATION)
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
  
  //draw modes (cannot be selected at the same time)
  buttons.add(Pencil = new Button(295, 15, 25, 155, "Pencil", 15, 5));
  buttons.add(Eraser = new Button(295, 45, 25, 155, "Eraser", 15, 5));
  buttons.add(Fill = new Button(295, 75, 25, 155, "Fill", 15, 5));
  buttons.add(Picker = new Button(295, 105, 25, 155, "Picker", 15, 5));
  //popups
  buttons.add(Open = new Button(15, 15, 120, 100,"Open", 25, 20));
  buttons.add(Brushes = new Button(150, 15, 120, 120, "Brushes", 25, 20));
  buttons.add(BrushSize = new Button(475, 15, 120, 120, "Size & Tips", 20, 20));
  buttons.add(ColorChooser = new Button (645, 15, 120, 80,"Color", 20, 10));
  //single actions
  buttons.add(Undo = new Button (830, 15, 50, 50, "Undo", 15, 10));
  buttons.add(Redo = new Button (890, 15, 50, 50, "Redo", 15, 10));
  buttons.add(Save = new Button (950, 15, 100, 100, "Save", 20, 10));
  
  //lines for organization's sake
  line(132,0,132,150);
  line(620,0,620,150);
  line(0, 149, width, 149); 
}

void draw() {
  //update mode
  currentMode = mode.peek();
  //inputs for mouse
  if (mousePressed == true && mouseY <= 150){
    for(int i = 0; i < buttons.size(); i++) {
      if(buttons.get(i).isPressed()) {
        //detoggle brush options if another brush option is selected
        if (mode.peek().equals("Pencil") && i < 4 && i != 0)  {
          buttons.get(0).reset();
          mode.pop();
          currentMode = mode.push(buttons.get(i).getButton());
        } 
        if (mode.peek().equals("Eraser") && i < 4 && i != 1) {
          buttons.get(1).reset();
          mode.pop();
          currentMode = mode.push(buttons.get(i).getButton());
        } 
        if (mode.peek().equals("Fill") && i < 4 && i != 2) {
          buttons.get(2).reset();
          mode.pop();
          currentMode = mode.push(buttons.get(i).getButton());
        } 
        if (mode.peek().equals("Picker") && i < 3) {
          buttons.get(3).reset();
          mode.pop();
          currentMode = mode.push(buttons.get(i).getButton());
        }
        //overflow protection
        if(!mode.peek().equals(buttons.get(i).getButton())) {
          mode.push(buttons.get(i).getButton());
        }
      }
    }
  }  
  //excecute modes that involve popups
  if (currentMode.equals("Color")) {
    Color nc = JColorChooser.showDialog(null, "Choose a color", Color.RED);
    if (nc != null) c = color(nc.getRed(), nc.getGreen(), nc.getBlue(), nc.getAlpha());
    //close popup
    mode.pop();
    currentMode = mode.peek();
    buttons.get(7).reset();
  }
  if (currentMode.equals("Open")) {
    selectInput("Select a file to process:", "fileSelected");
    //close popup
    mode.pop();
    currentMode = mode.peek();
    buttons.get(4).reset();
  }
  //update buttons
  for(int i = 0; i < buttons.size(); i++) {
    buttons.get(i).updateButton();
  }
  image(canvas,0,150);
  text(currentMode, 10, 10);
}
void mousePressed() {
  if(currentMode.equals("Pencil")) {
    brushes.get(0).apply(canvas, mouseX, mouseY - 150, c);
  }
  if(currentMode.equals("Eraser")) {
    //eraser sets to white for now, proper erase function at a later date
    color white = color(255,255,255);
    brushes.get(0).apply(canvas, mouseX, mouseY - 150, white);
  }
}

void mouseDragged() {
  if(currentMode.equals("Pencil")) {
    brushes.get(0).apply(canvas, mouseX, mouseY - 150, c);
  }
  if(currentMode.equals("Eraser")) {
    //eraser sets to white for now, proper erase function at a later date
    color white = color(255,255,255);
    brushes.get(0).apply(canvas, mouseX, mouseY - 150, white);
  }
}

void mouseClicked() {
  
}

void keyPressed() {
  //temporary brush size adjustment with keybind (DEMO ONLY)
  int oldSize = brushes.get(0).getSize();
  if(keyCode == UP) {
    if(oldSize <= 50) {
      brushes.set(0, (new Brush(new float[oldSize + 5][oldSize + 5])));
    }
  }
  if(keyCode == DOWN) {
    if(oldSize > 5) {
      brushes.set(0, (new Brush(new float[oldSize - 5][oldSize - 5])));
    }
    else {
      brushes.set(0, (new Brush(new float[1][1])));
    }
  }
  //Color nc = JColorChooser.showDialog(null, "Choose a color", Color.RED);
  //if (nc != null) c = color(nc.getRed(), nc.getGreen(), nc.getBlue(), nc.getAlpha());
}

void fileSelected(File selection) {
  if (selection != null) {
    save = canvas.copy();
    canvas = loadImage(selection.getAbsolutePath());
  }
}
