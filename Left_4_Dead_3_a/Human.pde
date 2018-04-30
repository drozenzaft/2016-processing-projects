class Human {
  PVector position, velocity;
  float size;
  color c;
  Human() {
    c = color(0, 0, 255);
    size = 40;
    position = new PVector (width/2, height/2);
    velocity = new PVector (2.5, 2.5);
  }
void move() {
  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      position.x += velocity.x;
    }
    if (key == 's' || key == 'S') {
      position.y += velocity.y;
    }
    if (key == 'a' || key == 'A') {
      position.x -= velocity.x;
    }
    if (key == 'w' || key == 'W') {
      position.y -= velocity.y;
    }
  }
}
void display() {
   fill(c);
   ellipse(position.x, position.y, size, size);
}
void checkBoundaries() {
   if (position.x >= width - size/2) {
     position.x -= width;
   }
   if (position.x <= size/2) { 
     position.x += width;
   }
   if (position.y >= height - size/2) {
     position.y -= height;
   }
   if (position.y <= size/2) {
     position.y += height;
   }
}
boolean inRadius(float radius,Zombie zombie) {
  return dist(position.x, position.y, zombie.position.x, zombie.position.y) <= radius;
}
}