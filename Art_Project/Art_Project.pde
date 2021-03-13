float speed = 0.5, boatSpeed = 0.5;
float newW, newH, boatW, boatH;
PVector[] trees;
PGraphics g1, g2;
void setup() {
  size(1024, 768);
  //fullScreen();
  background(10, 10, 70);
  newW = width*0.32;
  newH = height*0.2;
  boatW = width*0.54;
  boatH = height*0.67;
  trees = new PVector[width];
  for (int i = 0; i < width; i++) {
    trees[i] = new PVector(i*2, random(height*0.55, height*0.57));
  }
  g1 = createGraphics(width, height);
  g2 = createGraphics(width, height);
  initG2();
  noLoop();
}

void draw() {
  // FELHŐ
  g1.beginDraw();
  g1.image(g2, 0, 0);
  g1.noStroke();
  g1.fill(44, 64, 123);
  /*if (newW>=width/2) { //ÁRNYÉK A MOZGÓ FELHŐNEK//
   felho(width/2+(newW-width/2)*0.95, newH+height*0.01);
   } else {
   felho(width/2-(width/2-newW)*0.95, newH+height*0.01);
   }*/
  g1.fill(255, 178, 178);
  felho(newW, newH);

  g1.fill(71, 82, 146);
  boat(boatW, boatH);
  g1.fill(71, 82, 146, 30);
  boatShadow(boatW, boatH+height*0.02);
  g1.stroke(71, 82, 146);
  g1.noFill();
  g1.strokeWeight(0.5);
  g1.curve(width*0.45, height*0.55, 
    width*0.468, height*0.652, 
    width*0.51, height*0.67, 
    width*0.6, height*0.55);

  g1.endDraw();
  image(g1, 0, 0);

  if (newW >= width*0.7 || newW < width*0.3) {
    speed = -speed;
  }
  newW += speed;
}

void keyPressed() {
  //loop();
  //save("picture.png");
}

void felho(float w, float h) {
  g1.triangle(w, h+height*0.01, w+width*0.13, h+height*0.05, w-width*0.13, h+height*0.05);
  g1.ellipse(w, h-height*0.05, width*0.09, height*0.1);
  g1.rect(w-width*0.1, h-height*0.02, width*0.2, height*0.07, 20);
  g1.arc(w-width*0.06, h+height*0.02, width*0.1, height*0.125, PI*0.85, TWO_PI);
  g1.arc(w+width*0.05, h-height*0.02, width*0.1, height*0.12, HALF_PI, TWO_PI+PI*0.1);
  g1.arc(w+width*0.07, h+height*0.02, width*0.07, height*0.11, PI, TWO_PI+PI*0.18);
}

void boat(float w, float h) {
  //w 0.54, h 0.67
  g1.beginShape();
  //bal sarok
  g1.vertex(w-width*0.03, h);
  g1.vertex(w-width*0.02, h);
  g1.vertex(w-width*0.015, h+height*0.003);
  g1.vertex(w, h+height*0.003);
  //jobb fel sarok
  g1.vertex(w+width*0.01, h+height*0.001);
  g1.vertex(w+width*0.008, h+height*0.001);
  g1.vertex(w+width*0.015, h-height*0.006);
  //jobb al sarok
  g1.vertex(w+width*0.01, h+height*0.002);
  g1.vertex(w+width*0.01, h+height*0.003);
  g1.vertex(w+width*0.008, h+height*0.01);
  //bal al sarok
  g1.vertex(w-width*0.02, h+height*0.01);
  g1.vertex(w-width*0.028, h+height*0.005);
  g1.endShape(CLOSE);

  g1.beginShape();
  //árbócközép
  g1.vertex(w-width*0.01, h+height*0.003);
  g1.vertex(w-width*0.01, h+height*0.001);
  //balalsó
  g1.vertex(w-width*0.013, h+height*0.001);
  g1.vertex(w-width*0.0127, h-height*0.005);
  //bal felső
  g1.vertex(w-width*0.0137, h-height*0.015);
  //jobb felső
  g1.vertex(w-width*0.008, h-height*0.017);
  g1.vertex(w-width*0.005, h-height*0.005);
  //jobb alsó
  g1.vertex(w-width*0.007, h+height*0.001);
  g1.vertex(w-width*0.0085, h+height*0.001);
  g1.vertex(w-width*0.0085, h+height*0.003);
  g1.endShape(CLOSE);

  g1.beginShape();
  g1.vertex(w, h+height*0.003);
  g1.vertex(w, h+height*0.001);
  g1.vertex(w-width*0.002, h+height*0.001);
  g1.vertex(w-width*0.002, h-height*0.012);
  g1.vertex(w+width*0.002, h-height*0.011);
  g1.vertex(w+width*0.002, h+height*0.001);
  g1.vertex(w+width*0.001, h+height*0.001);
  g1.vertex(w+width*0.001, h+height*0.003);
  g1.endShape(CLOSE);
}

void boatShadow(float w, float h) {
  g1.beginShape();
  //bal sarok
  g1.vertex(w-width*0.03, h);
  g1.vertex(w-width*0.02, h);
  g1.vertex(w-width*0.015, h-height*0.003);
  g1.vertex(w, h-height*0.003);
  //jobb fel sarok
  g1.vertex(w+width*0.01, h-height*0.001);
  g1.vertex(w+width*0.008, h-height*0.001);
  g1.vertex(w+width*0.015, h+height*0.006);
  //jobb al sarok
  g1.vertex(w+width*0.01, h-height*0.002);
  g1.vertex(w+width*0.01, h-height*0.003);
  g1.vertex(w+width*0.008, h-height*0.01);
  //bal al sarok
  g1.vertex(w-width*0.02, h-height*0.01);
  g1.vertex(w-width*0.028, h-height*0.005);
  g1.endShape(CLOSE);

  g1.beginShape();
  //árbócközép
  g1.vertex(w-width*0.01, h-height*0.003);
  g1.vertex(w-width*0.01, h-height*0.001);
  //balalsó
  g1.vertex(w-width*0.013, h-height*0.001);
  g1.vertex(w-width*0.0127, h+height*0.005);
  //bal felső
  g1.vertex(w-width*0.0137, h+height*0.015);
  //jobb felső
  g1.vertex(w-width*0.008, h+height*0.017);
  g1.vertex(w-width*0.005, h+height*0.005);
  //jobb alsó
  g1.vertex(w-width*0.007, h-height*0.001);
  g1.vertex(w-width*0.0085, h-height*0.001);
  g1.vertex(w-width*0.0085, h-height*0.003);
  g1.endShape(CLOSE);

  g1.beginShape();
  g1.vertex(w, h-height*0.003);
  g1.vertex(w, h-height*0.001);
  g1.vertex(w-width*0.002, h-height*0.001);
  g1.vertex(w-width*0.002, h+height*0.012);
  g1.vertex(w+width*0.002, h+height*0.011);
  g1.vertex(w+width*0.002, h-height*0.001);
  g1.vertex(w+width*0.001, h-height*0.001);
  g1.vertex(w+width*0.001, h-height*0.003);
  g1.endShape(CLOSE);
}
