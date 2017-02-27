 
int nbPoint = 980;

Point[] Prand = new Point[nbPoint];

void setup()
{
  size(800,600);
  smooth();
  background(0);
  frameRate(30);
  
  for(int i=0;i<nbPoint;i++)
  {
    Prand[i]=new Point((int)random(800),(int)random(600),color(255));
  }
}

void draw()
{
 background(0);
  
  for (int i = 0; i < nbPoint; i++) {
    
    Prand[i].display();
    Prand[i].deplacement();
  }
  //saveFrame();
}

class Point
{
  //declaration des parametre
  int x1;
  int y1;
  color coul;
  
  //constructeur
  Point(int newX1,int newY1,color newColor)
  {
   x1 = newX1;
   y1 = newY1;
   coul = newColor;
  }
  
  void display()
  {
    fill(coul);
    stroke(coul);
    strokeWeight(custom_hasard());
    point(x1,y1);
  }
  
  void deplacement()
  {
    x1=(int)random(800);
    y1=(int)random(800);
  }
  
  int custom_hasard()
  {
    int b;
      int a = (int)random(100);
      if(a<=5){return b=4;}
      if(a>5 && a<10){return b=3;}
      else return (int)random(2);
  }
}