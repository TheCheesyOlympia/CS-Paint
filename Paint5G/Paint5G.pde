PImage save;
PImage editable;
int mode;
Taskbar input;

void setup(){
  size(1280,720);
  editable = loadImage("blankCanvas.png");
  save = editable;
  image(save,200,0);
  input = new Taskbar();
}

void keyPressed() {
  input.press(keyCode);
}

void keyReleased() {
  input.release(keyCode);
}

void draw() {
  background(255);

  //Visualize which keys are being held down...
  if (input.isPressed(Taskbar.P1_LEFT)) {
    rect(10, 10, 10, 10);
  }
  if (input.isPressed(Taskbar.P1_RIGHT)) {
    rect(30, 10, 10, 10);
  }
  fill(0);
  text("Try pressing one or more\n of: WASD keys", 10, 50);
}
