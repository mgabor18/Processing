int n = 10; //number of iterations
int distance = 20; //distance of lines
float angle = 0, speed = 0, alpha = 0, col = 0;
void setup() {
  frameRate(120);
  size(600, 600);
  strokeWeight(5);
  noFill();
  colorMode(HSB);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  if (angle >= 360) {
    angle = 0;
  }
  rotate(radians(angle));

  for (int i = 0; i <= n; i++) {
    int size  = i * distance;
    float offSet = TWO_PI/n*i;
    float arcEndPoint = map(sin(speed+offSet), -1, 1, PI, 1.5*TWO_PI); // 1.5*TWO_PI
    alpha = map(arcEndPoint, PI, 1.5*TWO_PI, 0, 255);
    //float sizeH = map(size,0,width*0.75,0,360); // hue based on distance from center
    float sizeH = map(arcEndPoint, PI, 1.5*TWO_PI, 360, 0); // hue based on arc length
    if (size != 0 && size <= width*0.75) {
      stroke(sizeH, 255, 255, alpha); // HSB
      arc(0, 0, size, size, PI, arcEndPoint);
    }
  }
  speed += 0.025;
  angle += 5;
}
