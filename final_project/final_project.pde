import java.util.ArrayList;
boolean brickInPlay, start, dead;
ArrayList<Brick> bricks= new ArrayList<Brick>();
Bar user;
Ball breaker;

void setup() {
  start = false;
  size(405, 400);
  brickInPlay=false;
  user= new Bar();
  breaker=new Ball(new PVector(user.x+25, height-22));
  for (int x=0; x<4; x++) {
    for (int y=0; y<5; y++) {
      bricks.add(new Brick(new PVector(50*x+100, 25*y+100)));
    }
  }
}

void draw() {
  background(140);
  if (start) {
    textSize(30);
    fill(0);
    text("PRESS 'SPACE' TO PAUSE", 30, 40);
    if (brickInPlay&&!dead) {

      user.move();
      user.update();
      breaker.update();
      breaker.move();
    }
      if (bricks.size() == 0) {
       background(0);
       fill(255,0,0);
       textSize(40);
       text("NICE WORK...",width/6+15,height/3);
       text("BUT UR STILL BAD C;",5,height/2-10);
      } 
      if (!dead&&!brickInPlay) {
      breaker.aim();
      user.update();
    } if (dead) {
      background(0);
      for (int i=0; i<bricks.size(); i++) {
        bricks.remove(i);
      }
      fill(255, 0, 0);
      textSize(40);
      text("GAME OVER", width/5, height/3);
      text("GIT GUD, N00B", width/7, height/2);
    }
    for (int i=0; i<bricks.size(); i++) {
      bricks.get(i).update();
    }
  } else {
    textSize(55);
    fill(0);
    text("BRICKBREAKER", 7, height/8);
    textSize(35);
    text("PRESS B TO START", 45, height/5+20);
    fill(0, 255, 0);
    text("PRESS 'A' AND 'D' TO", 25, height/3+15);
    text("AIM YOUR LAUNCHER", 20, height/2-5);
    text("PRESS 'W' TO FIRE", width/7, height/2+42);
    fill(0, 0, 255);
    text("THEN", width/2-50, height-height/4-12);
    text("PRESS 'A' AND 'D'", 60, height-height/6);
    text("TO MOVE YOUR BAR", 30, height-height/16);
  }
}

/*void mouseClicked() {
    for (int i=0; i<bricks.size(); i++) {
      bricks.remove(i);
    }
 }*/

void keyPressed() {
  int k = keyCode;
  //println(k);
  if (k == 32)
    if (looping)  noLoop();
    else          loop();
  if (k == 'B' || k == 'b')
    start = true;
}