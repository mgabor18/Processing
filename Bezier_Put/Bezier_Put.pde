int r = 10, d = -1;
boolean drawMode = true;
ArrayList<PVector> pointS = new ArrayList<PVector>();
void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  background(0);
  if (pointS.size() == 10) {
    drawMode = false;
  }

  strokeWeight(0.5);
  stroke(100, 150, 255);
  drawLinesBetweenPoints();

  stroke(255, 100, 150);
  strokeWeight(2);
  drawBezierBernstein();

  noStroke();
  fill(100, 255, 150);
  drawPoints();
}

// MATH FUNCTIONS
int intFact(int x) {
  if(x == 0){
     return 1; 
  }
  return x * intFact(x-1);
}

float nAlattI(int n, int i) {
  int nFact = intFact(n);
  int iFact = intFact(i);
  int nMinusIFact = intFact(n-i);

  return nFact / (iFact * nMinusIFact);
}

float B(int i, int n, float t) {
  n -= 1;
  return nAlattI(n, i) * pow(t, i) * pow(1-t, n-i);
}

// DRAWING FUNCTIONS
void drawBezierBernstein() {
  noFill();
  beginShape();
  for (float t = 0; t < 1; t+=0.01) {
    float xX = 0, yY = 0;
    for (int i = 0; i < pointS.size(); i++) {
      xX += B(i, pointS.size(), t) * pointS.get(i).x;
      yY += B(i, pointS.size(), t) * pointS.get(i).y;
    }
    vertex(xX, yY);
  }
  endShape();
}

void drawPoints() {
  for (int i = 0; i < pointS.size(); i++) {
    circle(pointS.get(i).x, pointS.get(i).y, r);
  }
}

void drawLinesBetweenPoints() {
  for (int i = 0; i < pointS.size()-1; i++) {
    line(pointS.get(i).x, pointS.get(i).y, pointS.get(i+1).x, pointS.get(i+1).y);
  }
}

// MOUSE INTERACTIONS
void mousePressed() {
  if (drawMode) {
    pointS.add(new PVector(mouseX, mouseY));
  } else {
    for (int i = 0; i < pointS.size(); i++) {
      if (sqrt(pow(mouseX-pointS.get(i).x, 2) + pow(mouseY-pointS.get(i).y, 2)) < r/2) {
        d = i;
      }
    }
  }
}

void mouseDragged() { 
  if (d >= 0 && d < pointS.size()) {
    pointS.set(d, new PVector(mouseX, mouseY));
  }
}

void mouseReleased() {
  d = -1;
}
// KEYBOARD INTERACTIONS
void keyPressed() {
  drawMode = false;
}
