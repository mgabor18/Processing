int n, magnitude, rotation, numOfWaves, r;

float t = 0;
void setup() { 
  size(400, 400);

  n = 500;   //number of ellipse per circle
  magnitude = 10;    //magnitude of waves
  rotation = 2;    //f of rotation
  numOfWaves = 10;    //f of waves
  r = 200;
}

void draw() {
  background(20);
  translate(width/2, height/2);
  stroke(255);
  noFill();
  circle(0, 0, r);

  noStroke();
  fill(100, 255, 150);
  paintCircle(t, 0);
  paintCircle(t, PI);
  t+=0.01;
}

void paintCircle(float t, float shift) {
  for (int i = 0; i < n; i++) {
    float point = (i/n) * TWO_PI;
    float x = sin(point + t) * (r/2+sin((t*rotation + point)*numOfWaves + shift) * magnitude * (1-sin(point)));   
    float y = cos(point + t) * (r/2+sin((t*rotation + point)*numOfWaves + shift) * magnitude * (1-sin(point)));
    circle(x,y,2);
  }
}
