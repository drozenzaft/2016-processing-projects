Zombie[] zombies;
Human human;
Bullet bullet;
boolean shoot;

void setup() {
  size(800, 600);
  zombies = new Zombie[20];
  human = new Human();
  bullet = new Bullet();
  for (int i = 0; i < zombies.length; i++) {
    zombies[i] = new Zombie();
  }
}

void draw() {
  background(0);
  human.display();
  human.checkBoundaries();
  human.move();
 /* if (bullet != null) {
    bullet.display();
    bullet.bulletWrap();
 //   if (shoot s) {
      //bullet.followHuman();
  //  }
  }*/
  for (int i = 0; i < zombies.length; i++) {
    if (zombies[i].hp == 0) {
      zombies[i] = null;
    }
    if (zombies[i] != null) {
      zombies[i].display();
      if (frameCount<frameRate*2) {
      noFill();
      stroke(255);
      ellipse(width/2,height/2,200,200);
      }
      stroke(0);
      if (zombies[i].isInside()) {
        zombies[i].replace();
      }
      zombies[i].checkBoundaries();
      zombies[i].move();
      if (zombies[i].inRadius(100, human)) {
        zombies[i].chaseHuman(human);
      }
      if (bullet != null) {
        if (bullet.killed(zombies[i])) {
          println("MLGNOSCOP3");
        }
       /* if (mousePressed) {
          bullet.mX = mouseX;
          bullet.mY = mouseY;
          bullet.shoot(zombies[i]) ;
          shoot = true;
        }*/
      }
      if (zombies[i].killed(human)) {
        noLoop();
        textSize(width/12);
        textAlign(CENTER, CENTER);
        text("GAME OVER\nYOU GOT EATEN IN\n "+str(round(frameCount/frameRate))+" SECONDS\nn00b, git gud", width/2, height/2);
      }
      textSize(20);
    }
  }
}