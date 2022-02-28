int window_width=600;
int window_height=480;
int score = 0;

Target aTarget=null;

ArrayList<Explosion> explosions = new ArrayList<Explosion>();

void setup()
{
  size(600,480);
  
}

void input()
{
  if (mousePressed == true)
  {
    float d = dist(mouseX, mouseY, aTarget.x_position, aTarget.y_position);
    if (d<aTarget.size)
    {
       // Target hit
       explosions.add(new Explosion(aTarget.x_position, aTarget.y_position));
       aTarget = null; // deletes target that has been hit
       score++;
    }
  }
}


void update()
{
  if (aTarget==null)
  {
    aTarget = new Target();
  }
  if (!aTarget.update()) // update reveals target has gone off screen and should be deleted
  {
    aTarget = null; // deletes off screen target
  }
  for (int i = 0; i < explosions.size(); i++)  // update each explosion
  {
    Explosion exp = explosions.get(i);
    if(!exp.update())
    {
      explosions.remove(i);
    }
  }
}

void render()
{
  background(119,148,108); // set background colour (red, green, blue) each in 0-255 range
  
  fill(255,255,255); // Set the colour to white for the score text
  textSize(32);
  String scoreText = "Score : " + score;
  text(scoreText, 20,40); // show the score at the top left of the screen

  fill(255,0,0);  // set colour to red for the target
  if (!(aTarget==null)) // checks to see the target exists
  {
    aTarget.render(); // draw the target
  }
  for (int i = 0; i < explosions.size(); i++) // draws each explosion in turn
  {
    Explosion exp = explosions.get(i);
    exp.render();
  }
}

void draw()
{
  input();
  update();
  render();
}

class Target {
  float x_position;
  float y_position;
  float x_velocity;
  float y_velocity;
  int size;
  
  Target()
  {
    size = 50;
    int randomNumber = int(random(4));
    if (randomNumber == 0) // Start on Left Hand Side
    {
      x_position = -size;  // Starts off screen
      y_position = random(400) + 40;
      x_velocity = random(10);
      y_velocity = random(20)-10;
    }
    else if (randomNumber == 1) // Start on Right Hand Side
    {
      x_position = 600 + size; // Starts off screen
      y_position = random(400) + 40;
      x_velocity = -random(10);
      y_velocity = random(20)-10;
    }
    else if (randomNumber == 2) // Start at top of screen
    {
      x_position = random(520)+40; 
      y_position = -size; // Starts off screen
      x_velocity = random(20)-10;
      y_velocity = random(10);
    }
    else  // Start at bottom of screen
    {
      x_position = random(520)+40; 
      y_position = 480 + size; // Starts off screen
      x_velocity = random(20)-10;
      y_velocity = -random(10);
    }
  }
  
  boolean update()
  {
     x_position += x_velocity;  // change the target's position by adding its velocity to its current position
     y_position += y_velocity;
     
     // check to see if the target has gone off screen
     if (x_position<-size||x_position>600+size||y_position<-size||y_position>480+size)
     {
       return false;
     }
     else
     {
       return true;
     }     
  }
  
  void render()
  {
    // draws the target
    ellipse(x_position,y_position,size,size);
  }
}

class Explosion
{
  float x_position; 
  float y_position;
  ExplosionPart[] bits;
  int timer;
 
  Explosion(float x, float y)
  {
    // creates a new explosion at the specified location
    x_position = x;
    y_position = y;
    timer=20;
    
    // Create 20 "explosion parts"
    bits = new ExplosionPart[20];
    for (int i=0; i<20; i++)
    {
      bits[i]= new ExplosionPart(x_position, y_position);
    }
  }
  
  boolean update()
  {
    // timer is the lifespan of the explosion
    // It starts at 20 and counts down by one each time the explosion is updated
    // at timer = 0 the explosion ends
    timer--;
    if (timer>0)
    {
      // if the explosion is still going on then update each of the explosion parts
      for (int i=0; i<20; i++)
      {
        bits[i].update();        
      }      
      return true;
    }
    else
    {
       for (int i=0; i<20; i++)
       {
         bits[i] = null;
       }
       return false;
    }
  }
  
  void render()
  {
    // To draw the explosion we draw each of the explosion parts in turn
    for (int i=0; i<20; i++)
     {
       if (bits[i] != null)
       {
           bits[i].render();
       }
     }
  }
  
}

class ExplosionPart
{
  float x_position;
  float y_position;
  float x_velocity;
  float y_velocity;
  int red_colour;
  int green_colour;
  int blue_colour;
  int part_size;
  
  ExplosionPart(float x, float y)
  {
    // Set up an explosion part at the target location
    x_position = x;
    y_position = y;
    // give it a random velocity so each part goes in a different direction
    x_velocity = random(20)-10;
    y_velocity = random(20)-10;
    // give the part a random shade of red as a starting colour
    // each update the part will get slightly darker
    red_colour = int(random(200))+50;
    green_colour = 0;
    blue_colour = 0;
    // give the part a random size
    // each update the part will get slightly smaller
    part_size=15 +int(random(10));
  }
  
  void update()
  {
    // make the part's colour a little darker
    red_colour = red_colour - int(random(20));
    if (red_colour<0)
    {
      red_colour = 0;
    }
    
    green_colour = green_colour - int(random(20));
    if (green_colour<0)
    {
      green_colour = 0;
    }

    blue_colour = blue_colour - int(random(20));
    if (blue_colour<0)
    {
      blue_colour = 0;
    }
    
    // make the part a little smaller
    part_size--;
    if (part_size<1)
    {
      part_size = 1;
    }
    
    // update the part's position
    x_position += x_velocity;
    y_position += y_velocity;
    
  }
  
  void render()
  {
    fill(red_colour,green_colour,blue_colour);
    ellipse(x_position,y_position,part_size,part_size);
  }
  
}
