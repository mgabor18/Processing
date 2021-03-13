class Blob{
  PVector pos;
  float r;
  PVector vel;
  
  Blob(float x, float y){
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(2,5));
    r = random(20,50);
  }
  
  void update(){
    pos.add(vel);
    if(pos.x > width || pos.x < 0){
        vel.x *= -1; 
    }
    if(pos.y > height || pos.y < 0){
        vel.y *= -1; 
    }
  }
}
