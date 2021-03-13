int x = int(random(-200, 200)), y = int(random(-200, 200)), 
  xOff = 2, yOff = 3, r = 30, angle = 0;
PVector[] dots = new PVector[25];
void setup() {
  size(700, 700);
  int index = 0;
  for (int i = -200; i <300; i+=100) {
    for (int j = -200; j <300; j+=100) {
      dots[index] = new PVector(i, j);
      index++;
    }
  }
}

void draw() {
  background(0);
  noStroke();
  //static dots
  translate(width/2, height/2);
  rotate(radians(angle));
  for (int i = 0; i < 25; i++) {
    if (sqrt(pow(dots[i].x-x, 2) + pow(dots[i].y-y, 2)) < r) {
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    circle(dots[i].x, dots[i].y, r);
  }
  //bouncing dot
  for (int i = 0; i <25; i++) {
    if (sqrt(pow(dots[i].x-x, 2) + pow(dots[i].y-y, 2)) < r) {
      fill(255, 0, 0);
    }
  }
  circle(x, y, r);
  //bounce effect
  if (x+(r/2) >= 200 || x-(r/2) <= -200) {
    xOff = -xOff;
  }
  if (y+(r/2) >= 200 || y-(r/2) <= -200) {
    yOff = -yOff;
  }
  x += xOff;
  y += yOff;
  angle++;
}
