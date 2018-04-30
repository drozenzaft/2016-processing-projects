
String[][] data;
int shiftup = 200;
int shiftr = 70;
float barscale = 40.0/21000.0;

void setup() {
  background(255);
  size(1280, 720);
  String [] lines;
  String [] name;
  String [] ridership;

  lines = loadStrings("mta_ridership.csv");

  data = new String[lines.length][];
  name = new String[0];
  ridership = new String[0];

  for (int i = 1; i< data.length; i++) {
    data[i] = split(lines[i], ","); 
  }


  for (int i = 1; i < data.length; i++) {
    String newName = data[i][0].replaceAll("[^a-zA-Z0-9\\-\\ ]","");
    name = append(name, newName);
    ridership = append(ridership, data[i][6]);
  }

  for (int i = 0; i < ridership.length; i++) {
    
    //Create bars
    fill(107,207,252);
    rect(i*10 +shiftr, height-shiftup, 10, -barscale * int(ridership[i]));
    
    pushMatrix();
    fill(0);
    translate(i*10 +shiftr, height - shiftup - barscale * int(ridership[i]) - 40);
    rotate(HALF_PI);
    text(ridership[i], 0,0);
    popMatrix();
    
    //Red bars have ridership > 60,000
    if (int(ridership[i]) > 60000){
      fill(255,0,0);
      //float h = barscale * int(ridership[i]);
      rect(i*10 +shiftr, height-shiftup, 10, -barscale * int(ridership[i]));
      fill(0);
  }
    
    textSize(10);
    fill(0);
    
    //Horizontal Text for X Axis: Station Name
    pushMatrix();
    translate(i*10 +shiftr,height-shiftup+5);
    rotate(HALF_PI);
    text(name[i], 0,0);
    popMatrix();

  }
  
  textSize(40);
  text("Average Weekday Ridership of Manhattan Stations in 2015", width/16, 55);
  
  line(shiftr, height-shiftup-40*11, shiftr, height-shiftup);
  
  // Y Axis: RiderShip
  textSize(10);
  for (int i = 0; i < 11; i++){
    stroke(203);
    line(70, height - shiftup - (40 * i), width, height - shiftup - (40*i));
    fill(0);
    if (21000*i < 1000){
      text(str(21000*i), shiftr/1.25, height - shiftup - (40 * i));
    } 
    if ( 21000*i > 1000 && 21000*i < 100000){
      text(str(21000*i), shiftr/2, height - shiftup - (40 * i));
    } 
    if (21000*i > 100000) {
      text(str(21000*i), shiftr/2.5, height - shiftup - (40 * i));
    }
  }

  //Y Axis Title
  fill(0);
  textSize(20);
  pushMatrix();
  translate(5,height/3);
  rotate(HALF_PI);
  text("Ridership", 0, 0);
  popMatrix();
  
  text("Station Name", width/2, height-20);
}