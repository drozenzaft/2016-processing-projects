void accidentDude(float headx, float heady,float headcurveX, float headcurveY,int numPersons) {
  float highness = 135;
  float wideness = 135;
 // fill(255,0,255);
  //rect(headx-60,heady+350,wideness-85,highness-15);
  for (int i=0;i<numPersons;i+=1){
  fill(0,255,0);
  arc(headx+(80*i), heady+40*i, wideness, highness, headcurveX, headcurveY);
  stroke(0,0,255);//sets the border color for all shapes
  rect((headx-74.5)+80*i,(heady+70)+40*i,wideness+15,highness-35); //y-coordinate goes downward, rather than upward, so the coordinates are flipped upside down
  rect((headx-224.5)+80*i,(heady+70)+40*i,wideness+15,highness-85);
  rect((headx+74.5)+80*i,(heady+70)+40*i,wideness+15,highness-85);
  rect((headx-74.5)+80*i,(heady+170)+40*i,wideness-85,highness+65);
  fill(255,0,0);
  rect((headx+24.5)+80*i,(heady+170)+40*i,wideness-85,highness+65);
  }}
float x = 0.27;
void setup() {
  //Happens once at the beginning of your program
  //enlarge the tiny default 100x100 box
  size(1280, 800);
}

void draw() {
  //Runs continuously while the program is open
  background(0,0,60);
  accidentDude(0,0,2.4, 9.6,12);
}