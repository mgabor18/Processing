int w, h;
PVector point = new PVector();
PVector pointOld = new PVector();
PVector pointNew = new PVector();
PImage img;
PGraphics g1, g2;
Boolean running = false;
void setup() {
  img = loadImage("ihm.jpg");
  size(633, 427);
  //image(img, img.width, 0);
  frameRate(120);
  init();
}

void draw() {
  if (!running) {
    init();
    running = true;
  }
  pointOld.x = pointNew.x;
  pointOld.y = pointNew.y;
  float min = 3*255, brightness;
  for (int i = 0; i < 2000; i++) {
    point.x = floor(random(0, w));
    point.y = floor(random(0, h));
    brightness = stringBrightness(pointOld, point);
    if (brightness < min) {
      min = brightness;
      pointNew.x = point.x;
      pointNew.y = point.y;
    }
  }
  g1.beginDraw();
  drawString(pointOld, pointNew);
  g1.endDraw();
  image(g1, 0, 0);
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
  pointNew.x = floor(random(0, w));
  pointNew.y = floor(random(0, h));
}

float stringBrightness(PVector v, PVector u) {
  float x, y;
  float sum = 0;
  int steps = 400;
  for (int i = 0; i < steps; i++) {
    x = v.x + (float)i/steps*(u.x-v.x);
    y = v.y + (float)i/steps*(u.y-v.y);
    sum += red(g2.get((int)x, (int)y))/(float)steps +
      green(g2.get((int)x, (int)y))/(float)steps +
      blue(g2.get((int)x, (int)y))/(float)steps;
  }
  return sum;
}

void drawString(PVector v, PVector u) {
  g1.line(v.x, v.y, u.x, u.y);
  g2.line(v.x, v.y, u.x, u.y);
}
