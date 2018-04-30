class Ball {
  PVector position, velocity;
  float size;
  Ball() {
    position = new PVector(width/3, 100);
    velocity = new PVector(5, 5);
    size = 20;
  }
  void display() {
    fill(0, 255, 0);
    ellipse(position.x, position.y, size, size);
  }
  void move() {
    position.add(velocity);
  }
  void checkBoundaries(Brick brick) {
    if (position.x >= width - size/2) {
      velocity.x *= -1;
    }
    if (position.x <= size/2) { 
      velocity.x *= -1;
    }
    if (position.y >= height - size/2) {
      velocity.y *= -1;
    }
    if (position.y <= size/2) {
      velocity.y *= -1;
    }
    if (leftEdgeX(brick, 1) || rightEdgeX(brick, 1)) {
      if (inRadiusY(brick)) {
        //  println("hit x");
        velocity.x *= -1;
      }
    }
    if (topEdgeY(brick, 1) || bottomEdgeY(brick, 1)) {
      if (inRadiusX(brick)) {
        // println("hit y");
        velocity.y *= -1;
      }
    }
    if (topEdgeY(brick, 10) && rightEdgeX(brick, 10) && velocity.x < 0 && velocity.y > 0 || topEdgeY(brick, 10) && leftEdgeX(brick, 10) && velocity.x > 0 && velocity.y > 0 || bottomEdgeY(brick, 10) && rightEdgeX(brick, 10) && velocity.x < 0 && velocity.y < 0 || bottomEdgeY(brick, 10) && leftEdgeX(brick, 10) && velocity.x > 0 && velocity.y < 0) {
      velocity.mult(-1);
      //println("hit x and y");
    }
  }
  boolean topEdgeY(Brick brick, float precision) {
    return abs(brick.position.y - (position.y + size/2)) <= precision;
  }
  boolean bottomEdgeY(Brick brick, float precision) {
    return abs(position.y-size/2-brick.sizeY-brick.position.y) <= precision;
  }

  boolean inRadiusY(Brick brick) {
    return abs(position.y + size/2) >= brick.position.y && abs(position.y-size/2) <= brick.position.y+brick.sizeY;// || abs(position.y+size/2-brick.position.y) <= 1;
  }

  boolean leftEdgeX(Brick brick, float precision) {
    return abs(position.x + size/2 - brick.position.x) <= precision;
  }

  boolean rightEdgeX(Brick brick, float precision) {
    return abs(position.x-size/2-brick.position.x-brick.sizeX) <= precision;
  }

  boolean inRadiusX(Brick brick) {  
    return abs(position.x + size/2) >= brick.position.x && abs(position.x - size/2) <= brick.position.x+brick.sizeX;
  }
  void act(Brick brick) {
    display();
    checkBoundaries(brick);
    move();
    //  println("(top: " + str(abs(brick.position.y - (position.y + size/2)) <= 10) + ", left: " + str(abs(position.x + size/2 - brick.position.x)<=10) + ", " + str(velocity.x > 0) + ", " + str(velocity.y < 0) + ")");
  }
}