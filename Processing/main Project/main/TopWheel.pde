class TopWheel {
  int wheelColor = 255;
  int xPos, yPos;
  float cWidth, cHeight;
  Task[] tasks;

  public TopWheel(int xPos, int yPos, int cWidth, int cHeight, Task[] tasks) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.cWidth = cWidth/1.2;
    this.cHeight = cHeight/1.2;
    this.tasks = tasks;
  }


  void generate() {
    drawBase();
    String placeHolder = "System is waiting...";

    int fontSize = 14;
    initText(fontSize, 73, 137, 204);
    text(placeHolder, xPos, yPos);
  }
  void drawBase() {
    noStroke();
    fill(255);
    ellipse(xPos, yPos, cWidth, cWidth);
  }
  void initText(int fSize, int r, int g, int b) {
    textFont(createFont("Georgia", fSize));
    fill(r, g, b);
  }
}

