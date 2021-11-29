class Ball{
  PVector location;  // position
  PVector velocity;  //motion
  float w = 20;      //width
  float h = 20;       //height

  Ball(){
    location = new PVector(200,300);
    velocity = new PVector(2,4);
  }
  
  void move(){
    //Example 1.2. Nature of Code by Daniel Shiffman
    //ball moves and bounce from the borders
    location.add(velocity);
      //bounce left and right
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
      //bounce above
     if (location.y < 0) {
      velocity.y = velocity.y * -1;
    }
      //bounce down, game lost
    if (location.y  > height ) {
     Lost lose = new Lost();
     lose.setup();
     lose.draw();
    }   
  }
  
  void drawBall(){
    //display the ball with location and size
    //Änderung
    fill(255, 100, 200);
    ellipse(location.x, location.y, w, h);
  }
  
  

}
