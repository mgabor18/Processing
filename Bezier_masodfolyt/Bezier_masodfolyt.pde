//n = 4 + x*3 (x = 0, 1, 2, 3,...) => x+1 db Bézier ív rajzolódik
int x = 3, 
  n = 4 + x*3, 
  d = -1, 
  r = 8;
PVector[] points = new PVector[n];

void setup() {
  size(1000, 700);
  background(0);
  for (int i = 0; i < n; i++) {
    //másodrendű folytonosság
    if (3 < i && i < n-2 && (i-4) % 3 == 0) {
      //a4-a3
      PVector dif1 = new PVector(points[i-1].x-points[i-2].x, points[i-1].y-points[i-2].y);
      //a3-a2
      PVector dif2 = new PVector(points[i-2].x-points[i-3].x, points[i-2].y-points[i-3].y);
      //(a4-a3)-(a3-a2)
      PVector difFinal = new PVector(dif1.x-dif2.x, dif1.y-dif2.y);
      points[i] = new PVector(points[i-1].x+dif1.x, points[i-1].y+dif1.y);
      points[i+1] = new PVector(points[i-1].x+difFinal.x, points[i-1].y+difFinal.y);
      i+=2;
    } else if (i > 0) {
      points[i] = new PVector(points[i-1].x + floor(random(-50, 50)), 
                              points[i-1].y + floor(random(-50, 50)));
    }
    points[i] = new PVector(random(300, 700), random(300, 400));
  }
}


void draw() {
  background(0);

  //pont összekötő vonalak
  strokeWeight(0.5);
  stroke(255, 100, 150);
  for (int i = 0; i < n-1; i++) {
    line(points[i].x, points[i].y, points[i+1].x, points[i+1].y);
  }

  //Bézier ív(ek)
  strokeWeight(3);
  noFill();
  for (int i = 0; i < n-3; i+=3) {
    stroke(255);
    strokeWeight(3);
    noFill();
    drawBezier(points[i].x, points[i].y, points[i+1].x, points[i+1].y, 
      points[i+2].x, points[i+2].y, points[i+3].x, points[i+3].y);

    //fő pontok
    noStroke();
    fill(100, 255, 150);
    circle(points[i].x, points[i].y, r);
    circle(points[i+3].x, points[i+3].y, r);

    //köztes pontok
    fill(100);
    circle(points[i+1].x, points[i+1].y, r);
    circle(points[i+2].x, points[i+2].y, r);
  }
}

void drawBezier(float x1, float x2, float y1, float y2, float z1, float z2, float w1, float w2) {
  float t, xX, yY;
  beginShape();
  for (t = 0; t < 1; t+=0.01) {
    xX = x1 * pow(1-t, 3) + 
      y1 * (3*pow(1-t, 2)) * t +
      z1 * (3*(1-t)*pow(t, 2))+
      w1 * pow(t, 3);
    yY = x2 * pow(1-t, 3) + 
      y2 * (3*pow(1-t, 2)) * t +
      z2 * (3*(1-t)*pow(t, 2))+
      w2 * pow(t, 3);

    vertex(xX, yY);
  }
  endShape();
}

void mousePressed() {
  for (int i = 0; i < n; i++) {
    if (sqrt(pow(mouseX-points[i].x, 2) + pow(mouseY-points[i].y, 2)) < r/2) {
      d = i;
    }
  }
}

void mouseDragged() {
  if (d == 0 || d == n-1) {
    points[d].x = mouseX;
    points[d].y = mouseY;
  }
}

void mouseReleased() {
  d = -1;
}
