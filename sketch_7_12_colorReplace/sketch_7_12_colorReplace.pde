import processing.video.*;
Capture cam;
PImage original,updated;

void setup() {
  size(1280, 720);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(i + " " + cameras[i]);
    }
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  original = cam;
  updated = new PImage (original.width, original.height);
  for (int x = 0; x < original.width; x++) {
       for (int y = 0 ; y < original.height; y++) {
          color c  = original.get(x,y);
          float r = red(c);
          float g = green(c);
          float b = blue(c);
          if ((r + g + b)/3 > 100) {
             updated.set(x,y,color(0,(r+g+b)/3,0));
          }
          else {
            updated.set(x,y,original.get(x,y));
          }
        }
      }
  image(updated,0,0);
}