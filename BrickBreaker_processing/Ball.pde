class Ball {
  PVector pos = new PVector(width / 2, height / 2);

  float r = 30;
  PVector vel = new PVector(1, 1).mult(4);
  PVector direction = new PVector(1, 1);

  void update() {
    pos.x += vel.x * direction.x;
    pos.y += vel.y * direction.y;
  }

  void display() {
    ellipse(pos.x, pos.y, r * 2, r * 2);
  }

  void checkEdges() {
    if (this.pos.x > width - this.r && this.direction.x > 0) {
      this.direction.x *= -1;
    }
    if (this.pos.x < this.r && this.direction.x < 0) {
      this.direction.x *= -1;
    }
    if (this.pos.y < this.r && ball.direction.y < 0) this.direction.y *= -1;
  }

  boolean meets(Paddle paddle) {
    if (this.pos.y < paddle.pos.y &&
        this.pos.y > paddle.pos.y - this.r &&
        ball.pos.x > paddle.pos.x - ball.r &&
        ball.pos.x < paddle.pos.x + paddle.w + ball.r) {
      return true;
    } else {
      return false;
    }
  }

  boolean hits(Brick brick) {
    double d = dist(this.pos.x, this.pos.y, brick.pos.x, brick.pos.y);
    if (d < brick.r + this.r) {
      return true;
    } else {
      return false;
    }
  }
}