void setup() {
  size(1200, 800);
  background(75,0,130);
  for (int i = 1; i < 10000; i++) {
    IntList sequence = new IntList();
    int n = i;
    do {
      sequence.append(n);
      n = collatz(n);
    } while (n != 1);
    sequence.append(1);
    sequence.reverse();
    float len = height/100.0;
    resetMatrix();
    translate(width*0.25, height*0.25);
    for (int j = 0; j < sequence.size(); j++) {
      int value = sequence.get(j);
      if (value % 2 == 0) {
        rotate(0.27-(0.0002*j));
      } else {
        rotate(-0.19+(0.00025*j));
      }
      strokeWeight(2);
      stroke(255,255,180,20);
      line(0, 0, 0, -len);
      translate(0, -len);
    }
  }
}
int collatz(int n) {
  if (n % 2 == 0) {
    return n / 2;
  } else {
    return (n * 3 + 1)/2;
  }
}
