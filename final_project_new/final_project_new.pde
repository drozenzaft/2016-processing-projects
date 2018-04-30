Ball ball;
Brick brick;

/*void demolition(Brick brick) {
 if (ball.edgeX(brick, 1) || ball.edgeY(brick, 1)) {
 remove(brick);
 }
 }*/

void keyPressed() {
  int k = keyCode;
  if (k == 32 || k == 32)
    if (looping)  noLoop();
    else          loop();
}

void setup() {
  size(800, 600);
  ball = new Ball();
  brick = new Brick();
  /*  for (int j = 0; j < brick.length; j++) {
   brick = new Brick();
   brick.i = j;
   }*/
}

void draw() {
  background(0);
  //for (int j = 0; j < brick.length; j++) {
  ball.act(brick);
  if (brick != null) {
    brick.display();
  }
  // }
}
/*void mouseClicked(){
 ball.position.x=mouseX;
 ball.position.y=mouseY;
 }*/