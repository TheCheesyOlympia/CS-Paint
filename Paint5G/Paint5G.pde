PImage save;
PImage editable;
int click = 0;
int brush = 1;
int line = 2;
int rect = 3;
int mode;
//Taskbar input;

void setup(){
  size(1280,720);
  editable = loadImage("blankCanvas.png");
  save = editable;
  image(save,200,0);
  //input = new Taskbar();
  mode = click;
}

void mousePressed() {
  
}

void mouseReleased() {

}

void mouseClicked() {
  
}

void draw() {
  if (mousePressed == true) {
    if (mouseX > 200) {
      
    }
  }
}
