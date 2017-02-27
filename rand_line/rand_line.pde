

int nbTraits = 20;

Traits[] traits = new Traits[nbTraits];

void setup()
{
  size(800,600);
  smooth();
  background(0);
  frameRate(25);
  int a,b;
  
  for(int i=0;i<nbTraits;i++)
  {
    traits[i]=new Traits((int)random(800),0,(int)random(800),800,color(255));
  }
}

void draw()
{
  background(0);
  
  for (int i = 0; i < nbTraits; i++) {
    
    traits[i].display();
    traits[i].deplacement();
  }
//  saveFrame();
}

class Traits
{
  //declaration des parametre
  int x1;
  int x2;
  int y1;
  int y2;
  color coul;
  
  //constructeur
  Traits(int newX1,int newY1,int newX2,int newY2,color newColor)
  {
   x1 = newX1;
   x2 = newX2;
   y1 = newY1;
   y2 = newY2;
   coul = newColor;
  }
  
  void display()
  {
    fill(coul);
    stroke(coul);
    strokeWeight(random(3));
    line(x1,y1,x2,y2);
  }
  
  int hasard()
  {
    int a = (int)random(1000);
    if(a%2==0)
    {
      return 0;
    }
    else return 800;
  }
  
  void deplacement()
  {
    int a=(int)random(800);
   
    if(a%2==0)
    {
       x1=a;
       y1=hasard();
    }
   
    if(a%2!=0)
    {
      x1=hasard();
      y1=(int)random(800);
    }
    
    int b=(int)random(800);
    
    if(b%2==0)
    {
       x2=a;
       y2=hasard();
       if(x1==x2)
       {x2 = (int)random(800);}
    }
  
    if(b%2!=0)
    {
      x2=hasard();
      y2=(int)random(800);
    }
  }
  
}