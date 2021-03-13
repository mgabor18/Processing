int rows = 4, cols = 4, between = 3;
int[][] Tiles = new int[rows][cols];
void setup() {
  size(600, 600);
  fill(200, 200, 50);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      Tiles[i][j] = floor(random(4));
    }
  }
}

void draw() {
  background(100, 30, 230);
  noStroke();
  for (int i = 0; i < rows; i++) {
    float y = i * (height / (float)rows);
    for (int j = 0; j < cols; j++) {
      float x = j * (width / (float)cols);
      drawTileShape(x + between, y + between, 
        width / (float)cols - between*2, 
        height / (float)rows - between*2, 
        Tiles[i][j]);
    }
  }
}

void drawTileShape(float x, float y, float newW, float newH, int tileNum) {
  switch(tileNum) {
  case 0: //Délnyugati sarok
    arc(x, y+newH, 2*newW, 2*newH, 1.5*PI, TWO_PI);
    break;
  case 1: //Délkeleti sarok
    arc(x+newW, y+newH, 2*newW, 2*newH, PI, PI + HALF_PI);
    break;
  case 2: //Északkeleti sarok
    arc(x+newW, y, 2*newW, 2*newH, HALF_PI, PI);
    break;
  case 3: //Északnyugati sarok
    arc(x, y, 2*newW, 2*newH, 0, HALF_PI);
    break;
  }
}

void keyPressed() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      Tiles[i][j] = floor(random(4));
    }
  }
}

void mouseClicked() {
  int j = floor(cols * mouseX / width);
  int i = floor(rows * mouseY / height);
  Tiles[i][j] = (Tiles[i][j] + 1) % 4;
}
