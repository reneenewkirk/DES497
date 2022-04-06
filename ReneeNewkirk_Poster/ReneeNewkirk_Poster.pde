PImage bird;

int numFrames = 3;
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
PFont font;

PImage bg;
int answer=0;
String[] answers={"The chicken is the closest living relative to the t-rex.","Birds have hollow bones to help them fly.","Birds don't have teeth.","There are over 10,000 species of birds around the world.","Toucans have the longest bill of any bird.","The chicken is the closest living relative to the t-rex.","Cheep.","Ostriches can run up to sixty miles per hour.","Crows are so smart that they can make and use tools.","There are more chickens than any other kind of bird in the world.","Humming birds can fly backwards.","Pigeons can recognize human faces.","Ostriches have the largest eyes of any land animal.","All of the stars in the sky are actually birds.","I am the coolest bird."};
boolean mode=false;

void setup(){
size(1920, 1080);
  bg = loadImage("background.png");
  frameRate(8);
  font = createFont("Tangerine.otf",width/35);
  
  bird = loadImage("birdframe1.png");
  images[0]  = loadImage("birdframe1.png");
  images[1]  = loadImage("birdframe2.png"); 
  images[2]  = loadImage("birdframe3.png"); 
 


  textSize(50);
  fill(0); 
 
}
void draw(){
  
  background(bg);
  
  int i=int(random(0,15));
  if (mode==false)
  {
     textFont(font);
     text("Click to learn a bird fact!",200,300); 
     image(bird,1000,400);
    

  }
  else
  {

    currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
   for (int x = -100; x < width; x += images[0].width) { 
    image(images[(currentFrame) % numFrames], 1000,400);
 
  }
 
    text(answers[answer],200,300); 
  
  }
}
void mouseClicked()
{

answer=round(random(answers.length));
if(answer>answers.length)answer=0;
mode=true;
}
