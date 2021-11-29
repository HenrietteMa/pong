class Lost{
  void setup(){
    //change the background black
    background(0);
  }
  void draw(){
    
    //stops the ball
    b.velocity.x = 0;
    b.velocity.y = 0;
    
    //losing and restart text 
    textAlign(CENTER, CENTER);
    textSize(50);
    text("GAME OVER",width/2, height/2);
    textSize(30);
    text("your score: " + score, width/2, height/2+50);
    textSize(20);

    text ("press ENTER to restart", width/2,height/2+120);
    text ("press ESC to close", width/2,height/2+150);

  }
}
