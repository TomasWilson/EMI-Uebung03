
float G = 2f; // gravitational pull 

final int BALL_RADIUS = 50;

final float ENERGY_LOSS = 0.95; // how much kinetic energy (velocity) is maintained when bouncing

float ball_x = 500, ball_y = 100;

float v = 0f;

color[] colors = {#fcdb03, #73fc03, #1432db, #cc1237, #e3a814, #16d916};
int color_pos = 0;

void updateBall(){
  
  v += G;
  ball_y += v;
  
  if (ball_y + BALL_RADIUS >= 1000) 
  {
    ball_y = 1000 - BALL_RADIUS;
    v *= -ENERGY_LOSS; // change direction and take some energy away
    
    if(abs(v) < 1) { // if the velocity is too small, stop updating the values
      v = 0;
      G = 0;
    } else { // change color otherwise
      color_pos = (color_pos+1) % colors.length;
    }
    
  }
  
  println(v);
}

void setup(){
  size(1000, 1000);
}

void draw(){
  background(255); // bg color white
  fill(colors[color_pos]); // ball color black
  updateBall();
  ellipse(ball_x, ball_y, BALL_RADIUS, BALL_RADIUS);
}
