class Paddle {
  float w = 160;
  float h = 20;
  PVector pos = new PVector(width / 2 - w / 2, height - 40);
  boolean isMovingLeft = false;
  boolean isMovingRight = false;

  void display() {
    rect(pos.x, pos.y, w, h);
  }

  void update() {
    if (isMovingLeft) {
      move(-20);
    } else if (isMovingRight) {
      move(20);
    }
  }

  void move(double step) {
    pos.x += step;
  }

  void checkEdges() {
    if (pos.x <= 0) pos.x = 0;
    else if (pos.x + w >= width) pos.x = width - w;
  }
}