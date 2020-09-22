PongPaddle p1 = new PongPaddle();
PongPaddle p2 = new PongPaddle();
Ponggame g = new Ponggame();
Pongball b = new Pongball();
void setup()
{
  size(1000,500);
}
void draw()
{
  background(0);
  p1.paddle(1);
  p2.paddle(2);
  g.board();
  b.ball();
}

class PongPaddle
{
  void paddle(int player)    //create paddle
  {
    if( player == 1 )
    {
      rect(0,mouseY,25,150);
    }
    else if( player == 2 )
    {
      rect(974,mouseY,25,150);
    }
  }
  
  void bouce_ball()  //create bouce event when ball hit
  {
  }
  
  void paddle_move() //paddle movement
  {
  }
  
}

class Pongball
{
  float x;
  float y;
  float speed;
  
  void ball() //create ball
  {
    ellipse(width/2,height/2,50,50);
  }
  
  void move() //ball movement
  {
  }
  
}

class Ponggame
{
  
  int player1 = 0; //score player 1
  int player2 = 0; //score player 2
  
  void board() //create board=> score point & center rectangular
  {
    rect((width/2)-10,0,20,1000);
    textSize(40);
    text(player1,width/4,50);
    text(player2,(width*3)/4,50);
  }
  
  void serve() //serve ball to left or right
  {
  }
  
  void update() //update score point
  {
  }
  
}
