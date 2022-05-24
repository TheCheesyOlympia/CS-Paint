PImage save;
PImage editable;
int mode;

void setup(){
  size(1280,720);
  editable = loadImage("blankCanvas.png");
  save = editable;
  image(save,200,0);
}

void mousePressed() {
  
}

void keyPressed() { 
}
