Blob[] blobs = new Blob[10];
void setup(){
   size(480, 360); 
   colorMode(HSB);
   for(int a = 0; a < blobs.length; a++){
     blobs[a] = new Blob(random(width), random(height));
   }
}
void draw(){
   loadPixels();
   for(int x = 0; x < width; x++){
      for(int y = 0; y < height; y++){
        int index = x + y * width;
        float sum = 0;
        for(Blob b : blobs){
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 80 * b.r / d;
        }
        pixels[index] = color(sum, 255, 255);
      }
   }
   updatePixels();
   for( Blob b : blobs){
   b.update();
   }
}
