PShape aShape, rShape, hShape, pShape, arhpShape;
float pitch = 0;
float yaw = 0;
float roll = 0;
boolean wPressed, sPressed, aPressed, dPressed, leftPressed, rightPressed;

void setup() {
  size(1200, 1000, P3D);
  
  // Huruf A
  aShape = createShape(GROUP);
  PShape aLeft = createBox(100, 500, 100);
  PShape aRight = createBox(100, 500, 100);
  PShape aMiddle = createBox(200, 100, 100);
  PShape aMiddleHorizontal = createBox(200, 100, 100);
  aLeft.translate(-150, 0, 0);
  aRight.translate(150, 0, 0);
  aMiddle.translate(0, -200, 0);
  aMiddleHorizontal.translate(0, 0, 0);
  aShape.addChild(aLeft);
  aShape.addChild(aRight);
  aShape.addChild(aMiddle);
  aShape.addChild(aMiddleHorizontal);

  // Huruf R
  rShape = createShape(GROUP);
  PShape rVertical = createBox(100, 500, 100);
  PShape rTop = createBox(100, 100, 100);
  PShape rRight = createBox(100, 300, 100);
  PShape rMiddle = createBox(100, 100, 100);
  PShape rDiagonal = createBox(245, 100, 100);
  rVertical.translate(-50, 0, 0);
  rTop.translate(50, -200, 0);
  rRight.translate(150, -100, 0);
  rMiddle.translate(50, 0, 0);
  rDiagonal.translate(120, 70, 0);
  rDiagonal.rotateZ(radians(45));
  rShape.addChild(rVertical);
  rShape.addChild(rTop);
  rShape.addChild(rRight);
  rShape.addChild(rMiddle);
  rShape.addChild(rDiagonal);

  // Huruf H
  hShape = createShape(GROUP);
  PShape hLeft = createBox(100, 500, 100);
  PShape hRight = createBox(100, 500, 100);
  PShape hMiddle = createBox(200, 100, 100);
  hLeft.translate(-150, 0, 0);
  hRight.translate(150, 0, 0);
  hMiddle.translate(0, 0, 0);
  hShape.addChild(hLeft);
  hShape.addChild(hRight);
  hShape.addChild(hMiddle);

  // Huruf P
  pShape = createShape(GROUP);
  PShape pVertical = createBox(100, 500, 100);
  PShape pTop = createBox(200, 100, 100);
  PShape pRight = createBox(100, 200, 100);
  PShape pMiddle = createBox(200, 100, 100);
  pVertical.translate(-100, 0, 0);
  pTop.translate(0, -200, 0);
  pRight.translate(50, -100, 0);
  pMiddle.translate(0, 0, 0);
  pShape.addChild(pVertical);
  pShape.addChild(pTop);
  pShape.addChild(pRight);
  pShape.addChild(pMiddle);

  // Group all letters into one shape
  arhpShape = createShape(GROUP);
  arhpShape.addChild(aShape);
  arhpShape.addChild(rShape);
  arhpShape.addChild(hShape);
  arhpShape.addChild(pShape);

  // Translate each letter to appropriate positions
  aShape.translate(-675, 0, 0); // -1.5 * spacing
  rShape.translate(-225, 0, 0); // -0.5 * spacing
  hShape.translate(225, 0, 0);  // 0.5 * spacing
  pShape.translate(675, 0, 0);  // 1.5 * spacing
}

void draw() {
  background(255);
  lights(); // Enable lighting

  translate(width / 2, height / 2, 0); // Center the group shape

  if (wPressed) {
    pitch -= radians(1);
  }
  if (sPressed) {
    pitch += radians(1);
  }
  if (aPressed) {
    yaw -= radians(1);
  }
  if (dPressed) {
    yaw += radians(1);
  }
  if (leftPressed) {
    roll -= radians(1);
  }
  if (rightPressed) {
    roll += radians(1);
  }

  pitch = pitch % TWO_PI;
  yaw = yaw % TWO_PI;
  roll = roll % TWO_PI;

  rotateX(pitch);
  rotateY(yaw);
  rotateZ(roll);

  shape(arhpShape);
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    wPressed = true;
  }
  if (key == 's' || key == 'S') {
    sPressed = true;
  }
  if (key == 'a' || key == 'A') {
    aPressed = true;
  }
  if (key == 'd' || key == 'D') {
    dPressed = true;
  }
  if (keyCode == LEFT) {
    leftPressed = true;
  }
  if (keyCode == RIGHT) {
    rightPressed = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    wPressed = false;
  }
  if (key == 's' || key == 'S') {
    sPressed = false;
  }
  if (key == 'a' || key == 'A') {
    aPressed = false;
  }
  if (key == 'd' || key == 'D') {
    dPressed = false;
  }
  if (keyCode == LEFT) {
    leftPressed = false;
  }
  if (keyCode == RIGHT) {
    rightPressed = false;
  }
}

PShape createBox(float w, float h, float d) {
  PShape box = createShape(BOX, w, h, d);
  box.setFill(color(255, 0, 0));
  return box;
}
