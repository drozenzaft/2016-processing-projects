PImage original,updated;
float r,g,b;
color c;

void setup() {
  size(800,600);
  background(255);
}

void draw() {
  original = loadImage("kw2.jpg");
  updated = new PImage(original.width,original.height);
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      c = original.get(x,y);
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      updated.set(x,y,color(r,g,b));
    }
  }
  image(updated,0,0);
}