int[] frequencies;
String[][] data;



void setup() {
  background(255);
  size(800,600);
  String[] lines;
  String [] name;
  String [] ridership;
  
  lines= loadStrings("StarWars.csv");
  //lines = split(lines[2],",");
  data = new String[lines.length][];
  name = new String[data.length];
  ridership = new String[data.length];
  for(int i = 0; i< data.length; i++){
    data[i] = split(lines[i],",");
  }
  //frequencies = new int[1];
  for (int i = 0; i < data.length;i++) {
    for(int j = 0; j < 6; j++){
      append(name,data[i][0]);
      append(ridership, data[i][5]);
      }
    }
  textSize(40);
  for (int i = 0; i < ridership.length;i++){
    fill(0,0,255);
    ellipse(i + 10, float(ridership[i]), 20, 20);
  }
  text("Manhattan MTA Ridership",width/3,40);
}