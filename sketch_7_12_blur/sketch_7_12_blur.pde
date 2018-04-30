PImage original, updated;

void blur() {
  for (int x = 0; x < original.width; x++) {
    for (int y = 0; y < original.height; y++){
     float midcr = red(original.get(x,y));
     float midcg = green(original.get(x,y));
     float midcb = blue(original.get(x,y));
     float ncr = red(original.get(x-1,y))+red(original.get(x+1,y))+red(original.get(x,y-1))+red(original.get(x,y+1))+red(original.get(x-1,y-1))+red(original.get(x-1,y+1))+red(original.get(x+1,y-1))+red(original.get(x+1,y+1));
     float ncg = green(original.get(x-1,y))+green(original.get(x+1,y))+green(original.get(x,y-1))+green(original.get(x,y+1))+green(original.get(x-1,y-1))+green(original.get(x-1,y+1))+green(original.get(x+1,y-1))+green(original.get(x+1,y+1));
     float ncb = blue(original.get(x-1,y))+blue(original.get(x+1,y))+blue(original.get(x,y-1))+blue(original.get(x,y+1))+blue(original.get(x-1,y-1))+blue(original.get(x-1,y+1))+blue(original.get(x+1,y-1))+blue(original.get(x+1,y+1));
     updated.set(x,y,color((round (ncr / 8*.6 + midcr*.4)), (round (ncg / 8*.4 + midcg*.6)), (round (ncb / 8*.4 + midcb*.6))));
    }
  }
  image(updated,0,0);
}
void setup() {
  size(800,600);
  original = loadImage("versailles.jpg");
  updated = new PImage(original.width, original.height);
}

void draw() {
  if (mousePressed) {
    blur();
  }
  else {
    image(original,0,0);
  }
}