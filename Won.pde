class Won{
  void setup(){
    //change the background pink
    background(255, 179, 255);
  }
  void draw(){
    
    //stops the ball
    b.velocity.x = 0;
    b.velocity.y = 0;
    
    //losing and restart text 
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(50);
    text("YOU WON",width/2, height/2);
    textSize(30);
    text("your score: " + score, width/2, height/2+50);
    textSize(20);
    text ("press ENTER to restart", width/2,height/2+120);
    text ("press ESC to close", width/2,height/2+150);


  }
}
