PImage save;
PImage editable;
int click = 0;
Brush[] brushes;
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
  brushes = new Brush[7];
  brushes[0] = new Brush(new float[5][5]);
}

void mousePressed() {
  brushes[0].apply(editable, mouseX, mouseY, Color);
}

void mouseReleased() {
  
}

void mouseDragged() {
  brushes[0].apply(editable, mouseX, mouseY, Color);
}

void mouseClicked() {
  
}



void draw() {
  if (mousePressed == true) {
    image(editable,0,0);
  }
  
}
