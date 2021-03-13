void initG2() {
  g2.beginDraw();
  // HÁTTÉR FELSŐ RÉSZE "ÉG"
  for (int i = 0; i < height; i++) {
    float h = map(i, 0, height*0.8, 255, 0);
    g2.stroke(255, h, h);
    g2.line(0, i, width, i);
  }

  // KIS FELHŐK
  g2.noStroke();
  g2.fill(255);
  miniFelho(width*0.35, height*0.46);
  miniFelho(width*0.54, height*0.43);
  g2.fill(255, 158, 158);
  miniFelho(width*0.347, height*0.46);
  miniFelho(width*0.544, height*0.4301);

  // NAP
  g2.fill(255, 255);
  g2.circle(width*0.45, height*0.47, (width*0.105+height*0.105)/2);
  for (float i =(width*0.105+height*0.105)/2; i <= width*0.35; i+=width*0.03) {
    float alpha = map(i, (width*0.105+height*0.105)/2, width*0.35, 30, 5);
    g2.fill(255, alpha);
    g2.circle(width*0.45, height*0.47, i);
  }

  // HÁTTÉR ALSÓ RÉSZE "VÍZ"
  for (float i = height*0.55; i < height; i++) {
    float h = map(i, height*0.55, height, 255, 0);
    g2.stroke(255, h, h);
    g2.line(0, i, width, i);
  }

  g2.noStroke();
  // HEGYEK
  // hegy #1(bal hátsó)
  g2.fill(108, 126, 174);
  g2.triangle(width*0.2, height*0.5, width*0.6, height*0.58, width*0.2, height*0.58);
  // hegy #2 (nap előtti)
  g2.fill(108, 126, 174);
  g2.triangle(width*0.5, height*0.5, width*0.56, height*0.468, width*0.6, height*0.5);
  g2.fill(100, 120, 170);
  g2.triangle(width*0.49, height*0.465, width*0.75, height*0.58, width*0.3, height*0.58);
  g2.quad(width*0.445, height*0.488, 
    width*0.5, height*0.5, 
    width*0.3, height*0.58, 
    width*0.425, height*0.492);
  g2.fill(127, 150, 188); // Sunny
  g2.triangle(width*0.49, height*0.465, width*0.445, height*0.488, width*0.455, height*0.495);
  // hegy #3 (bal első)
  g2.fill(100, 108, 158);
  g2.triangle(width*0.36, height*0.528, width*0.6, height*0.58, width*0.2, height*0.58);
  g2.fill(127, 150, 188); // Sunny
  g2.triangle(width*0.36, height*0.528, width*0.6, height*0.58, width*0.41, height*0.534);
  // hegy #4 (jobb oldali)
  g2.fill(90, 108, 158);
  g2.quad(width*0.5, height*0.58, 
    width*0.63, height*0.4, 
    width*0.66, height*0.41, 
    width*0.8, height*0.58);
  g2.fill(108, 126, 174);
  g2.beginShape();
  g2.vertex(width*0.5, height*0.58);
  g2.vertex(width*0.56, height*0.468); // bal csúcs
  g2.vertex(width*0.565, height*0.473);
  g2.vertex(width*0.57, height*0.472);
  g2.vertex(width*0.6, height*0.43); // középső csúcs
  g2.vertex(width*0.602, height*0.432); 
  g2.vertex(width*0.604, height*0.43);
  g2.vertex(width*0.608, height*0.43);
  g2.vertex(width*0.63, height*0.4); // jobb csúcs
  g2.vertex(width*0.619, height*0.43);
  g2.vertex(width*0.608, height*0.435);
  g2.vertex(width*0.612, height*0.44);
  g2.vertex(width*0.602, height*0.44);
  g2.vertex(width*0.582, height*0.473);
  g2.vertex(width*0.588, height*0.488);
  g2.vertex(width*0.59, height*0.51);
  g2.vertex(width*0.584, height*0.489);
  g2.vertex(width*0.575, height*0.48);
  g2.vertex(width*0.572, height*0.48);
  g2.endShape(CLOSE);

  //FÁK
  g2.fill(216, 191, 216);
  //fill(89, 102, 157); // ha napsütés intenzitás ++
  g2.beginShape();
  g2.vertex(0, height*0.582);
  for (int i = 0; i < trees.length; i++) {
    g2.vertex(trees[i].x, trees[i].y);
  }
  g2.vertex(width, height*0.582);
  g2.endShape(CLOSE);

  //FÁK ÁRNYÉKA
  g2.fill(89, 102, 157, 20);
  g2.beginShape();
  g2.vertex(0, height*0.582);
  for (int i = 0; i < trees.length; i++) {
    g2.vertex(trees[i].x, trees[i].y + height * 0.045);
  }
  g2.vertex(width, height*0.582);
  g2.endShape(CLOSE);

  // FÁK ALATTI "FÖLD"
  g2.fill(216, 191, 216);
  //fill(89, 102, 157); // ha napsütés intenzitás ++
  g2.beginShape();
  g2.vertex(width*0.2, height*0.58);
  g2.vertex(width*0.41, height*0.59);
  g2.vertex(width*0.47, height*0.588);
  g2.vertex(width*0.48, height*0.586);
  g2.vertex(width*0.5, height*0.58);
  g2.vertex(width*0.51, height*0.58);
  g2.vertex(width*0.515, height*0.585);
  g2.vertex(width*0.52, height*0.585);
  g2.vertex(width*0.53, height*0.58);
  g2.vertex(width*0.8, height*0.58);
  g2.endShape(CLOSE);

  //VÍZ FODROZÓDÁS
  g2.stroke(255, 40);
  g2.strokeWeight(3);
  g2.noFill();
  /*1*/  g2.curve(width*0.1, height*0.58, 
    width*0.3, height*0.62, 
    width*0.6, height*0.62, 
    width*0.8, height*0.59);
  g2.strokeWeight(3);
  /*2*/  g2.curve(width*0.2, height*0.65, 
    width*0.4, height*0.68, 
    width*0.8, height*0.68, 
    width, height*0.65);
  g2.strokeWeight(4);
  /*3*/  g2.curve(width*0.1, height*0.65, 
    width*0.3, height*0.71, 
    width*0.7, height*0.73, 
    width*0.8, height*0.5);
  /*4*/  g2.curve(width*0.1, height*0.65, 
    width*0.3, height*0.74, 
    width*0.7, height*0.78, 
    width, height*0.75);
  /*5*/  g2.curve(width*0.1, height*0.65, 
    width*0.3, height*0.76, 
    width*0.7, height*0.785, 
    width*0.75, height*0.65);
  g2.strokeWeight(3);
  /*6*/  g2.curve(width*0.1, height*0.75, 
    width*0.3, height*0.8, 
    width*0.7, height*0.8, 
    width, height*0.75);
  /*7*/  g2.curve(width*0.1, height*0.75, 
    width*0.3, height*0.82, 
    width*0.7, height*0.82, 
    width, height*0.85);
  g2.strokeWeight(2);
  /*8*/  g2.curve(width*0.2, height*0.87, 
    width*0.4, height*0.842, 
    width*0.7, height*0.842, 
    width, height*0.87);
  g2.noStroke();


  // BAL SZIGET
  g2.fill(71, 82, 146);
  g2.beginShape();
  g2.vertex(width*0.5, height);
  g2.vertex(width*0.36, height);
  g2.vertex(0, height);
  g2.vertex(0, height*0.58);
  g2.vertex(width*0.25, height*0.58);
  g2.vertex(width*0.29, height*0.57);
  g2.vertex(width*0.37, height*0.593);
  g2.vertex(width*0.42, height*0.65);
  g2.vertex(width*0.46, height*0.66);
  g2.vertex(width*0.47, height*0.672); // jobb szél
  g2.vertex(width*0.43, height*0.7);
  g2.vertex(width*0.425, height*0.698);
  g2.vertex(width*0.37, height*0.73);
  g2.vertex(width*0.37, height*0.78);
  g2.vertex(width*0.45, height*0.795);
  g2.vertex(width*0.462, height*0.837);
  g2.vertex(width*0.51, height*0.85);
  g2.endShape(CLOSE);

  //BAL SZIGET ÁRNYÉK
  g2.fill(71, 82, 146, 30);
  g2.beginShape();
  g2.vertex(width*0.47, height*0.672);
  g2.vertex(width*0.43, height*0.7);
  g2.vertex(width*0.425, height*0.698);
  g2.vertex(width*0.37, height*0.73);
  g2.vertex(width*0.37, height*0.8);
  g2.vertex(width*0.43, height*0.71); // alsó törés
  g2.vertex(width*0.44, height*0.71);
  g2.endShape(CLOSE);

  // JOBB SZIGET
  g2.fill(71, 82, 146);
  g2.beginShape();
  g2.vertex(width*0.73, height);
  g2.vertex(width, height);
  g2.vertex(width, height*0.5);
  g2.vertex(width*0.73, height*0.53);
  g2.vertex(width*0.67, height*0.555);
  g2.vertex(width*0.635, height*0.58);
  g2.vertex(width*0.61, height*0.59);
  g2.vertex(width*0.56, height*0.6);
  g2.vertex(width*0.552, height*0.605);
  g2.vertex(width*0.552, height*0.609); // bal széle
  g2.vertex(width*0.554, height*0.615);
  g2.vertex(width*0.6, height*0.65);
  g2.vertex(width*0.605, height*0.655);
  g2.vertex(width*0.61, height*0.66);
  g2.vertex(width*0.615, height*0.665);
  g2.vertex(width*0.62, height*0.675);
  g2.vertex(width*0.62, height*0.684);
  g2.vertex(width*0.619, height*0.69);
  g2.vertex(width*0.62, height*0.692);
  g2.vertex(width*0.69, height*0.745);
  g2.vertex(width*0.692, height*0.745);
  g2.vertex(width*0.73, height*0.79);
  g2.endShape(CLOSE);

  // JOBB SZIGET ÁRNYÉK
  g2.fill(71, 82, 146, 30);
  g2.beginShape();
  g2.vertex(width*0.58, height*0.635);
  g2.vertex(width*0.619, height*0.69);
  g2.vertex(width*0.69, height);
  g2.vertex(width*0.73, height);
  g2.vertex(width*0.73, height*0.75);
  g2.endShape(CLOSE);

  // LEGKÖZELEBBI SZÁRAZFŐLD
  g2.fill(44, 64, 123);
  g2.beginShape();
  g2.vertex(0, height);
  g2.vertex(0, height*0.85);
  //bal részlet
  g2.vertex(width*0.15, height*0.85);
  g2.vertex(width*0.22, height*0.81);
  g2.vertex(width*0.282, height*0.795);
  g2.vertex(width*0.34, height*0.75);
  g2.vertex(width*0.38, height*0.745);
  g2.vertex(width*0.41, height*0.8);
  g2.vertex(width*0.401, height*0.77);
  g2.vertex(width*0.404, height*0.769);
  g2.vertex(width*0.443, height*0.825);
  g2.vertex(width*0.462, height*0.837);
  g2.vertex(width*0.463, height*0.85);
  //jobb részlet
  g2.vertex(width*0.6, height*0.85);
  g2.vertex(width*0.65, height*0.84);
  g2.vertex(width*0.68, height*0.803);
  g2.vertex(width*0.7, height*0.8);
  g2.vertex(width*0.735, height*0.822);
  g2.vertex(width*0.75, height*0.85);
  g2.vertex(width*0.47, height*0.85);
  g2.vertex(width, height*0.85);
  g2.vertex(width, height);
  g2.endShape(CLOSE);

  // KÖZELI FÁK, KUNYHÓ
  g2.fill(44, 64, 123);
  //kunyhó
  g2.rect(width*0.695, height*0.78, width*0.038, height*0.027);
  g2.triangle(width*0.695, height*0.78, width*0.692, height*0.778, width*0.695, height*0.788);
  g2.quad(width*0.695, height*0.775, 
    width*0.734, height*0.773, 
    width*0.738, height*0.8, 
    width*0.695, height*0.8);
  g2.rect(width*0.73, height*0.807, width*0.002, height*0.2);
  g2.quad(width*0.73, height*0.806, 
    width*0.731, height*0.808, 
    width*0.7, height*0.83, 
    width*0.698, height*0.829);
  //kunyhó melletti fa
  g2.fill(44, 64, 123);
  g2.triangle(width*0.68, height*0.773, 
    width*0.685, height*0.78, 
    width*0.675, height*0.78);
  g2.triangle(width*0.68, height*0.775, 
    width*0.686, height*0.786, 
    width*0.674, height*0.786);
  g2.triangle(width*0.68, height*0.78, 
    width*0.687, height*0.792, 
    width*0.673, height*0.792);
  g2.triangle(width*0.68, height*0.785, 
    width*0.689, height*0.798, 
    width*0.671, height*0.798);
  g2.rect(width*0.679, height*0.796, width*0.002, height*0.01);

  // JOBB OLDALI FA #1
  g2.fill(71, 82, 146);
  g2.triangle(width*0.7, height*0.523, 
    width*0.696, height*0.532, 
    width*0.704, height*0.532);
  g2.triangle(width*0.7, height*0.525, 
    width*0.695, height*0.54, 
    width*0.705, height*0.54);
  g2.triangle(width*0.7, height*0.531, 
    width*0.693, height*0.547, 
    width*0.708, height*0.547);
  // JOBB OLDALI FA #2
  g2.fill(71, 82, 146);
  g2.triangle(width*0.615, height*0.57, 
    width*0.611, height*0.575, 
    width*0.619, height*0.575);
  g2.triangle(width*0.615, height*0.572, 
    width*0.609, height*0.582, 
    width*0.621, height*0.582);
  g2.triangle(width*0.615, height*0.575, 
    width*0.608, height*0.59, 
    width*0.622, height*0.59);

  //BAL OLDALI FA #1
  g2.fill(71, 82, 146);
  g2.triangle(width*0.29, height*0.555, 
    width*0.285, height*0.564, 
    width*0.295, height*0.564);
  g2.triangle(width*0.29, height*0.555, 
    width*0.283, height*0.575, 
    width*0.297, height*0.575);
  // BAL OLDALI FA #2
  g2.fill(71, 82, 146);
  g2.triangle(width*0.37, height*0.568, 
    width*0.365, height*0.578, 
    width*0.375, height*0.578);
  g2.triangle(width*0.37, height*0.572, 
    width*0.362, height*0.588, 
    width*0.378, height*0.588);
  g2.triangle(width*0.37, height*0.579, 
    width*0.361, height*0.6, 
    width*0.379, height*0.6);

  // BAL KERÍTÉS
  g2.fill(100, 255, 150);
  g2.fill(71, 82, 146);
  g2.rect(width*0.425, height*0.64, width*0.002, height*0.02);
  g2.rect(width*0.445, height*0.646, width*0.002, height*0.02);
  g2.beginShape();
  g2.vertex(width*0.425, height*0.64);
  g2.vertex(width*0.446, height*0.645);
  g2.vertex(width*0.47, height*0.672);
  g2.vertex(width*0.468, height*0.673);
  g2.vertex(width*0.445, height*0.647);
  g2.vertex(width*0.425, height*0.642);
  g2.endShape(CLOSE);
  g2.beginShape();
  g2.vertex(width*0.468, height*0.652);// oszlop széle
  g2.vertex(width*0.466, height*0.651);
  g2.vertex(width*0.466, height*0.672);
  g2.vertex(width*0.468, height*0.672);
  g2.endShape(CLOSE);
  // OLDALAK
  g2.fill(44, 64, 123);
  g2.quad(0, 0, width*0.52, 0, width*0.05, height, 0, height);
  g2.quad(width*0.48, 0, width, 0, width, height, width*0.95, height);
  // JOBB OLDALI KISEBB FELHŐ
  g2.fill(255, 145, 145);
  kisebbFelho();
  
  
  //csillagok
  g2.stroke(255);
  g2.strokeWeight(2);
  g2.point(width*0.6,height*0.4);
  g2.point(width*0.64,height*0.33);
  g2.point(width*0.4,height*0.35);
  g2.point(width*0.5,height*0.26);
  g2.endDraw();
  
}


void kisebbFelho() {
  g2.triangle(width*0.65, height*0.33, width*0.61, height*0.35, width*0.69, height*0.35);
  g2.ellipse(width*0.64, height*0.33, width*0.03, height*0.03);
  g2.arc(width*0.625, height*0.345, width*0.03, height*0.03, PI*0.9, TWO_PI);
  g2.arc(width*0.65, height*0.332, width*0.03, height*0.03, HALF_PI, TWO_PI+PI*0.1);
  g2.arc(width*0.667, height*0.34, width*0.03, height*0.03, PI, TWO_PI+PI*0.18);
}

void miniFelho(float w, float h) {
  g2.triangle(w, h-width*0.007, w-width*0.04, h+height*0.01, w+width*0.04, h+height*0.01);
  g2.arc(w-width*0.02, h+height*0.005, width*0.03, height*0.03, PI*0.9, TWO_PI);
  g2.arc(w, h, width*0.03, height*0.03, PI*0.9, TWO_PI+PI*0.2);
  g2.arc(w+width*0.015, h+height*0.005, width*0.03, height*0.03, PI*0.9, TWO_PI+PI*0.1);
}
