float angle = 0;
void setup() {
  size(400, 400, P3D);
  background(0);
  stroke(100, 255, 150);
  strokeWeight(0.1);
}


void draw() {
  background(0);
  translate(width/2, height/2);
  rotateX(radians(-20));
  rotateY(radians(angle));
  heartShape(3, 5, -3, -1, 
    -100, -200, 100, 0);

  angle++;
}

void heartShape(float xMin, float yMin, float xMax, float yMax, 
  float uMin, float vMin, float uMax, float vMax) {
  noFill();
  translate(uMin, vMin); // t1 
  scale((uMax-uMin)/(xMax-xMin), (vMax-vMin)/(yMax-yMin)); // s1
  translate(-xMin, -yMin); // t2
  beginShape();
  for (float x = -2; x < 2; x+=0.01) {
    float y = sqrt(1-pow(abs(x)-1, 2));
    vertex(x, y, 0);
  }
  for (float x = -2; x < 2; x+=0.01) {
    float y = -3 * sqrt(1-(sqrt( abs(x)) / sqrt(2) ));
    float xX = x;
    xX = -xX;
    vertex(xX, y, 0);
  }
  endShape();
}
