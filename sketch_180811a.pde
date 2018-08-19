//A demon of star 
//create at 2018-07-18
//

float mv=0;
float angle=0;
float speed=0.0001;
int star_num=1000;
Star[] stars=new Star[star_num];
int heart_len=16;
int star_mode=0;
boolean key_S=false;
Star [] heart1 = new Star[heart_len];
Star [] heart2 = new Star[heart_len];
class Star{
  float x;
  float y;
  float z;
  float r;
  int mode;
  Star(float x_init,float y_init,float z_init){
    
    // mode=0 usual
    // mode=1 special
   x=x_init;
   y=y_init;
   z=z_init;
   r=random(2.5,7);
  }

  void display(int mode){
   int shining;
   colorMode(HSB,360,100,100);
   strokeWeight(r);
   //int shining=-100*int(random(-1.2,1.2));
   if(mode==0){
    shining=int(random(0,205));
   }else if(mode==1)
   {
     shining=int(random(180,255));
   }else
   {
     shining=int(map(mouseX,0,width,0,255));
   }
   
   stroke(shining, 220, 255);
   point(x,y,z);
  }
}

void setup()
{
  frameRate(65);
  size(1046,780,P3D);
background(0);
smooth();
  for(int i=0;i<stars.length;i++){
    float x=random(-3*width,3*width);
    float y=random(-3*height,3*height);
    float z=random(-2*height,2*height);
    stars[i]=new Star(x,y,z);
  }
  
  // make a coordinate for heart
  
  for(int i=0;i<heart_len;i++){
    float x=(i-0.5*heart_len)*4/heart_len;
    
    float y1=-sqrt(2*abs(x)-pow(x,2));
    float y2=2.14*sqrt(sqrt(2)-sqrt(abs(x)));
    
    println(i,x,y1,y2);
    heart1[i]=new Star(x*50,y1*60,0);
    heart2[i]=new Star(x*50,y2*60,0);
  }
}

void keyPressed()
{
  star_mode=2;
  if(key=='s')
  {
       key_S=true;}
}
void keyReleased()
{
 star_mode=0;
 key_S=false;
}
void draw()
{
  background(0);
  //filter(BLUR,6);
  //fill(255);
  fill(0, 150, 255);
  
  pushMatrix();
  rotateY(angle*4);
  rotateZ(angle*2);
  
  //rotate(angle*4);
       for(int i=0;i<stars.length;i++){
    Star a_star=stars[i];

    a_star.display(star_mode);
  }
  popMatrix();
  
  if(key_S==true){
    translate(mouseX,mouseY);
    //scale(0.1*abs(sin(10000*angle))+1);
  //rotateZ(angle*2);

    for(int i=0;i<heart_len;i++){
    Star h_star1=heart1[i];
    Star h_star2=heart2[i];
    h_star1.display(1);
    h_star2.display(1);
  }

  }

  
   angle+=speed; 
   
  // if(frameCount<3000){
  //  saveFrame("frames/star_h-####.tif");
  // }else{
  //exit();   
  // }
 
}