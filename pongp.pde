Ponggame g = new Ponggame();
Ball ball; 
Paddle paddleL;
Paddle paddleR;

void setup()
{
  size(1000,500);
  paddleL = new Paddle(15, height/2, 30,200);
  paddleR = new Paddle(width-15, height/2, 30,200);
  ball = new Ball(width/2, height/2, 50);
}

void draw()
{
  background(0);
  g.board();
  ball.display(); 
  ball.move();
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

class Ball 
{
  float x;
  float y;
  float speedX = 3 ;
  float speedY = 3 ;
  float size;
  int i = 0;
  
  Ball(float posX, float posY, float ballsize) 
  {
    x = posX;
    y = posY;
    size = ballsize;
  }
  void move() 
  {
    y = y + speedY;
    x = x + speedX;
    

    if (y + size/2 > height) 
    {
      ball.speedY = -ball.speedY;
    }

    if (y - size/2 < 0)
    {
      ball.speedY = -ball.speedY;
    }
    
    if(i < 9)
    {
     if ( ball.left() < paddleL.right() && ball.y >= paddleL.top() && ball.y <= paddleL.bottom())
     {
      ball.speedX = -ball.speedX*(1.2);
      i+=1;
     }
     if ( ball.right() > paddleR.left() && ball.y >= paddleR.top() && ball.y <= paddleR.bottom()) 
     {
      ball.speedX = -ball.speedX*(1.2);
      i+=1;
     }
    }
    else
    {
     if ( ball.left() < paddleL.right() && ball.y >= paddleL.top() && ball.y <= paddleL.bottom())
     {
      ball.speedX = -ball.speedX;
     }
     if ( ball.right() > paddleR.left() && ball.y >= paddleR.top() && ball.y <= paddleR.bottom()) 
     {
      ball.speedX = -ball.speedX;
     }      
    }
  }
  
  void display() 
  {
    ellipse(x,y,size,size); 
  }

  float left()
  {
    return x - size/2;
  }
  float right()
  {
    return x + size/2;
  }
  float top()
  {
    return y - size/2;
  }
  float bottom()
  {
    return y + size/2;
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
