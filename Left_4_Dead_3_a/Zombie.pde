class Zombie {
  PVector position, velocity;
  float size;
  color c;
  int hp;
  float direct;
  Zombie() {
    float direct = random(4);
    textSize(20);
    c = color(5,220,5);
    size = 40;
    position = new PVector(random(size, width-size), random(size, height-size));
    if (direct >= 3) {
      velocity = new PVector(random(1,2), random(1,2));
    }
    if (direct >= 2) {
      velocity = new PVector(random(1,2), random(1,2)*-1);
    }
    if (direct >= 1) {
      velocity = new PVector(random(1,2)*-1, random(1,2)*-1);
    }
    if (direct >= 0) {
      velocity = new PVector(random(1,2)*-1, random(1,2));
    }
    hp = 2;
  }
void move() {
  position.add(velocity);
}
boolean inRadius(float radius,Human human) {
  return dist(position.x, position.y, human.position.x, human.position.y) <= radius;
}
void chaseHuman(Human human) {
  PVector placeHolder = human.position.copy();
  velocity = placeHolder.sub(position.x, position.y, position.z);
  velocity.normalize();
  velocity.mult(1.5);
  }
void display() {
  fill(c);
  ellipse(position.x, position.y, size, size);
  fill(255,0,0);
  text(str(hp),position.x - size/4 + 4,position.y+size/4-4);
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
boolean killed(Human human) {
  return inRadius(1,human);
}
boolean isInside() {
    return dist(position.x, position.y, width/2, height/2) <= 100 && frameCount / frameRate <= 2;
}
void replace() {
    position.x += 5 *(position.x - width/2);
    position.y += 5 * (position.y - height/2);
  }
void process(Zombie zombie, Human human) {
    if (zombie != null) {
      zombie.display();
      if (zombie.isInside()) {
        zombie.replace();
      }
      zombie.checkBoundaries();
      zombie.move();
      if (zombie.inRadius(100, human)) {
        zombie.chaseHuman(human);
      }
    }
  }
}