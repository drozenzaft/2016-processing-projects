class Brick {
  PVector pos;
  int hp;
  int size;
  Brick(PVector p) {
    pos=p;
    hp=3;
    size=25;
  }
  void update() {
    if (hp==3) {
      fill(255, 0, 0);
      rect(pos.x, pos.y, 2*size, size);
    }
    if (hp==2) {
      fill(0, 0, 255);
      rect(pos.x, pos.y, 2*size, size);
    }
    if (hp==1) {
      fill(0, 255, 0);
      rect(pos.x, pos.y, 2*size, size);
    }
  }
}