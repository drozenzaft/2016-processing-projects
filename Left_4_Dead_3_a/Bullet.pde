class Bullet {
  float mX;
  float mY;
  PVector position, velocity;
  float size;
  color c;
  Bullet() {
    c = color(255);
    size = 12;
    position = new PVector(human.position.x, human.position.y);
  }
  void followHuman() {
    bullet.position.x = human.position.x;
    bullet.position.y = human.position.y;
    if (keyPressed) {
      if (key == 'd' || key == 'D') {
        position.x += 2.5;
      }
      if (key == 's' || key == 'S') {
        position.y += 2.5;
      }
      if (key == 'a' || key == 'A') {
        position.x -= 2.5;
      }
      if (key == 'w' || key == 'W') {
        position.y -= 2.5;
      }
    }
  }
  void display() {
    fill(c);
    ellipse(position.x, position.y, size, size);
  }
  void bulletWrap() {
    if (human.position.x >= width - human.size/2) {
      position.x = human.position.x - width;
    }
    if (human.position.x <= human.size/2) { 
      position.x = human.position.x + width;
    }
    if (human.position.y >= height - human.size/2) {
      position.y = human.position.y - height;
    }
    if (human.position.y <= human.size/2) {
      position.y = human.position.y + height;
    }
  }
  boolean checkBoundaries() {
    return ((position.x >= width - size/2 || position.x <= size/2) || (position.y >= height - size/2 || position.y <= size/2)) && !! (dist(position.x, position.y, human.position.x, human.position.y)<= 20);
  }
  boolean inRadius(float radius, Zombie zombie) {
    return dist(position.x, position.y, zombie.position.x, zombie.position.y) <= radius;
  }
  boolean killed(Zombie zombie) {
    return inRadius(1, zombie) && !! (dist(position.x, position.y, human.position.x, human.position.y) <= 20);
  }
  void shoot(Zombie zombie) {
    PVector velocity = new PVector(mX, mY);
    velocity = velocity.sub(position.x, position.y);
    velocity.normalize();
    velocity.mult(6);
    position.add(velocity);
  if (bullet.killed(zombie) || bullet.checkBoundaries()) {
    if (bullet.killed(zombie)) {
      zombie.hp -= 1;
    }
    bullet.followHuman();
  }
}
}