int longueurRect = 700;
int hauteurRect = 100;
int nbRectangle = 5;
int nbTrait = 10;
int margin = 10;

MyContener c;

void setup(){
  size(1024, 768);
  background(0,0,0);
  c = new MyContener(nbRectangle);
}

void draw(){
  background(0,0,0);
  c.display();
}


/** Contient les rectangles, ajuste leurs positions **/
class MyContener{
  int nbRect;
  MyRect[] r;
  
  MyContener(int nbrect){
    nbRect=nbrect;
    r = new MyRect[nbRect];
    for(int i=0; i<nbRect; i++){
      int x1 = (width/2)-(longueurRect/2);  
      int x2 = longueurRect;
      int y1=0;
      int y2 = hauteurRect;
      if(nbRect==1){
        y1 = (height/2)-(hauteurRect/2);
      }
      else{
        y1 = (height/2)-(((nbRect*hauteurRect)/2) + (((nbRect-1)*margin)/2))+ (i*(hauteurRect+margin));
      }
      r[i]= new MyRect(x1,y1,x2,y2,nbTrait);
    }
  }

  void display(){
      for(int i=0; i<nbRect;i++){
        r[i].display();
      }
    }
}

class MyRect{
  int x1;
  int y1;
  int x2;
  int y2;
  int nbLine;
  MyLine[] l;
  
  MyRect(int X1, int Y1, int X2, int Y2, int nbline){
    x1 = X1;
    y1 = Y1;
    x2 = X2;
    y2 = Y2;
    nbLine =nbline;
    l = new MyLine[nbLine];
    for(int i=0;i<nbline;i++){
      l[i] = new MyLine(x1,y1,i,nbline);
    }
   }
   
  void display(){
    noFill();
    stroke(255,255,255);
    rect(x1,y1,x2,y2);
      
    for(int i=0;i<nbTrait;i++){
      l[i].deplacement();
      l[i].display();
    }
  }
}


class MyLine{ 
  int origin;
  int x1;
  int y1;
  int x2;
  int y2;
  int decalage; // decalage de la ligne pa rapport à la premiere
  int nbline;   // nombre de ligne totale dans le rectangle

  
  MyLine(int X1, int Y1, int Pas, int nbLine){ // le pas correspond a l'incrément de la boucle des lines

    nbline = nbLine;
    decalage = calculdecalage(Pas);
    origin = X1+decalage;
    x1 = X1+decalage;
    y1 = Y1;
    x2 = x1;
    y2 = Y1+hauteurRect;
  }
  
  void display(){
    line(x1, y1, x2, y2);
  }
  
  void deplacement(){
    //r.display();
    if(x1>(origin+(longueurRect/nbline))){
      x1 = origin; 
      x2 = x1 ;
    }
    x1+=1;
    x2=x1;
  }
  
  int calculdecalage(int Pas){
    if(Pas==0){return 0;}
    else{
      return (longueurRect/nbline)*Pas;
    }
  }
}
