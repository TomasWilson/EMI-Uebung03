import processing.sound.*;


SinOsc sine;

void setup(){
  size(700, 400);
  background(255);
  sine = new SinOsc(this);
  sine.play();

}

float pitch = 600f; // pitch (frequency) [200, 1000]
float amp = 0.5f; // amplitude [0, 1]
float pan = 0f; // panning [-1, 1]
boolean mode_amp = true; // true if mouseX controls the amplitude, false if mouseX controlls panning
boolean playing = true; // true if the sound is currently playing, false otherwise

void keyPressed(){
  if (key == ' ') {
    if(playing) {
      sine.stop();
    }
    else {
      sine.play();
    }
    playing = !playing;
  }
}

void mousePressed(){
    mode_amp = !mode_amp;
}

void draw()
{
  //100, 250
  background(255);
  
  // update pitch
  pitch = map(mouseY, 0, 400, 1000, 200);
  
  // update amp or pen variables depending on "mode"
  if (mode_amp) {
    amp = map(mouseX, 0, 700, 0, 1);
  } else {
    pan = map(mouseX, 0, 700, -1, 1);
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
  // please note that the depiction of the sine wave does not have anything to do with the frequency.
  // (drawing an (up to) 1000Hz sine wave doesnt really work on the expected window size - for obvious reasons)
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
