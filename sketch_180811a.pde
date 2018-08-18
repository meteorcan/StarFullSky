//A demon of star 
//create at 2018-07-18
//

float mv=0;
float angle=0;
float speed=0.0001;
int star_num=1500;
Star[] stars=new Star[star_num];
class Star{
  float x;
  float y;
  float z;
  float r;
  Star(float x_init,float y_init,float z_init){
   x=x_init;
   y=y_init;
   z=z_init;
   r=random(2.5,7);
  }

  void display(float speedx,float speedy,float speedz){
   
   //ellipse(x+speedx,y+speedy,r,r);
   colorMode(HSB,360,100,100);
   strokeWeight(r);
   //int shining=-100*int(random(-1.2,1.2));
   int shining=int(random(180,220));
   
   
   stroke(shining, 220, 255);
   point(x+speedx,y+speedy,z+speedz);
  }
}

void setup()
{
  frameRate(65);
  size(1046,780,P3D);
background(0);
//smooth();
  for(int i=0;i<stars.length;i++){
    float x=random(-5*width,5*width);
    float y=random(-5*height,5*height);
    float z=random(-8*height,8*height);
    stars[i]=new Star(x,y,z);
 
  }
}

void draw()
{
  background(0);
  //fill(255);
  fill(0, 150, 255);
  rotateY(angle*4);
  translate(1.5*width,1.5*height);
  rotate(angle*4);
       for(int i=0;i<stars.length;i++){
    Star a_star=stars[i];
    a_star.display(mv,mv,0);
  }
 angle+=speed;
 filter(BLUR,6);
}