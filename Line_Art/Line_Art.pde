int w, h, r;
float angleNew, angleOld, angle;
PImage img;
PGraphics g1, g2;
Boolean running = false;
void setup() {
  img = loadImage("damon.jpg");
  size(1176, 640);
  image(img, img.width, 0);
  frameRate(120);
  init();
}

void draw() {
  if (!running) {
    init();
    running = true;
  }
  angleOld = angleNew;
  float min = 3*255, brightness;
  for (int i = 0; i < 1000; i++) {
    angle = random(TWO_PI);
    brightness = stringBrightness(angleOld, angle);
    if (brightness < min) {
      min = brightness;
      angleNew = angle;
    }
  }
  g1.beginDraw();
  g2.beginDraw();
  drawString(angleOld, angleNew);
  g1.endDraw();
  g2.endDraw();
  image(g1, 0, 0);
  if (mousePressed) {
    image(g2, 0, 0);
  }
}

void init() {
  w = img.width;
  h = img.height;
  running = false;
  g1 = createGraphics(w, h);
  g1.beginDraw();
  g1.background(255);
  g1.stroke(0);
  g1.strokeWeight(0.2);
  g2 = createGraphics(w, h);
  g2.beginDraw();
  g2.image(img, 0, 0);
  g2.stroke(255);
  g2.strokeWeight(0.2);
  r = min(w, h)/2;
  angleNew = random(TWO_PI);
}

float stringBrightness(float angle1, float angle2) {
  float x1, x2, y1, y2, x, y;
  float sum = 0;
  int steps = 400;
  x1 = r * sin(angle1) + w/2;
  x2 = r * sin(angle2) + w/2;
  y1 = r * cos(angle1) + h/2;
  y2 = r * cos(angle2) + h/2;
  for (int i = 0; i < steps; i++) {
    x = x1 + (float)i/steps*(x2-x1);
    y = y1 + (float)i/steps*(y2-y1);
    sum += red(g2.get((int)x, (int)y))/(float)steps +
      green(g2.get((int)x, (int)y))/(float)steps +
      blue(g2.get((int)x, (int)y))/(float)steps;
  }
  return sum;
}

void drawString(float angle1, float angle2) {
  float x1, x2, y1, y2;
  x1 = r * sin(angle1) + w/2;
  x2 = r * sin(angle2) + w/2;
  y1 = r * cos(angle1) + h/2;
  y2 = r * cos(angle2) + h/2;
  g1.line(x1, y1, x2, y2);
  g2.line(x1, y1, x2, y2);
}
