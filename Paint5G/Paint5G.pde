PImage save;
PImage editable;
int click = 0;
int draw = 1;
int erase = 2;
int mode;
Taskbar input;

void setup(){
  size(1280,720);
  editable = loadImage("blankCanvas.png");
  save = editable;
  image(save,200,0);
  input = new Taskbar();
  mode = click;
}

void mousePressed() {
  input.press(keyCode);
}

void mouseReleased() {
  input.release(keyCode);
}

void draw() {
  if (mode == click);
  
  //Visualize which keys are being held down...
  if (input.isPressed(Taskbar.P1_LEFT)) {
    rect(10, 10, 10, 10);  }
  if (input.isPressed(Taskbar.P1_RIGHT)) {
    rect(30, 10, 10, 10);
  }
  fill(0);
  text("Try pressing one or more\n of: WASD keys", 10, 50);
}
