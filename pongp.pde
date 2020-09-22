Ponggame g = new Ponggame();
Pongball b = new Pongball();
PongPaddle[] p = new PongPaddle[3];
void setup()
{
  size(1000,500);
  for(int i = 1 ; i < 3; i++)
  {
   p[i] = new PongPaddle(); 
  }
}
void draw()
{
  background(0);
  for(int i = 1 ; i < 3; i++)
  {
   p[i].paddle(i);
   p[i].paddle_move();
  }
  g.board();
  b.ball();
  b.move();
}

class PongPaddle
{
  float y = 0;

  void paddle(int player)    //create paddle
  {
    if( player == 1 )
    {
      rect(0,y,25,150);
    }
    else if( player == 2 )
    {
      rect(974,y,25,150);
    }
  }
  
  void bouce_ball()  //create bouce event when ball hit
  {
  }
  
  void paddle_move() //paddle movement
  {
    if(mousePressed)
    {
      y = mouseY;
    }
  }
}

class Pongball
{
  int r = 50 ;
  float xb = width/2;
  float yb = height/2;
  float speedX = 2.2;
  float speedY = 2.2;
  int xdirection = 1;  // Left or Right
  int ydirection = 1;  // Top to Bottom
  
  void ball() //create ball
  {
    ellipse(xb,yb,r,r);
  }
  
  void move() //ball movement
  {
    xb = xb + ( speedX * xdirection );
    yb = yb + ( speedY * ydirection );
  
    if (xb > width-25 || xb < r) {
      xdirection *= -1;
    }
    if (yb > height-25 || yb < r) {
      ydirection *= -1;
  }
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
