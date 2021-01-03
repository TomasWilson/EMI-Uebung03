
float G = 2f; // gravitational pull 

final int BALL_RADIUS = 50;

final float ENERGY_PRESERVATION = 0.95; // how much kinetic energy (velocity) is maintained when bouncing

float ball_x = 500, ball_y = 100; // ball starting position

float v = 0f; // velocity

color[] colors = {#fcdb03, #73fc03, #1432db, #cc1237, #e3a814, #16d916}; // colors of the ball
int color_pos = 0; // describes the current color

void updateBall(){
  
  v += G;
  ball_y += v;
  
  // bounce detection
  if (ball_y + BALL_RADIUS/2 >= 1000) 
  {
    ball_y = 1000 - BALL_RADIUS/2; // reset ball to floor to avoid weird problems with the polling to appear
    v *= -ENERGY_PRESERVATION; // change direction and take some energy away
    
    if(abs(v) < 1.5) { // if the velocity is very small, stop updating the values. Otherwise the ball will change collor rapidly, which looks very silly
      v = 0;
      G = 0;
    } else { // change color
      color_pos = (color_pos+1) % colors.length;
    }
    
  }
}

void setup(){
  size(1000, 1000);
}

void draw(){
  background(255); // bg color white
  updateBall();
  fill(colors[color_pos]); // set ball drwaing color
  ellipse(ball_x, ball_y, BALL_RADIUS, BALL_RADIUS); // draw ball
}
