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
  
  //draw amp / panning layout
  line(425, 100, 625, 100);
  line(425, 90, 425, 110);
  line(625, 90, 625, 110);
  
  fill(255, 0, 0);
  ellipse( map(pan, -1, 1, 425, 625) , 100, 15, 15);
  
  fill(0, 102, 153);
  
  String t = mode_amp ? "Amplitude" : "Panning";
  textSize(25);
  text(t, 470, 60);
  
  String l = mode_amp ? "0" : "L";
  text(l, 420, 140);
  String r = mode_amp ? "1" : "R";
  text(r, 620, 140);
}
