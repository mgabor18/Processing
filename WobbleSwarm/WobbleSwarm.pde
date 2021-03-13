FloatList mass = new FloatList();
FloatList positionX = new FloatList();
FloatList positionY = new FloatList();
FloatList velocityX = new FloatList();
FloatList velocityY = new FloatList();

void setup() {
  size(1000, 700);
  noStroke();
  fill(100, 255, 150, 100);
}

void draw() {
  background(0);

  for (int particleA = 0; particleA < mass.size(); particleA++) {
    float accelerationX = 0, accelerationY = 0; 

    for (int particleB = 0; particleB < mass.size(); particleB++) {
      if (particleA != particleB) {
        float distanceX = positionX.get(particleB)-positionX.get(particleA);
        float distanceY = positionY.get(particleB)-positionY.get(particleA);

        float distance = sqrt(distanceX * distanceX + distanceY * distanceY); 
        if (distance < 1) {
          distance = 1;
        }

        float force = (distance - 320) * mass.get(particleB) / distance;
        accelerationX += force * distanceX;
        accelerationY += force * distanceY;
      }
    }
    velocityX.set(particleA, velocityX.get(particleA)* 0.99 + accelerationX * mass.get(particleA));
    velocityY.set(particleA, velocityY.get(particleA)* 0.99 + accelerationY * mass.get(particleA));
  }

  for (int particle = 0; particle < mass.size(); particle++) {
    positionX.set(particle, positionX.get(particle) + velocityX.get(particle));
    positionY.set(particle, positionY.get(particle) + velocityY.get(particle));

    circle(positionX.get(particle), positionY.get(particle), mass.get(particle)*1000);
  }
}

void addNewParticle() {
  mass.append(random(0.003, 0.03));
  positionX.append(mouseX);
  positionY.append(mouseY);
  velocityX.append(0);
  velocityY.append(0);
}

void mousePressed() {
  addNewParticle();
}

void mouseDragged() {
  addNewParticle();
}
