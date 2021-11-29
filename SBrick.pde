class SBrick extends Brick {
  
  //constructor 
  SBrick(int i,int j){
    super(i,j); 
  }
  
  void draw(){ 
    //display the special brick
   fill(55, 0, 51);
    rect(super.location.x, super.location.y, super.w, super.h);
    } 
};
