int n = 8, angle = 0; 
float scale = 100;
PVector[] cube1 = new PVector[n];
PVector[] cube2 = new PVector[n];
void setup() {
  size(600, 600, P3D);
  background(0);

  cube1[0] = new PVector(0, 0, 0);
  cube1[1] = new PVector(0, 0, -scale);
  cube1[2] = new PVector(scale, 0, -scale);
  cube1[3] = new PVector(scale, 0, 0);

  cube1[4] = new PVector(scale, scale, 0);
  cube1[5] = new PVector(0, scale, 0);
  cube1[6] = new PVector(0, scale, -scale);
  cube1[7] = new PVector(scale, scale, -scale);

  cube2[0] = new PVector(0, 0, 0);
  cube2[1] = new PVector(0, 0, scale);
  cube2[2] = new PVector(-scale, 0, scale);
  cube2[3] = new PVector(-scale, 0, 0);

  cube2[4] = new PVector(-scale, -scale, 0);
  cube2[5] = new PVector(0, -scale, 0);
  cube2[6] = new PVector(0, -scale, scale);
  cube2[7] = new PVector(-scale, -scale, scale);
}

void draw() {
  background(0);
  ortho();
  translate(width/2, height/2);
  rotateX(radians(angle));
  rotateY(radians(angle));
  rotateZ(radians(angle));

  cubesAndBeziers();
  
  rotateY(radians(90));
  cubesAndBeziers();
  
  rotateY(radians(90));
  cubesAndBeziers();
  
  rotateY(radians(90));
  cubesAndBeziers();
  angle++;
}

int xFact(int x) {
  if (x == 0) {
    return 1;
  }
  return x * xFact(x-1);
}

int nAlattI(int n, int i) {
  int nFact = xFact(n);
  int iFact = xFact(i);
  int nMinusIFact = xFact(n-i);

  return nFact / (iFact * nMinusIFact) ;
}

float B(int i, int n, float t) {
  n--;
  return nAlattI(n, i) * pow(t, i) * pow(1-t, n-i);
}

void drawBezier1() {
  noFill();
  beginShape();
  for (float t = 0; t < 1; t+=0.01) {
    float xX=0, yY=0, zZ=0;
    for (int i = 0; i < n; i++) {
      xX += B(i, n, t) * cube1[i].x;
      yY += B(i, n, t) * cube1[i].y;
      zZ += B(i, n, t) * cube1[i].z;
    }
    vertex(xX, yY, zZ);
  }
  endShape();
}


void drawBezier2() {
  noFill();
  beginShape();
  for (float t = 0; t < 1; t+=0.01) {
    float xX=0, yY=0, zZ=0;
    for (int i = 0; i < n; i++) {
      xX += B(i, n, t) * cube2[i].x;
      yY += B(i, n, t) * cube2[i].y;
      zZ += B(i, n, t) * cube2[i].z;
    }
    vertex(xX, yY, zZ);
  }
  endShape();
}

void cubesAndBeziers() {
  strokeWeight(2);
  stroke(255, 0, 0);
  drawBezier1();
  drawBezier2();
  stroke(255);
  strokeWeight(3);
  //translate(scale/2, scale/2, -scale/2);
  //box(scale);
  //translate(-scale/2, -scale/2, scale/2);
  //translate(-scale/2, -scale/2, scale/2);
  //box(scale);
  //translate(scale/2, scale/2, -scale/2);
  box(scale*2);
}
