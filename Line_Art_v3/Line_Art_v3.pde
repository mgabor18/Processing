int w, h, drawSteps = 2000, maxStringSteps = 30;
PVector point1 = new PVector();
PVector point2 = new PVector();
PVector point1Final = new PVector();
PVector point2Final = new PVector();
PVector point1FinalOld = new PVector(0, 0);
PVector point2FinalOld = new PVector(0, 0);
PImage img;
PGraphics g1, g2, g3;
void setup() {
  img = loadImage("a.jpg");
  size(960, 720);
  frameRate(120);
  init();
}

void draw() {
  float min = 3*255, brightness;
  for (int i = 0; i < drawSteps; i++) {
    point1.x = floor(random(0, w));
    point1.y = floor(random(0, h));
    point2.x = floor(random(0, w));
    point2.y = floor(random(0, h));
    brightness = stringBrightness(point1, point2);
    if (brightness < min && abs(point1.x-point2.x) <= maxStringSteps && abs(point1.y-point2.y) <= maxStringSteps) { // && abs(point1.x-point2.x) > 30 && abs(point1.y-point2.y) > 30
      min = brightness;
      point1Final.x = point1.x;
      point1Final.y = point1.y;
      point2Final.x = point2.x;
      point2Final.y = point2.y;
    }
  }
  if (point1FinalOld.x != point1Final.x &&
    point1FinalOld.y != point1Final.y &&
    point2FinalOld.x != point2Final.x &&
    point2FinalOld.y != point2Final.y ) {
    g1.beginDraw();
    g2.beginDraw();
    g3.beginDraw();
    g1.stroke(stringAvgR(point1Final, point2Final), 
      stringAvgG(point1Final, point2Final), //  calculating the average color
      stringAvgB(point1Final, point2Final)); // of the line from the original picture
    drawString(point1Final, point2Final);
    g1.endDraw();
    g2.endDraw();
    g3.endDraw();
    point1FinalOld.x = point1Final.x;
    point1FinalOld.y = point1Final.y;
    point2FinalOld.x = point2Final.x;
    point2FinalOld.y = point2Final.y;
  }
  image(g1, 0, 0);
  if (mousePressed) {
    image(g3, 0, 0);
  }
}

void keyPressed(){
   save("a_.png"); 
}

void init() {
  w = img.width;
  h = img.height;
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
  g3 = createGraphics(w, h);
  g3.beginDraw();
  g3.image(img, 0, 0);
}

float stringBrightness(PVector v, PVector u) {
  float x, y;
  float sum = 0;
  int steps = maxStringSteps;
  for (int i = 0; i < steps; i++) {
    x = v.x + (float)i/steps*(u.x-v.x); // abs??
    y = v.y + (float)i/steps*(u.y-v.y);
    sum += red(g2.get((int)x, (int)y)) / (float)steps +
      green(g2.get((int)x, (int)y)) / (float)steps +
      blue(g2.get((int)x, (int)y)) / (float)steps;
  }
  return sum;
}

float stringAvgR(PVector v, PVector u) {
  float x, y;
  float sumR = 0;
  int steps = maxStringSteps;
  for (int i = 0; i < steps; i++) {
    x = v.x + (float)i/steps*(u.x-v.x);
    y = v.y + (float)i/steps*(u.y-v.y);
    sumR += red(g3.get((int)x, (int)y)) / (float)steps;
  }
  return sumR;
}

float stringAvgG(PVector v, PVector u) {
  float x, y;
  float sumG = 0;
  int steps = maxStringSteps;
  for (int i = 0; i < steps; i++) {
    x = v.x + (float)i/steps*(u.x-v.x);
    y = v.y + (float)i/steps*(u.y-v.y);
    sumG += green(g3.get((int)x, (int)y)) / (float)steps;
  }
  return sumG;
}

float stringAvgB(PVector v, PVector u) {
  float x, y;
  float sumB = 0;
  int steps = maxStringSteps;
  for (int i = 0; i < steps; i++) {
    x = v.x + (float)i/steps*(u.x-v.x);
    y = v.y + (float)i/steps*(u.y-v.y);
    sumB += blue(g3.get((int)x, (int)y)) / (float)steps;
  }
  return sumB;
}

void drawString(PVector v, PVector u) {
  g1.line(v.x, v.y, u.x, u.y);
  g2.line(v.x, v.y, u.x, u.y);
}
