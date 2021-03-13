int tick = 0;
void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int t = 0; t < 360; t+=3) {
    float x = cos(radians(t)) * 50;
    float y = sin(radians(t)) * 100;
    float r = abs(sin(radians(t + tick)) * 200);
    float col = map(t, 0, 360, 0, 255);
    fill(0, col, 88);
    circle(x, y, r);
  }
  tick++;
}
