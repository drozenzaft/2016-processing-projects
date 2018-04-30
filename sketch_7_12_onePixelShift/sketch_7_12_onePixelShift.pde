import processing.video.*;
Capture cam;
PImage original, p;
int counter;

void setup() {
  counter = 0;
  frameRate(60);
  size(570,400);
  original = loadImage("versailles_b.jpg");
  p = new PImage(original.width, original.height);
}

void draw() {
  for (int x = 0; x < p.width; x++) {
   for (int y = 0; y < p.height; y++) {
     p.set(x,y,original.get((x+counter)%p.width,y));
   }
  }
  image(p,0,0);
 // if (mousePressed) {
    counter += 1;
//  }
}

void mousePressed(){
  image(p,mouseX-original.width/2,mouseY-original.height/2);
}