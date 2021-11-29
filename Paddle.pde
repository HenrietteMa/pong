class Paddle{
  PVector location;   //position
  PVector velocity;   //motion
  float w = 120;      //width
  float h = 25;       //height

  Paddle(){
    location = new PVector(width/2,height-40);
    velocity = new PVector(30,0);
  }
  
  
//Example: single_player_pong_array 
//paddle moves right
  void moveRight(){
    location.add(velocity);
  }
//paddle moves left
  void moveLeft(){
    location.sub(velocity);
  } 
  void move(){
    //stops the paddle at the border
    if (location.x <0){
      location.x = 0;
    }
    else if (location.x>width-w){
      location.x = width-w;
    }
   }
  
  void checkPaddle(Ball b){
    //Check if the ball and paddle touch each other
    //change ball velocity direction
    if ( b.location.y > location.y - b.h/2 &&
         location.x < b.location.x &&
         location.x+w > b.location.x){
      b.velocity.y = b.velocity.y* -1;
    } 

  }
  
  void draw(){
    //display the ball with location and size
    //color
    //Änderung 
     fill(255, 100, 100);
    rect(location.x, location.y, w, h); 
  }
  

        
  
}
