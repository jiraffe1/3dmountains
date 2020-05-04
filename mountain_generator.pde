int mheight;
float gradient;
float climate;
int steps;
float mwt;
float mdp;
float xrot;
float yrot;
float zrot = 0;
float orig_h;
float orig_d;

void setup() {
  size(1200,1000,P3D);
  xrot = 0;
  yrot = 0;
  climate = random(1.0,7.0);
  mheight = int(random(1000,8800));
  gradient = random(0.0010,0.0100);
  steps = round(mheight/50);
  mwt = mheight * random(0.2,0.8);
  mdp = mheight * random(0.2,0.8);
  ortho();
  orig_h = mwt;
  orig_d = mdp;
}

void draw() {
  background(0,120,220);
  fill(0);
  float frams = frameRate;
  
  text("mheight", 40,40);
  text(mheight,40,60);
  text("gradient",40,80);
  text(gradient,40,100);
  text("steps",40,120);
  text(steps,40,140);
  text("climate",40,160);
  text(climate,40,180); 
  text("frame rate",40,200);
  text(frams,40,220);
  translate(width/2,height/2);  
  
  //directionalLight(255,255,255,50,50,50);
  
  rotateX(xrot);
  rotateY(yrot);
  rotateZ(zrot);
  
  fill(0,200,130);

  box(1200,1,1200);
  
  mwt = orig_h;
  mdp = orig_d;
  
  for(int i=0; i < steps; i++) {
    fill(0+(i*climate),200+(i*climate),130+(i*climate));
    translate(0,-1.0*i,0);
    box(mwt,1.0,mdp);
    mwt -= mwt*gradient;
    mdp -= mdp*gradient;
    translate(0,1.0*i,0);
  }

  
  if(keyPressed) {
    if(key == 'a') {
      yrot += 0.005;
    }
    
    if(key == 'w') {
      xrot -= 0.005;
    }
    
    if(key =='s') {
      xrot += 0.005;
    }
    
    if(key == 'd') {
      yrot -= 0.005;
    }
  }
      
}
