class Brick{
  PVector pos = new PVector(random(100, width - 100), random(100, height - 400));
  float r = random(20, 80);
  int total = 6;

  void display() {
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    beginShape();
    for (int i = 0; i < this.total; i++) {
      float angle = map(i, 0, this.total, 0, TWO_PI);
      float r = this.r;
      float x = r * cos(angle);
      float y = r * sin(angle);
      vertex(x, y);
    }
    endShape(CLOSE);
    popMatrix();
  }
}