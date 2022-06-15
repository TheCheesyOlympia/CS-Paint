import java.util.*;
import javax.swing.*;
import java.awt.*;

String currentMode;
Stack<String> mode = new Stack<String>();
color c;
int paintsize;
//Arrays
ArrayList<KernelBrush> brushes;
ArrayList<Button> buttons;
ArrayDeque<PImage> canvas;
ArrayDeque<PImage> redo;

//Buttons (NOTE TO SELF: ALL BUTTONS SHOULD HAVE THEIR
//OWN SUBCLASSES OF BUTTON FOR EASIER IMPLEMENTATION)
Button Import;
Button Brushes;
Button Pencil;
Button Eraser;
Button Fill;
Button Picker;
Button Save;
ColorSelect ColorChooser;
Button Export;
Button Undo;
Button Redo;

void setup(){
  size(1080,870);
  background(245);
  canvas = new ArrayDeque<PImage>();
  redo = new ArrayDeque<PImage>();
  PImage bg = loadImage("blankCanvas.png");
  canvas.addFirst(bg);
  c = color(0,0,0);
  mode.push("default");
  currentMode = mode.peek();
  //intialize arrays
  brushes = new ArrayList<KernelBrush>();
  buttons = new ArrayList<Button>();
  brushes.add(new KernelBrush(new float[25][25]));
  
  //intialize buttons (setX, setY, setH, setW, text, font size, corner radius)
  
  //draw modes (cannot be selected at the same time)
  buttons.add(Pencil = new DrawMode(295, 15, 25, 155, "Pencil", 15, 5, "d"));
  buttons.add(Eraser = new DrawMode(295, 45, 25, 155, "Eraser", 15, 5, "e"));
  buttons.add(Fill = new DrawMode(295, 75, 25, 155, "Fill", 15, 5, "f"));
  buttons.add(Picker = new DrawMode(295, 105, 25, 155, "Picker", 15, 5, "p"));
  buttons.add(Brushes = new DrawMode(150, 15, 120, 120, "Brushes", 25, 20, "b"));
  //popups
  buttons.add(Import = new Popup(15, 15, 120, 100,"Import", 25, 20));
  buttons.add(Save = new Popup(475, 15, 120, 120, "Save", 20, 20));
  buttons.add(Export = new Popup (950, 15, 100, 100, "Export", 20, 10));
  //color
  buttons.add(ColorChooser = new ColorSelect(645, 15, 120, 80,"Color", 20, 10, c));
  //single actions
  buttons.add(Undo = new SingleAction (830, 15, 50, 50, "Undo", 15, 10));
  buttons.add(Redo = new SingleAction (890, 15, 50, 50, "Redo", 15, 10));
  
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
      if(buttons.get(i).isPressed() && i < 5) {
        //detoggle brush options if another brush option is selected
        if (mode.peek().equals("d") && i != 0)  {
          buttons.get(0).reset();
          mode.pop();
          currentMode = mode.push(buttons.get(i).getMode());
        } 
        if (mode.peek().equals("e") && i != 1) {
          buttons.get(1).reset();
          mode.pop();
          currentMode = mode.push(buttons.get(i).getMode());
        } 
        if (mode.peek().equals("f") && i != 2) {
          buttons.get(2).reset();
          mode.pop();
          currentMode = mode.push(buttons.get(i).getMode());
        } 
        if (mode.peek().equals("p") && i != 3) {
          buttons.get(3).reset();
          mode.pop();
          currentMode = mode.push(buttons.get(i).getMode());
        }
        if (mode.peek().equals("b") && i != 4) {
          buttons.get(4).reset();
          mode.pop();
          currentMode = mode.push(buttons.get(i).getMode());
        }
        //overflow protection
        if(!(mode.peek().equals(buttons.get(i).getButton()))) {
          if(buttons.get(i).getMode() != null){
            mode.push(buttons.get(i).getMode());
          }
        }
      }
    }
  } 
  //update buttons
  for(int i = 0; i < buttons.size(); i++) {
    buttons.get(i).updateButton();
  }
  image(canvas.getFirst(),0,150);
  text("Use + and - to adjust brush size", 750, 135);
}
void mousePressed() {
  if(currentMode.equals("d")) {
    brushes.get(0).apply(canvas.getFirst(), mouseX, mouseY - 150, c);
    redo.clear();
  }
  if(currentMode.equals("e")) {
    //eraser sets to white for now, proper erase function at a later date
    color white = color(255,255,255);
    brushes.get(0).apply(canvas.getFirst(), mouseX, mouseY - 150, white);
    redo.clear();
  }
  if(currentMode.equals("p")) {
    color temp = canvas.getFirst().get(mouseX, mouseY - 150);
    c = temp;
  }
  if(currentMode.equals("f")) {
    fill bucket = new fill();
    PImage temp = canvas.getFirst();
    bucket.flood(mouseX, mouseY - 150, c, temp); 
    PImage result = bucket.getResult();
    canvas.addFirst(result);
  }
}

void mouseDragged() {
  if(currentMode.equals("d")) {
    brushes.get(0).apply(canvas.getFirst(), mouseX, mouseY - 150, c);
    redo.clear();
  }
  if(currentMode.equals("e")) {
    //eraser sets to white for now, proper erase function at a later date
    color white = color(255,255,255);
    brushes.get(0).apply(canvas.getFirst(), mouseX, mouseY - 150, white);
    redo.clear();
  }
}

void mouseClicked() {
  //excecute buttons that involve popups
  if (ColorChooser.isPressed()) {
    Color nc = JColorChooser.showDialog(null, "Choose a color", Color.black);
    if (nc != null) c = color(nc.getRed(), nc.getGreen(), nc.getBlue(), nc.getAlpha());
    ColorChooser.updateColor(c);
    //close popup
    buttons.get(8).reset();
  }
  if (Import.isPressed()) {
    selectInput("Select a file to process:", "inputSelected");
    //close popup
    buttons.get(5).reset();
  }
  if (Export.isPressed()) {
    selectFolder("Select a folder to process:", "folderSelected");
    //close popup
    buttons.get(7).reset();
  }
  //execute actions
  if (Save.isPressed()) {
    PImage save = canvas.peek();
    canvas.addFirst(save);
    println("saved drawing");
    buttons.get(6).reset();
  }
  if (Undo.isPressed()) {
    if(canvas.size() > 1) {
      redo.addFirst(canvas.removeFirst());
      println("undid 1 step");
      buttons.get(9).reset();
    }
  }
  if (Redo.isPressed()) {
    if(redo.size() > 0) {
      canvas.addFirst(redo.removeLast());
      println("redid 1 step");
      buttons.get(10).reset();
    }
  }
}

void keyPressed() {
  //brush size adjustment with keybind (DEMO ONLY)
  int oldSize = brushes.get(0).getSize();
  if(key == '+') {
    if(oldSize <= 50) {
      brushes.set(0, (new KernelBrush(new float[oldSize + 5][oldSize + 5])));
    }
  }
  if(key == '-') {
    if(oldSize > 5) {
      brushes.set(0, (new KernelBrush(new float[oldSize - 5][oldSize - 5])));
    }
    else {
      brushes.set(0, (new KernelBrush(new float[1][1])));
    }
  }
  if(key == 's') {
    PImage save = canvas.peek();
    canvas.addFirst(save);
    println("saved drawing");
  }
  if(key == 'z') {
    if(canvas.size() > 1) {
      redo.addFirst(canvas.removeFirst());
      println("undid 1 step");
    }
  }
  if(key == 'y') {
    if(redo.size() > 0) {
      canvas.addFirst(redo.removeLast());
      println("redid 1 step");
    }
  }
  //Color nc = JColorChooser.showDialog(null, "Choose a color", Color.RED);
  //if (nc != null) c = color(nc.getRed(), nc.getGreen(), nc.getBlue(), nc.getAlpha());
}

void inputSelected(File selection) {
  if (selection != null) {
    PImage temp = canvas.getFirst();
    temp = loadImage(selection.getAbsolutePath());
    canvas.addFirst(temp);
  }
}

void folderSelected(File selection) {
   if (selection != null) {
    PImage s = canvas.getFirst();
    s.save(selection.getAbsolutePath() + "//Paint5G.PNG");
    println("image exported sucessfully");
  }
}
