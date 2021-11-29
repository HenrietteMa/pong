class Brick {
  PVector location;  //position
  float w = 60;      //width
  float h = 20;       //height

  //constructor
  Brick(float tempX, float tempY) {
    location = new PVector(tempX, tempY);
   ;
  }

  boolean checkBrick(Ball b) {
    //Check if the ball and brick touch each other
    //change ball velocity direction
    //return true, if they touch, else return false
    if (b.location.x + b.h > location.x &&
        b.location.x + b.h < location.x + w &&
        b.location.y - b.h < location.y + h &&
        b.location.y + b.h > location.y) {
      b.velocity.y = b.velocity.y * -1;
      return true;
    }
    return false;
  }

  void draw() {
    //display the bricks 
   fill(255, 192, 203);
    rect(location.x, location.y, w, h);
  }
  
}
