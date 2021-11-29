//by Henriette Mattke, March 2021
//Assignment 1 | Programming Dynamic Environments by Tim Laue 

ArrayList<Brick> bricks;  //list to store all bricks
ArrayList<Firework> fireworks; // list to store alle fireworks objects
Ball b;         // global variable ball
Paddle p;        // global variable paddle
int off1 = 25; //space between rows of the bricks
int off2 = 70; //space between columns of the bricks

boolean sHit;                  //hit count for change paddlesize
int score = 0;                 //score counter
int timeControl = millis();    //time for display controlinformation

//------------------set up the window und empty list-----------------
void setup() {
  //size of programm
  size (700,750);
  score= 0;
  bricks = new ArrayList<Brick>();        //create new Arraylist
  fireworks = new ArrayList<Firework>();   //create new ArrayList
    
  //set the bricks ans special bricks with offspace
    for (int i=0; i<width-60; i++){
      for (int j=50; j<height/4; j++){
        //Änderung du kannst die Zahl ändern, wenn du 50% SBricke machen willst von random(0,5) zu random(0,2) 
        int random = int(random(0,5));
        if(random==0)
          bricks.add(new SBrick(i,j));
        else if(random==1)
          bricks.add(new HBrick(i,j));
        else
          bricks.add(new Brick(i,j));
        j+=off1;
      }
      i+=off2;
  }
  
  b = new Ball();
  p = new Paddle();
}

void explosion() {
  //a new firework object is created, initialized at ball location
  //and added to the list of all fireworks
  Firework firework = new Firework(b.location.x, b.location.y, 10);
  fireworks.add(firework);
}

//------------------------processing draw cycle-----------------------
void draw(){
  //grey background
  background (55);
  
  //display score
  textSize(20);
  fill(255);
  text ("score: " + score, width-100, 30);
  
  //display game control once the game opened
  if(millis() < timeControl + 5000){ 
  textSize(30);
  fill(255);
  textAlign(CENTER);
  text ("control with <- and ->" , width/2, width/2);
  }
    
    
  //call functions from classes Ball and Paddle
  b.drawBall();
  b.move();

  p.draw();
  p.move();
  p.checkPaddle(b);
  
  //iterate over al firework objects
  for(Firework f : fireworks) {
    f.update();
    f.drawFirework();
  }
  // Remove all "old" firework objects (those that do not burn anymore)
  for(int i=fireworks.size()-1; i>= 0; i--) {
    if(fireworks.get(i).isOver()) {
      fireworks.remove(i);
    }
  }
  
  //draw all bricks and remove them if they have been hit by the ball
  //explosion for firework is called and score is added, 
  for(int i=bricks.size()-1; i>=0; i--) {
   bricks.get(i).draw();
   if(bricks.get(i).checkBrick(b)) {  // Assuming it returns true, in case of a collision
     if(bricks.get(i) instanceof SBrick){
       sHit = true;
        score += 5;
     }
     if (bricks.get(i) instanceof HBrick){
       score += 20;
       sHit=false;
     } 
     bricks.remove(i);
     explosion();       
     score +=10;
   }
   }
   
   
  // change the size of paddle when special bricks are hitted
  if (sHit == true){
    p.w =200;
  } else if (sHit == false){
    p.w = 120;
  }
     
   
  
   //display the won screen when the brick list is empty
   if (bricks.isEmpty()){
    Won won = new Won();
     won.setup();
     won.draw();
   }
  
}
  //keyboard control that moves the paddle
  void keyPressed(){
    if (keyCode==LEFT) p.moveLeft();            // moves the paddle left by pressing arrow key Left
    else if (keyCode==RIGHT) p.moveRight();    // moves the paddle right by pressing arrow key Right
    else if (keyCode==ENTER) setup();          // restart the game by pressing Enter

}



 
 
