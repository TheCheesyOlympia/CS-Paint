PImage save;
PImage editable;
int click = 0;
Brush[] brushSize;
int mode;
color Color;
//Taskbar input;

void setup(){
  size(1080,720);
  editable = loadImage("blankCanvas.png");
  save = editable;
  image(editable,0,0);
  //input = new Taskbar();
  mode = click;
  Color = color(0,0,0);
}

void mousePressed() {
  Brush.applyCanvas(editable, Color);
}

void mouseReleased() {
  
}

void mouseDragged() {
  
}

void mouseClicked() {
  
}



void draw() {
  if (mousePressed == true) {
    image(editable,0,0);
  }
  
}
