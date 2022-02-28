import processing.sound.*;
int angle = 0;

Amplitude amp;

FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float [bands];

void setup() {
  size(800, 800);
  background(255);
    
  // Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}      

void draw() {
  // Draw only when mouse is pressed
  if (mousePressed == true) {
    angle += 1;
    float val = cos(radians(angle)) * 50.0;
    for (int a = 0; a < 360; a += 50) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
    fill(color(100,200,200));
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
    fill(255);
    ellipse(mouseX, mouseY, 2, 2);
  }
  
  
  noStroke();
  fill(color(255,255,255,10));
  rect(0,0,width,height);
  fill(color(250,0,100,10));
  circle(width/2,height/2,amp.analyze()*10000.0);
 
  
}
