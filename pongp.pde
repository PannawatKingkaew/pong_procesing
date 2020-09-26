Ponggame g = new Ponggame();
Pongball b = new Pongball();
Paddle paddleL;
Paddle paddleR;

void setup()
{
  size(1000,500);
  paddleL = new Paddle(15, height/2, 30,200);
  paddleR = new Paddle(width-15, height/2, 30,200);
}

void draw()
{
  background(0);
  g.board();
  b.ball();
  b.move();
  paddleL.move();
  paddleL.display();
  paddleR.move();
  paddleR.display();
}

void mouseDragged()
{
  if(mouseX <= width/2)
  {
    paddleL.y = mouseY;
  }
  else if(mouseX >= width/2)
  {
    paddleR.y = mouseY;
  }
}

class Paddle
{

  float x;
  float y;
  float w;
  float h;
  
  Paddle(float posX, float posY, float Width, float Height)
  {
    x = posX;
    y = posY;
    w = Width;
    h = Height;
  }

  void move()
  { 
    if (paddleL.bottom() > height) 
    {
      paddleL.y = height - paddleL.h/2;
    }
    if (paddleL.top() < 0) 
    {
      paddleL.y = paddleL.h/2;
    }
    if (paddleR.bottom() > height) 
    {
      paddleR.y = height - paddleR.h/2;
    }
    if (paddleR.top() < 0) 
    {
      paddleR.y = paddleR.h/2;
    }
   }
  
  void display()
  {
    rect(x-w/2,y-h/2,w,h);
  } 
  
  float left()
  {
    return x-w/2;
  }
  float right()
  {
    return x+w/2;
  }
  float top()
  {
    return y-h/2;
  }
  float bottom()
  {
    return y+h/2;
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
