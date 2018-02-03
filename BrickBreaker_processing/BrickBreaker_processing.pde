Paddle paddle;
Ball ball;
ArrayList<Brick> bricks = new ArrayList<Brick>();

boolean playingGame = false;
boolean youWin = false;
double winText;

void setup() {
  fullScreen();
  //size(displayWidth,displayHeight);

  paddle = new Paddle();
  ball = new Ball();

  for (int i = 0; i < 20; i++) {
    bricks.add(new Brick());
  }
  //createText();
}

void draw() {
  background(255);

  // bricks
  for (int i = 0; i < bricks.size(); i++) {
    bricks.get(i).display();
    if (ball.hits(bricks.get(i))) {
      if (bricks.get(i).r >= 40) {
        bricks.get(i).r = bricks.get(i).r / 2;
      } else {
        bricks.remove(i);
      }
      ball.direction.y *= -1;
    }
  }

  // paddle
  paddle.display();
  if (playingGame) paddle.checkEdges();
  if (playingGame) paddle.update();

  // ball
  if (ball.meets(paddle)) {
    if (ball.direction.y > 0) ball.direction.y *= -1;
  }
  ball.display();
  if (playingGame) ball.checkEdges();
  if (playingGame) ball.update();

  // game logics
  if (ball.pos.y > height) {
    ball.pos = new PVector(width / 2, height / 2);
    playingGame = false;
  }

  if (bricks.size() == 0) {
    youWin = true;
    playingGame = false;
  }

  //if (youWin) {
  //  winText.style("display", "block");
  //} else {
  //  winText.style("display", "none");
  //}
}

void mouseReleased() {
  paddle.isMovingRight = false;
  paddle.isMovingLeft = false;
}

 //void keyPressed() {
 //  if (key == 'a' || key == 'A') {
 //    paddle.isMovingLeft = true;
 //  } else if (key == 'd' || key == 'D') {
 //    paddle.isMovingRight = true;
 //  } else if (key == 's' || key == 'S') {
 //    if (bricks.size() == 0) {
 //      for (int i = 0; i < 20; i++) {
 //        bricks.add(new Brick());
 //      }
 //    }
 //    playingGame = true;
 //    youWin = false;
 //  }
 //}

void mousePressed() {
  if(mouseX>width/2)
    paddle.isMovingRight = true;
  else if (mouseX<width/2) 
    paddle.isMovingLeft = true;
  if (!playingGame) {
    if (bricks.size() == 0) {
      for (int i = 0; i < 20; i++) {
        bricks.add(new Brick());
      }
    }
    playingGame = true;
    youWin = false;
  }

}