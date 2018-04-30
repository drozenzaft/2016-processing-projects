import processing.video.*;
Capture cam;

PImage original, updated;
int tog = 0;//(int)random(4);

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
/*use cursor to color image
 int dim = 100;
 void paintSquare(int x, int y) {
 int i = dim/-2;
 color c;
 color avg;
 while (i < dim/2) {
 int j = dim/-2;
 while (j < dim/2){
 c = versailles.get(x+i,y+j);
 float r = red(c);
 float g = green(c);
 float b = blue(c);
 avg = color((r+g+b)/3);
 versailles.set(x+i,y+j,avg);
 j += 1;
 }
 i += 1;
 }
 //versailles.set(0,0,255);
 }
 */
/*grayscale all
 void paintSquare(int x, int y) {
 int i = 0;
 color c;
 color avg;
 while (i < original.width){
 int j = 0;
 while (j < original.height){
 c = original.get(x+i,y+j);
 float r = red(c);
 float g = green(c);
 float b = blue(c);
 avg = color((r+g+b)/3);
 original.set(x+i,y+j,avg);
 j += 1;
 }
 i += 1;
 }
 }*/

void draw() {
  if (cam.available() == true) {
   cam.read();
   }
  original = cam;
  updated = new PImage(original.width,original.height);
  if (frameCount < 2) {
    println(tog);
  }
  for (int x = 0; x < original.width; x++) {
    for (int y = 0; y < original.height; y++) {
      // avatar
       if (tog == 0) {
         color c = color(original.get(x,y));
         float r = red(c);
         float g = green(c);
         float b = blue(c);
         c = color(b, 0, r);
         updated.set (x, y, c);
       }
       //invert
       if (tog == 1) {        
         color c;
         c = color(original.get(x,y));
         float r = red(c);
         float g = green(c);
         float b = blue(c); 
         c = color(255-r, 255-g, 255-b);
         updated.set (x, y, c);
       }
       //grayscale
       if (tog == 2) {
         color c;
         color avg;
         c = color(original.get(x,y));
         float r = red(c);
         float g = green(c);
         float b = blue(c);
         avg = color((r+g+b)/3);
         updated.set(x,y,avg);
       }
       //original
       if (tog == 3) {
         color c;
         c = color(original.get(x,y));
         float r = red(c);
         float g = green(c);
         float b = blue(c);
         c = color(r,g,b);
         updated.set(x,y,c);
       }
       //blur
       if (tog == 4) {
         float midcr = red(original.get(x,y));
         float midcg = green(original.get(x,y));
         float midcb = blue(original.get(x,y));
         float ncr = red(original.get(x-1,y))+red(original.get(x+1,y))+red(original.get(x,y-1))+red(original.get(x,y+1))+red(original.get(x-1,y-1))+red(original.get(x-1,y+1))+red(original.get(x+1,y-1))+red(original.get(x+1,y+1));
         float ncg = green(original.get(x-1,y))+green(original.get(x+1,y))+green(original.get(x,y-1))+green(original.get(x,y+1))+green(original.get(x-1,y-1))+green(original.get(x-1,y+1))+green(original.get(x+1,y-1))+green(original.get(x+1,y+1));
         float ncb = blue(original.get(x-1,y))+blue(original.get(x+1,y))+blue(original.get(x,y-1))+blue(original.get(x,y+1))+blue(original.get(x-1,y-1))+blue(original.get(x-1,y+1))+blue(original.get(x+1,y-1))+blue(original.get(x+1,y+1));
         updated.set(x,y,color((round (ncr / 8*.6 + midcr*.4)), (round (ncg / 8*.4 + midcg*.6)), (round (ncb / 8*.4 + midcb*.6))));
       } 
    }
  }
 image(updated, 0, 0);
}