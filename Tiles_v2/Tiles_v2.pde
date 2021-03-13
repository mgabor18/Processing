int rows = 10, cols = 10, between = 2;
int[][] Tiles = new int[rows][cols];
void setup() {
  size(600, 600);
  noStroke();
  fill(200, 200, 0);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      Tiles[i][j] = floor(random(2));
    }
  }
}

void draw() {
  background(40, 100, 200);
  for (int i = 0; i < rows; i++) {
    float y = i * (height / (float)rows);
    for (int j = 0; j < cols; j++) {
      float x = j * (width / (float)cols);
      drawTile(x + between, y + between, 
        width / (float)cols - between*2, 
        height / (float)rows - between*2, 
        Tiles[i][j]);
    }
  }
}

void drawTile(float x, float y, float newW, float newH, int tileNum) {
  if (tileNum != 0) {
    drawTilePlusShape(x, y, newW, newH);
  } else {
    drawTileCrossShape(x, y, newW, newH);
  }
}


void drawTilePlusShape(float x, float y, float newW, float newH) {
  float scale = 0.5;
  arc(x, y + (height / ((float)rows*2) - between), scale*newW, scale*newH, 1.5*PI, 2.5*PI);
  arc(x + (width / ((float)cols*2) - between), y + newH, scale*newW, scale*newH, PI, TWO_PI);
  arc(x+newW, y + (height / ((float)rows*2) - between), scale*newW, scale*newH, HALF_PI, 1.5*PI);
  arc(x + (width / ((float)cols*2) - between), y, scale*newW, scale*newH, 0, PI);
}

void drawTileCrossShape(float x, float y, float newW, float newH) {
  float scale = 0.5;
  arc(x, y+newH, scale*newW, scale*newH, 1.5*PI, TWO_PI);
  arc(x+newW, y+newH, scale*newW, scale*newH, PI, PI + HALF_PI);
  arc(x+newW, y, scale*newW, scale*newH, HALF_PI, PI);
  arc(x, y, scale*newW, scale*newH, 0, HALF_PI);
}

void keyPressed() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      Tiles[i][j] = (Tiles[i][j] + 1) % 2;
    }
  }
}

void mouseClicked() {
  int j = floor(cols * mouseX / width);
  int i = floor(rows * mouseY / height);
  Tiles[i][j] = (Tiles[i][j] + 1) % 2;
}
