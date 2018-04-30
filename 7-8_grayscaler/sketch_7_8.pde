import processing.video.*;
Capture cam;

PImage versailles, versaillesB, original, updated;

//void setup() {
//size(1280, 720);
void setup() {
  versailles = loadImage("versailles_b.jpg");
  size(800, 600);
  //image(versailles, 0, 0);
}

/*  String[] cameras = Capture.list();
 
 if (cameras.length == 0) {
 println("There are no cameras available for capture.");
 exit();
 } else {
 println("Available cameras:");
 for (int i = 0; i < cameras.length; i++) {
 println(i + " " + cameras[i]);
 } 
 // The camera can be initialized directly using an 
 // element from the array returned by list():
 cam = new Capture(this, cameras[0]);
 cam.start();     
 }      
 }*/
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

/*void setup(){
 size(800,600);
 versailles = loadImage("versailles_b.jpg");
 //versaillesB = loadImage("versailles.jpg");
 }*/
/*void neighbors(){
 for (int x = 0; x < original.width; x++) {
 for (int y = 0; y < original.height; y++){
 color midc = color(original.get(x,y));
 color leftc = color(original.get(x-1,y));
 color rightc = color(original.get(x+1,y));
 color downc = color(original.get(x,y-1));
 color upc = color(original.get(x,y+1));
 color upleftc = color(original.get(x-1,y-1));
 color downleftc = color(original.get(x-1,y+1));
 color uprightc = color(original.get(x+1,y-1));
 color downrightc = color(original.get(x+1,y+1));
 
 }
 }
 }*/



void draw() {
  //image(versailles,0,0);
  //image(versailles,0,0);
  /*  if (cam.available() == true) {
   cam.read();
   }*/
  original = versailles;
  updated = new PImage(original.width, original.height);
  for (int x = 0; x < original.width; x++) {
    for (int y = 0; y < original.height; y++) {
      color c = color(original.get(x, y)); 
      if (x == original.width) {
        updated.set(0, y, c);
      } else {
        updated.set(x+1, y, c);
      }  
      /* grayscale!
       color c;
       color avg;
       c = color(original.get(x,y));
       float r = red(c);
       float g = green(c);
       float b = blue(c);
       avg = color((r+g+b)/3);
       updated.set(x,y,avg);*/
      /* Purple
       color c = color(original.get(x,y));
       float r = red(c);
       float g = green(c);
       float b = blue(c);
       
       c = color(b, 0, r);
       updated.set (x, y, c);
       */
      /* Blue
       color c;
       c = color(original.get(x,y));
       float r = red(c);
       float g = green(c);
       float b = blue(c);
       
       c = color(0, 0, b);
       updated.set (x, y, c);
       */

      /*   color c;
       c = color(original.get(x,y));
       float r = red(c);
       float g = green(c);
       float b = blue(c);
       
       c = color(0, 0, b);
       updated.set (x, y, c);
       neighbors();*/
    }
  }
  image(updated, 0, 0);
}
// The following does the same, and is faster when just drawing the image
// without any additional resizing, transformations, or tint.
//set(0, 0, cam);
/*void draw(){
 // background(255);
 //image(versailles,0,0);
 //paintSquare(0,0);//use (mouseX,mouseY) for manual coloring
 }*/