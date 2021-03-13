float angle = 0, angleMid = 0, value = 1;
void setup() {
  size(600, 600, P3D);
  background(0);
  noStroke();
  stroke(0);
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);
  rotateX(radians(-20));
  rotateY(radians(40));
  rotateY(radians(angle));
  fill(255);
  box(50);
  fill(100, 255, 150);
  translate(-50, -50, -50);
  box(50);
  translate(0, 0, 100);
  box(50);
  translate(100, 0, 0);
  box(50);
  translate(0, 0, -100);
  box(50);
  translate(0, 100, 0);
  box(50);
  translate(0, 0, 100);
  box(50);
  translate(-100, 0, 0);
  box(50);
  translate(0, 0, -100);
  box(50);
  translate(50, -50, 50);// közepe
  //felső
  //rotateY(radians(angle+0.2));
  fill(255, 100, 150);
  translate(0, -100, 0);
  box(50);
  translate(-100, 0, 0);
  box(50);
  translate(0, 0, -100);
  box(50);
  translate(100, 0, 0);
  box(50);
  translate(100, 0, 0);
  box(50);
  translate(0, 0, 100);
  box(50);
  translate(0, 0, 100);
  box(50);
  translate(-100, 0, 0);
  box(50);
  translate(-100, 0, 0);
  box(50);
  translate(100, 100, -100);// közepe
  fill(255, 240, 10);
  //középső
  rotateY(radians(angleMid));
  translate(-100, 0, 0);
  box(50);
  translate(0, 0, -100);
  box(50);
  translate(100, 0, 0);
  box(50);
  translate(100, 0, 0);
  box(50);
  translate(0, 0, 100);
  box(50);
  translate(0, 0, 100);
  box(50);
  translate(-100, 0, 0);
  box(50);
  translate(-100, 0, 0);
  box(50);
  translate(100, 0, -100);// közepe
  //alsó
  rotateY(radians(-angleMid));
  fill(150, 100, 255);
  translate(0, 100, 0);
  box(50);
  translate(-100, 0, 0);
  box(50);
  translate(0, 0, -100);
  box(50);
  translate(100, 0, 0);
  box(50);
  translate(100, 0, 0);
  box(50);
  translate(0, 0, 100);
  box(50);
  translate(0, 0, 100);
  box(50);
  translate(-100, 0, 0);
  box(50);
  translate(-100, 0, 0);
  box(50);
  angle++;
  if (angleMid>=180) {
    value = -2;
  } else if (angleMid<=-90) {
    angleMid = 0;
    value = 1;
  }

  angleMid+=value;
}
