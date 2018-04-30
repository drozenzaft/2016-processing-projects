class Brick {
  PVector position;
  float sizeX, sizeY;
  int i;
  Brick() {
    i = 3;
    sizeX = 300;
    sizeY = 200;
    position = new PVector(i*width/10, height/3);
  }
  void display() {
    fill(255, 0, 0);
    stroke(0);
    rect(i*width/10, position.y, sizeX, sizeY);
  }

  void act() {
    display();
    // demolition(ball,brick);
  }
}