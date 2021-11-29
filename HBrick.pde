class HBrick extends Brick {
  
  //constructor
  HBrick(int i,int j){
    super(i,j); 
  }
  
  void draw(){ 
   // display the special brick
    fill(55, 0, 100);
    rect(super.location.x, super.location.y, super.w, super.h);
    }
  
};
