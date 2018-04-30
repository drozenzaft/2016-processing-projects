class Ball {
  PVector pos;
  PVector vel;
  int framesSinceHit;
  float aim;
  int rad;
  float speed;

  Ball(PVector p) {
    pos=p;
    framesSinceHit=0;
    aim=0;
    rad=4;
    speed=3;
  }

  void update() {
    fill(255);
    ellipse(pos.x, pos.y, 2*rad, 2*rad);
    //death
    if (pos.y>height) {
      dead=true;
    }
  }

  void move() {
    framesSinceHit+=1;
    pos.x+=vel.x;
    pos.y+=vel.y;
    float angle =atan2(vel.y, vel.x);
    if ((pos.x<rad || pos.x>width-rad)) {
      vel.x*=-1;
      ////could split this to set pos.x to the wall
    }
    if (pos.y<rad) {
      vel.y*=-1;
    }
    if (pos.y>height-20-rad && pos.x>user.x && pos.x<user.x+50&& framesSinceHit>2) {
      float dist=pos.x-(user.x+25);
      if (vel.x>0) {
        angle-= (PI/2-abs(angle-PI/2))*dist/50;//-1+dist/5;
      } 
      if (vel.x<0) {
        angle+= (PI/2-abs(angle-PI/2))*dist/50;//-1-dist/5;
      } else {
        angle-= (PI/2-abs(angle-PI/2))*dist/50;
      }
      framesSinceHit=0;
      setAngle(-angle);
      pos.y=height-20-rad;
    }
    line(user.x+25, 580, user.x+25, 590);
    brickBounce();
  }

  void brickBounce() {
    float y=pos.y;
    float x=pos.x;
    for (int i=0; i<bricks.size(); i++) {
      Brick b=bricks.get(i);
      float by=b.pos.y;
      float bx=b.pos.x;
      if ((y<by||y>by+b.size)&&(x<bx||x>bx+b.size)&& framesSinceHit>=2) {
        if (sq(rad)>sq(y-by)+sq(x-bx)||sq(rad)>sq(y-(by+b.size))+sq(x-bx)||sq(rad)>sq(y-by)+sq(x-(bx+b.size*2))||sq(rad)>sq(y-(by+b.size))+sq(x-(bx+b.size*2))) {
          framesSinceHit=0;
          pos.y-=vel.y;
          pos.x-=vel.x;

          vel.x*=-1;
          vel.y*=-1;
          b.hp-=1;
        }
      } else if (x>=bx-rad && y>=by-rad && x<=bx+b.size*2+rad && y<=by+b.size+rad&& framesSinceHit>2) {
        framesSinceHit=0;
        if (y>=by-rad&&x>=bx&&x<=bx+b.size*2) {
          pos.y-=vel.y;
          pos.x-=vel.x;

          vel.y*=-1;
          b.hp-=1;
          //pos.y=by-rad;
        } else if (y<=by+b.size+rad&&x>=bx&&x<=bx+b.size*2) {
          pos.y-=vel.y;
          pos.x-=vel.x;

          vel.y*=-1;
          b.hp-=1;
          //pos.y=by+b.rad+rad;
        } else if (x>=bx-rad&&y>=by&&y<=by+b.size) {
          pos.y-=vel.y;
          pos.x-=vel.x;

          vel.x*=-1;
          b.hp-=1;
        }
        //pos.x=bx-rad;
        else if (topEdgeY(b, 10) && rightEdgeX(b, 10) && vel.x < 0 && vel.y > 0 || topEdgeY(b, 10) && leftEdgeX(b, 10) && vel.x > 0 && vel.y > 0 || bottomEdgeY(b, 10) && rightEdgeX(b, 10) && vel.x < 0 && vel.y < 0 || bottomEdgeY(b, 10) && leftEdgeX(b, 10) && vel.x > 0 && vel.y < 0) {
          vel.mult(-1);
        } else if (leftEdgeX(b, 10) && (!(topEdgeY(b, 10)) || (!bottomEdgeY(b, 10))) || rightEdgeX(b, 10) && (!(topEdgeY(b, 10)) || (!bottomEdgeY(b, 10)))) {
          dead = true;
        } else if (x<=bx+b.size*2+rad&&y>=by&&y<=by+b.size) {
          pos.y-=vel.y;
          pos.x-=vel.x;

          vel.x*=-1;
          b.hp-=1;
          //pos.x=bx+b.rad*2+rad;
        }
      }
      if (b.hp<=0) {
        bricks.remove(i);
      }
    }
  }

  void setAngle(float a) {
    float mag = vel.mag();
    float x = cos(a);
    float y = sin(a);
    vel = new PVector(x, y);
    vel.mult(mag);
  }
  boolean topEdgeY(Brick brick, float precision) {
    return abs(brick.pos.y - (pos.y + rad/2)) <= precision;
  }
  boolean bottomEdgeY(Brick brick, float precision) {
    return abs(pos.y-rad/2-brick.size-brick.pos.y) <= precision;
  }

  boolean rightEdgeX(Brick brick, float precision) {
    return abs(pos.x-rad/2-brick.pos.x-brick.size*2) <= precision;
  }

  boolean leftEdgeX(Brick brick, float precision) {
    return abs(pos.x + rad/2 - brick.pos.x) <= precision;
  }
  void aim() {
    if (keyPressed) {
      if ((key == 'a' || key == 'A') && (aim>-1.5)) {
        aim-=.03;
      } 
      if ((key == 'd' || key == 'D') && (aim<1.5)) {
        aim+=.03;
      }
      if (key=='w' || key=='D') {
        brickInPlay=true;
        vel=new PVector(speed*sin(aim), -cos(aim)*speed);
      }
    }
    line(user.x +25, height-22, user.x +25+30*sin(aim), height-22-30*cos(aim));
    update();
  }
}