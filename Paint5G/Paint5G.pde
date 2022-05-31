PImage save;
PImage editable;
int click = 0;
Brush[] brush sizes;
int mode;
//Taskbar input;

void setup(){
  size(1080,720);
  editable = loadImage("blankCanvas.png");
  save = editable;
  image(editable,0,0);
  //input = new Taskbar();
  mode = click;
}

void mousePressed() {
  //int loc = (mouseX) + mouseY * width;
  //editable.pixels[loc] = color(0);
  editable.set(mouseX, mouseY, 0);
  //println(loc);
  //editable.updatePixels();
}

void mouseReleased() {
  
}

void mouseClicked() {
  
}



void draw() {
  if (mousePressed == true) {
    //if (mouseX > 200) {
      
      
    //}
  }
  image(editable,0,0);
}
