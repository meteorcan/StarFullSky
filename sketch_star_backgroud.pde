float mv=0;
int star_num=30000;
Star[] stars=new Star[star_num];
class Star{
  float x;
  float y;
  
  Star(float x_init,float y_init){
   x=x_init;
   y=y_init;
  }

  void display(float speedx,float speedy){
   ellipse(x+speedx,y+speedy,random(2.5,7),random(2.5,7));
  }
}

void setup()
{
  frameRate(65);
  size(1046,780);
background(0);
smooth();
  for(int i=0;i<stars.length;i++){
    float x=random(-10*width,width);
    float y=random(-10*height,height);
    stars[i]=new Star(x,y);
  }
}

void draw()
{
  background(0);
  //fill(255);
  fill(0, 150, 255);
  for(int i=0;i<stars.length;i++){
    Star a_star=stars[i];
    a_star.display(mv,mv);
  }
  //mv+=0.8;
  if(mousePressed){
    mv=0;
  }else
  {
   mv+=0.8;
  }
}