
int cols;
int rows;
float[][] current;// = new float[cols][rows];
float[][] previous;// = new float[cols][rows];

float dampening = 0.99;

void setup() {
  size(1000, 600);
  //fullScreen();
  cols = width;
  rows = height;
  current = new float[cols][rows];
  previous = new float[cols][rows];
}

void mouseDragged() {
  previous[mouseX][mouseY] = 50000;
}

void draw() { 
  previous[int(random(0,width))][int(random(0,height))] = 5000;
  loadPixels();
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      current[i][j] = (
        previous[i-1][j] + 
        previous[i+1][j] +
        previous[i][j-1] + 
        previous[i][j+1]) / 2 -
        current[i][j];
      current[i][j] = current[i][j] * dampening;
      int index = i + j * cols;
      pixels[index] = color(current[i][j],100,255);
    }
  }
  updatePixels();

  float[][] temp = previous;
  previous = current;
  current = temp;
}