PImage msft;//, msftVert, msftHoriz;
float plusMinusX = 3;
float plusMinusY = 3;
float x = random(width);
float y = random(height);

void bounce(PImage image) {
  image(image, x, y);
  if (x >= width - image.width) { 
    plusMinusX = -3;
  }
  if (x <= 0) {
    plusMinusX = 3;
  }
  x += plusMinusX;
  if (y >= height - image.height) {
    plusMinusY = -3;
  }
  if (y <= 0) {
    plusMinusY = 3;
  }
  y += plusMinusY;
}
  
void setup() {
  size(800, 600);
  background(255);
  msft = loadImage("microsoft.png");
  //msftVert = loadImage("microsoft_flip.png");
  //msftHoriz = loadImage("microsoft_horiz.png");
}

void draw() {
  background(255);
  /*if(frameCount%90 >= 60) {
   image(msft,mouseX-msft.width,mouseY-msft.height,msft.width*2,msft.height*2);
   }
   // if(frameCount%30 >= 30 && frameCount%30 < 60) {
   // image(msftVert,mouseX-msftVert.width,mouseY-msftVert.height,msftVert.width*2,msftVert.height*2);
   // }
   // if(frameCount%30 < 30) {
   //image(msftHoriz,mouseX-msftHoriz.width,mouseY-msftHoriz.height,msftHoriz.width*2,msftHoriz.height*2);
   }*/
  bounce(msft);
}