import processing.sound.*;


SinOsc sine;

void setup(){
  size(700, 400);
  background(255);
  sine = new SinOsc(this);
  sine.play();

}

float pitch = 600f; // pitch (frequency)
float amp = 0.5f; // amplitude
float pan = 0f; // panning scope
boolean mode_amp = true; // true if mouseX controls the amplitude, false if mouseX controlls panning


void keyPressed(){
  if (key == ' ') mode_amp = !mode_amp;
}


void draw()
{
  //100, 250
  background(255);
  
  // update pitch
  pitch = 200 + 800 * ((400-mouseY) / 400.0);
  
  // update amp or pen variables depending on "mode"
  if (mode_amp) {
    amp = mouseX / 700.0;
  }
  else {
    pan = (mouseX / 700.0) * 2 - 1;
  }
  
  // set object properties
  sine.freq(pitch);
  sine.amp(amp);
  sine.pan(pan);
  
  // draw the current pitch as text
  textSize(50);
  fill(0, 102, 153);
  text((int)pitch + " Hz", 95, 310);
  
  
  // draws a visual representation of the amplitude
  // represented as a sine wave but the frequency is unrelated to this
  // ( drawing an (up to) 1000Hz sine wave doesnt work on the expected window size - for obvious reasons)
  line(0, 200, 700, 200);
  for (int x = 0; x < 700; x++){
    float y = (amp * 200 * -sin((x/700.0) * TWO_PI)) + 200;
    point(x, y);
  }
  
  //draw amp layout
  line(425, 80, 625, 80);
  line(425, 70, 425, 90);
  line(625, 70, 625, 90);
  
  fill(255, 0, 0);
  ellipse( map(amp, 0, 1, 425, 625) , 80, 15, 15);
  
  fill(0, 102, 153);
  String t = mode_amp ? "Mode: Amplitude" : "Mode: Panning";
  textSize(25);
  text(t, 430, 40);
  text("0", 420, 120);
  text("1", 620, 120);
  
  
  //draw panning layout
  line(425, 150, 625, 150);
  line(425, 140, 425, 160);
  line(625, 140, 625, 160);
  
  fill(255, 0, 0);
  ellipse( map(pan, -1, 1, 425, 625) , 150, 15, 15);
  fill(0, 102, 153);
  text("L", 420, 190);
  text("R", 620, 190);
  
}
