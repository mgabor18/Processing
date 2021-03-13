PImage img;

void setup(){
  img = loadImage("damon.jpg");
  size(1024,640);
  img.filter(GRAY);
  image(img,0,0);
}

int index(int x, int y){
  return x + y * img.width;
}

void draw(){
  img.loadPixels();
  for(int y = 0; y < img.height - 1; y++){
   for(int x = 1; x < img.width - 1; x++){
     color pix = img.pixels[index(x, y)];
     
     float oldR = red(pix);
     float oldG = green(pix);
     float oldB = blue(pix);
     int factor = 1;
     int newR = round(factor * oldR / 255) * (255/factor);
     int newG = round(factor * oldG / 255) * (255/factor);
     int newB = round(factor * oldB / 255) * (255/factor);
     img.pixels[index(x, y)] = color(newR, newG, newB);
     
     float errR = oldR - newR;
     float errG = oldG - newG;
     float errB = oldB - newB;
     
     int index = index(x+1, y);
     dithering(index, 7, errR, errG, errB);
     
     index = index(x-1, y+1);
     dithering(index, 3, errR, errG, errB);
     
     index = index(x, y+1);
     dithering(index, 5, errR, errG, errB);
     
     index = index(x+1, y+1);
     dithering(index, 1, errR, errG, errB);
   }
  }
  img.updatePixels();
  image(img, 512, 0);
}

void dithering(int index, int value, float errR, float errG, float errB){
     color c = img.pixels[index];
     float r = red(c);
     float g = green(c);
     float b = blue(c);
     r = r + errR * value / 16.0;
     g = g + errG * value / 16.0;
     b = b + errB * value / 16.0;
     img.pixels[index] = color(r, g, b);
}
