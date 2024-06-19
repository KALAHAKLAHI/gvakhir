int paraAX1 = 100;
int paraAY1 = 200;
int paraAWidth1 = 50;
int paraAHeight1 = 300;
int paraASlant1 = 70; // Kemiringan jajar genjang

int paraAX2 = 250;
int paraAY2 = 200;
int paraAWidth2 = 50;
int paraAHeight2 = 300;
int paraASlant2 = -70; // Kemiringan jajar genjang

int trapAX2 = 150;
int trapAY2 = 370;
int trapAWidth2 = 100;
int trapAHeight2 = 50;
int trapASlant2 = 30; // Kemiringan trapesium

// Huruf R
int rectRX1 = 350;
int rectRY1 = 200;
int rectRWidth1 = 50;
int rectRHeight1 = 300;

int rectRX2 = 400;
int rectRY2 = 200;
int rectRWidth2 = 50;
int rectRHeight2 = 45;

int rectRX3 = 400;
int rectRY3 = 325;
int rectRWidth3 = 50;
int rectRHeight3 = 45;

int circRX1 = 450;
int circRY1 = 285;
int circRRad1 = 85;

int circRX2 = 445;
int circRY2 = 285;
int circRRad2 = 40;

int paraRX2 = 470;
int paraRY2 = 365;
int paraRWidth2 = 60;
int paraRHeight2 = 130;
int paraRSlant2 = -75; // Kemiringan jajar genjang

// Huruf H
int rectHX1 = 600;
int rectHY1 = 200;
int rectHWidth1 = 50;
int rectHHeight1 = 300;

int rectHX2 = 650;
int rectHY2 = 320;
int rectHWidth2 = 100;
int rectHHeight2 = 50;

int rectHX3 = 750;
int rectHY3 = 200;
int rectHWidth3 = 50;
int rectHHeight3 = 300;

// Huruf P
int rectPX1 = 870;
int rectPY1 = 200;
int rectPWidth1 = 50;
int rectPHeight1 = 300;

int rectPX2 = 920;
int rectPY2 = 200;
int rectPWidth2 = 50;
int rectPHeight2 = 45;

int rectPX3 = 920;
int rectPY3 = 325;
int rectPWidth3 = 50;
int rectPHeight3 = 45;

int circPX1 = 970;
int circPY1 = 285;
int circPRad1 = 85;

int circPX2 = 965;
int circPY2 = 285;
int circPRad2 = 40;

float moveSpeed = 5;
float scaleFactor = 1.0;
float angle = 0;
boolean mirrorX = false;
boolean mirrorY = false;

void setup() {
  size(1230, 700);
}

void draw() {
  background(220);
  noStroke();
  
  pushMatrix();
  
  // Translate ke tengah layar
  translate(width / 2, height / 2);
  
  // Mirroring jika diperlukan
  if (mirrorX) {
    scale(-1, 1);
  }
  if (mirrorY) {
    scale(1, -1);
  }
  
  // Scaling dan Rotasi
  scale(scaleFactor);
  rotate(angle);
  
  // Kembali ke posisi awal
  translate(-width / 2, -height / 2);
  
  // Menggambar huruf A
  fill(255, 0, 0); // Warna merah
  drawParallelogram(paraAX1, paraAY1, paraAWidth1, paraAHeight1, paraASlant1);
  drawParallelogram(paraAX2, paraAY2, paraAWidth2, paraAHeight2, paraASlant2);
  drawTrapezoid(trapAX2, trapAY2, trapAWidth2, trapAHeight2, trapASlant2);
  
  // Menggambar huruf R
  fill(0, 0, 255); // Warna biru
  drawRectangle(rectRX1, rectRY1, rectRWidth1, rectRHeight1);
  drawRectangle(rectRX2, rectRY2, rectRWidth2, rectRHeight2);
  drawRectangle(rectRX3, rectRY3, rectRWidth3, rectRHeight3);
  
  drawHalfCircle(circRX1, circRY1, circRRad1);
  fill(220);
  drawHalfCircle(circRX2, circRY2, circRRad2);
  
  fill(0, 0, 255); // Warna biru
  drawParallelogram(paraRX2, paraRY2, paraRWidth2, paraRHeight2, paraRSlant2);
  
  // Menggambar huruf H
  fill(0, 255, 0); // Warna hijau
  drawRectangle(rectHX1, rectHY1, rectHWidth1, rectHHeight1);
  drawRectangle(rectHX2, rectHY2, rectHWidth2, rectHHeight2);
  drawRectangle(rectHX3, rectHY3, rectHWidth3, rectHHeight3);
  
  // Menggambar huruf P
  fill(128, 0, 128); // Warna ungu
  drawRectangle(rectPX1, rectPY1, rectPWidth1, rectPHeight1);
  drawRectangle(rectPX2, rectPY2, rectPWidth2, rectPHeight2);
  drawRectangle(rectPX3, rectPY3, rectPWidth3, rectPHeight3);
  
  drawHalfCircle(circPX1, circPY1, circPRad1);
  fill(220);
  drawHalfCircle(circPX2, circPY2, circPRad2);
  
  popMatrix();
}

// Fungsi untuk menggambar persegi panjang
void drawRectangle(int x, int y, int width, int height) {
  rect(x, y, width, height);
}

// Fungsi untuk menggambar setengah lingkaran
void drawHalfCircle(float x, float y, float radius) {
  float startAngle = PI + HALF_PI;
  float endAngle = TWO_PI + HALF_PI;
  arc(x, y, radius * 2, radius * 2, startAngle, endAngle);
}

// Fungsi untuk menggambar jajar genjang
void drawParallelogram(int x, int y, int width, int height, int slant) {
  beginShape();
  vertex(x + slant, y); // Top left
  vertex(x + width + slant, y); // Top right
  vertex(x + width, y + height); // Bottom right
  vertex(x, y + height); // Bottom left
  endShape(CLOSE);
}

// Fungsi untuk menggambar trapesium
void drawTrapezoid(int x, int y, int width, int height, int slant) {
  beginShape();
  vertex(x + slant, y); // Top left
  vertex(x + width - slant, y); // Top right
  vertex(x + width, y + height); // Bottom right
  vertex(x, y + height); // Bottom left
  endShape(CLOSE);
}

// Fungsi untuk menangani input dari keyboard
void keyPressed() {
  // Translasi
  if (key == 'w' || key == 'W') {
    // Gerak ke atas
    paraAY1 -= moveSpeed; paraAY2 -= moveSpeed; trapAY2 -= moveSpeed;
    rectRY1 -= moveSpeed; rectRY2 -= moveSpeed; rectRY3 -= moveSpeed; circRY1 -= moveSpeed; circRY2 -= moveSpeed; paraRY2 -= moveSpeed;
    rectHY1 -= moveSpeed; rectHY2 -= moveSpeed; rectHY3 -= moveSpeed;
    rectPY1 -= moveSpeed; rectPY2 -= moveSpeed; rectPY3 -= moveSpeed; circPY1 -= moveSpeed; circPY2 -= moveSpeed;
  } else if (key == 's' || key == 'S') {
    // Gerak ke bawah
    paraAY1 += moveSpeed; paraAY2 += moveSpeed; trapAY2 += moveSpeed;
    rectRY1 += moveSpeed; rectRY2 += moveSpeed; rectRY3 += moveSpeed; circRY1 += moveSpeed; circRY2 += moveSpeed; paraRY2 += moveSpeed;
    rectHY1 += moveSpeed; rectHY2 += moveSpeed; rectHY3 += moveSpeed;
    rectPY1 += moveSpeed; rectPY2 += moveSpeed; rectPY3 += moveSpeed; circPY1 += moveSpeed; circPY2 += moveSpeed;
  } else if (key == 'a' || key == 'A') {
    // Gerak ke kiri
    paraAX1 -= moveSpeed; paraAX2 -= moveSpeed; trapAX2 -= moveSpeed;
    rectRX1 -= moveSpeed; rectRX2 -= moveSpeed; rectRX3 -= moveSpeed; circRX1 -= moveSpeed; circRX2 -= moveSpeed; paraRX2 -= moveSpeed;
    rectHX1 -= moveSpeed; rectHX2 -= moveSpeed; rectHX3 -= moveSpeed;
    rectPX1 -= moveSpeed; rectPX2 -= moveSpeed; rectPX3 -= moveSpeed; circPX1 -= moveSpeed; circPX2 -= moveSpeed;
  } else if (key == 'd' || key == 'D') {
    // Gerak ke kanan
    paraAX1 += moveSpeed; paraAX2 += moveSpeed; trapAX2 += moveSpeed;
    rectRX1 += moveSpeed; rectRX2 += moveSpeed; rectRX3 += moveSpeed; circRX1 += moveSpeed; circRX2 += moveSpeed; paraRX2 += moveSpeed;
    rectHX1 += moveSpeed; rectHX2 += moveSpeed; rectHX3 += moveSpeed;
    rectPX1 += moveSpeed; rectPX2 += moveSpeed; rectPX3 += moveSpeed; circPX1 += moveSpeed; circPX2 += moveSpeed;
  }
  
  // Skala/Zoom
  if (key == '+') {
    scaleFactor += 0.05;
  }
  if (key == '-') {
    scaleFactor -= 0.05;
    if (scaleFactor < 0.05) {
      scaleFactor = 0.05;
    }
  }
  
  // Rotasi
  if (keyCode == RIGHT) {
    angle += 0.01;
  }  
  if (keyCode == LEFT) {
    angle -= 0.01;
  }
  
  // Mirroring
  if (key == 'x' || key == 'X') {
    mirrorX = !mirrorX; // Toggle horizontal mirroring
  }
  if (key == 'y' || key == 'Y') {
    mirrorY = !mirrorY; // Toggle vertical mirroring
  }
}
