int MARGIN = 20;
Clock myClock = new Clock();

void setup() {
  size(300, 300);
  stroke(255);
  smooth();
  frameRate(30);
}

void draw() {
  background(0);
  myClock.getTime();
  myClock.draw();
}

class Clock {
  float s, m, h;
  Clock() {
  }

  void getTime() {
    s = second();
    m = minute() + (s/60.0);
    h = hour()%12 + (m/60.0);
  }

  void draw() {
    translate(width/2, height/2);
    rotate(radians(180));
    pushMatrix();
    fill(128);
    noStroke();
    for (int i=0; i<60; i++) {
      rotate(radians(6));
      ellipse(width/2-MARGIN, 0, 3, 3);
    }
    for (int i=0; i<12; i++) {
      rotate(radians(30));
      ellipse(width/2-MARGIN, 0, 10, 10);
    }
    popMatrix();
    noFill();
    stroke(255);
    pushMatrix();
    rotate(radians(s*(360/60)));
    strokeWeight(1);
    line(0, 0, 0, width/2-MARGIN);
    popMatrix();
    pushMatrix();
    rotate(radians(m*(360/60)));
    strokeWeight(2);
    line(0, 0, 0, width/2-MARGIN);
    popMatrix();
    pushMatrix();
    rotate(radians(h*(360/12)));
    strokeWeight(4);
    line(0, 0, 0, width/3-MARGIN);
    popMatrix();
  }
}
