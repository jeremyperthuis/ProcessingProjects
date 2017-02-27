int nbPoint = 3000;

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
// background(0);
int a = (int)random(20);
  for (int i = 0; i < nbPoint; i++) {
    
    Prand[i].display();
    Prand[i].deplacement();
  }
  
  if(a==4)
  {
    for (int i = 0; i < nbPoint; i++) 
    {
       Prand[i].dynamique();
    }   
  }
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  //saveFrame();
}

int MyRandom(int min, int max)
{
    int res = (int)random(max)+min;
    return res;    
}

class Point
{
  //declaration des parametre
  int x;
  int y;
  color coul;
  int direction; // 0->bas  1->gauche  2->haut  3->droite
  
  //constructeur
  Point(int x,int y,color coul)
  {
   this.x = x;
   this.y = y;
   this.coul = coul;
   direction = (int)random(4);
   
  }
  
  //methodes
  void display()
  {
    fill(coul);
    stroke(coul);
    strokeWeight(1);
    point(x,y);
  }
  void testMur()
  {
    if(x==0)
    {
        direction = 3; 
    }
    if(x==width)
    {
      direction=1;
    }
    if(y==0)
    {
        direction = 0; 
    }
    if(y==height)
    {
      direction=2;
    }
  }
  void deplacement()
  {
    testMur();
     switch(direction)
     {
       case 0:
         y+=1; break;
       case 1:
         x-=1; break;
       case 2:
         y-=1; break;
       case 3:
         x+=1; break;
     }
  }
 
  void dynamique()
  {
    if(direction==0)
    {
      int choix[]={0,1,3};
      int index = (int)random(choix.length);
      direction= choix[index];
    }
   
    if(direction==1)
    {
      int[] choix={0,1,2};
      int index = (int)random(choix.length);
      direction= choix[index];
    }
    
    if(direction==2)
    {
      int[] choix={1,2,3};
      int index = (int)random(choix.length);
      direction= choix[index];
    }
    
    if(direction==3)
    {
      int[] choix={0,2,3};
      int index = (int)random(choix.length);
      direction= choix[index];
    }
    print(direction);
  }

}