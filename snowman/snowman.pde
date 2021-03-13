float x, y, z, angle = 0;
void setup() {

  size(400, 400, P3D);
  background(0);
  noStroke();
  x = width/2;
  y = height/2;
  z = 0;
}
void draw() {
  background(20);
  ortho();
  lights();
  translate(x, y+width/8, z);
  rotateX(radians(-25));
  rotateY(radians(angle));
  fill(255);
  sphere(40);
  translate(0, -50, z);
  sphere(25);
  translate(0,-30,z);
  sphere(15);
  fill(0);
  translate(-45,30,z);
  rotateZ(radians(15));
  box(45,5,2);
  rotateZ(radians(-15));
  translate(90,0,z);
  rotateZ(radians(-15));
  box(45,5,2);
  rotateZ(radians(15)) ;
  translate(-50,-34,15);
  sphere(3);
  translate(10,0,0);
  sphere(3);
  fill(255,0,0);
  translate(-5,5,0);
  box(2,2,25);
  fill(139,69,19);
  translate(65,50,-15);
  box(5,100,5);
  translate(0,-60,0);
  box(3,20,5);
  translate(6,2,0);
  rotateZ(radians(40));
  box(3,20,5);
  rotateZ(radians(-40));
  translate(-12,0,0);
  rotateZ(radians(-40));
  box(3,20,5);
  rotateZ(radians(40));
  angle++;
}
