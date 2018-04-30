class Bar {
  int x;
  Bar() {
    x=width/2-25;
  }
  void update() {
    //move();
    fill(0);
    rect(x, height-20, 50, 10);
  }

  void move() {
    if (keyPressed) {
      if ((key == 'a' || key == 'A') && (x>1)) {
        x=x-6;
      } 
      if ((key == 'd' || key == 'D') && (x<width-51)) {
        x=x+6;
      }
    }
  }
}