import processing.video.*;
Movie movie;

int cx = 750;
int cy = 425;
int r = 50;
int w = 250;  //This variable is the width and height of the squares.
int u = w/2;

PFont font1, font2;
int textSize, textAlign;

PImage photo;

  
boolean toggle;

void setup() {
  size (1500,850);
  surface.setTitle("Netclips");
  
  //I used sample photos and videos becuase I didn't have the files.
  movie = new Movie(this, "Dog.MP4");
  movie.loop();

 
  photo = loadImage("paint.jpg");
  photo.resize(w,w);  
}

void movieEvent(Movie movie){
  movie.read();
  
}

void draw() {
  background (255);
  //fill(11,195,214); //turqoise     
  
  //This is the title font.
  font1 = createFont("Impact", 92);
  textFont(font1,92);
  textAlign(CENTER);
  fill(11,195,214);
  text("NETCLIPS", 750, 100);
 
  //This is the font which will be used on headings and captions.
  font2 = createFont("Helvetica", 24);
  textFont(font2, 18);
  textAlign(CENTER);
  fill(11,195,214);
  
  //headings
  textAlign(LEFT);
  textSize(42);
  text("Animals", 75,150);
  text("Nature", 75,500);
 
  //captions
  textAlign(CENTER);
  textSize(24);
  
  noStroke();
  rectMode(CENTER);

  //This is the loading screen. When the mouse is pressed, the screen is dimmed and a loading symbol appears.     
  if (mousePressed){
    //screen dim
    fill(255,255,255,150);
    rectMode(CORNER);
    rect(0,0,width,height);
    
    //loading symbol
    ellipseMode(CENTER);
    stroke(240);
    strokeWeight(15);
    noFill();
    ellipse(width/2,height/2,100,100);
    //https://processing.org/discourse/beta/num_1264000877.html
    float t = millis()/250.0f;
    int x = (int)(cx+r*cos(t));
    int y = (int)(cy+r*sin(t));
    fill(200);
    noStroke();
    ellipse(x,y,15,15);
    
  }

  //When the mouse hovers over the button, the cursor changes from an arrow to a hand. 
  if (mouseX > 75
  && mouseX < 325
  && mouseY > 175
  && mouseY < 425){
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
  
  //This is the image which acts as the button.
  image(photo,75,175);
  text("cat",200,450);
  
  //If the button is clicked, the movie will play.
  if (toggle){
  image(movie, 0, 0);
  movie.play();
  //background(0);
  }
  
  //button 2
  //(550, 300, 250, 250);
  //text("dog",550,450);
  
  //button 3
  //(900, 300, 250, 250);
  //text("gold fish",900, 450);
  
  //button 4
  //(1250, 300, 250, 250);
  //text ("lizard", 1250, 450);
  
  //button 5
  //(200, 650, 250, 250);
  //text("parrot",200, 800);
  
  //button 6
  //(550, 650, 250, 250);
  // text("pig", 550, 800);
  
  //button 7
  //(900, 650, 250, 250);
  //text("horse", 900, 800);
  
  //button 8
  //(1250, 650, 250, 250);
  //text("cow", 1250, 800);
}
  
void mousePressed() {
  //This toggle is currently only set for the first button. I need to figure out how to 
  //make it work for all the buttons. 
    if (mouseX > 75 
      && mouseX < 325
      && mouseY > 175
      && mouseY < 425) {
        toggle = !toggle;
      }
}
