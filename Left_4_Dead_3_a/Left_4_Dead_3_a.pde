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
  if (bullet != null) {
    bullet.display();
    bullet.bulletWrap();
 //   if (shoot s) {
      //bullet.followHuman();
  //  }
  }
  for (int i = 0; i < zombies.length; i++) {
    if (zombies[i].hp == 0) {
      zombies[i] = null;
    }
      if (bullet != null) {
        if (bullet.killed(zombies[i])) {
          println("MLGNOSCOP3");
        }
        if (mousePressed) {
          bullet.mX = mouseX;
          bullet.mY = mouseY;
          bullet.shoot(zombies[i]) ;
          shoot = true;
        }
      }
      if (zombies[i].killed(human)) {
        noLoop();
        textSize(width/12);
        textAlign(CENTER, CENTER);
        text("GAME OVER\nYOU SURVIVED FOR\n "+str(frameCount/frameRate)+" SECONDS", width/2, height/2);
      }
      textSize(20);
    }
}