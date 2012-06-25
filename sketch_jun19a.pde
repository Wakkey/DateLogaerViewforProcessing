//for importing csv files into a 2d array
//by che-wei wang
import processing.opengl.*;


String lines[] = loadStrings("2011_12_26_16_46_27.csv");
int NUM = lines.length;
String [][] csv;
String [] set1= new String[NUM];
String [] set2= new String[NUM];
String [] set3= new String[NUM];
String [] set4= new String[NUM];
String [] set5= new String[NUM];

int csvWidth=0;


int i1, x2, y2, biritu, panelWidth, panelHeight;
int x, y, xcount1, xcount2, ycount1, ycount2, countx, county;



//calculate max width of csv file
for (int i=0; i < NUM; i++) {
  String [] chars=split(lines[i], ',');
  if (chars.length>csvWidth) {
    csvWidth=chars.length;
  }
}

//create csv array based on # of rows and columns in csv file
csv = new String [NUM][csvWidth];

//parse values into 2d array
for (int i=0; i < NUM; i++) {
  String [] temp = new String [NUM];
  temp= split(lines[i], ',');
  for (int j=0; j < temp.length; j++) {
    csv[i][j]=temp[j];
  }
}


//test
/*for (int i=0; i < lines.length; i++) {
 String [] temp = new String [lines.length];
 temp= split(lines[i], ',');
 for (int j=0; j < temp.length; j++) {
 set1[i] = csv[i][1] + " " + csv[i][2];
 }
 }
 
 for (int i=0; i < lines.length; i++) {
 String [] temp = new String [lines.length];
 temp= split(lines[i], ',');
 for (int j=0; j < temp.length; j++) {
 set2[i] = csv[i][3];
 }
 }
 
 for (int i=0; i < lines.length; i++) {
 String [] temp = new String [lines.length];
 temp= split(lines[i], ',');
 for (int j=0; j < temp.length; j++) {
 set3[i] = csv[i][5];
 }
 }
 
 for (int i=0; i < lines.length; i++) {
 String [] temp = new String [lines.length];
 temp= split(lines[i], ',');
 for (int j=0; j < temp.length; j++) {
 set4[i] = csv[i][5];
 }
 }
 for (int i=0; i < lines.length; i++) {
 String [] temp = new String [lines.length];
 temp= split(lines[i], ',');
 for (int j=0; j < temp.length; j++) {
 set5[i] = csv[i][7];
 }
 }
 
 */

xcount1 = 0; 
xcount2 = 0;
ycount1 = 0; 
ycount2 = 0;
countx = 0; 
county = 0;
biritu = 1000 * 50;
panelWidth = 200;
panelHeight = 200;
for (int i=1; i < NUM; i++)
{
  x = int(float(csv[i][3]) * 10000) * biritu
    - int(float(csv[1][3]) * 10000) * biritu;

  y = int(float(csv[i][5]) * 10000) * biritu
    - int(float(csv[1][5]) * 10000) * biritu;

  if ( xcount1 < x )
  {
    xcount1 = x;
  } 
  else
    if ( xcount2 > x )
    {
      xcount2 = x;
    }
  if ( ycount1 < y )
  {
    ycount1 = y;
  } 
  else
    if ( ycount2 > y )
    {
      ycount2 = y;
    }

  countx = int((xcount1 - xcount2) * 0.00001);
  county = int((ycount1 - ycount2) * 0.00001);

  panelWidth = int(countx + 50 * (countx * 0.01));
  panelHeight= int(county + 50 * (county * 0.01));

  x2 = int(x * 0.00001);

  y2 = int(y * 0.00001);
  set2[i] = str(x2);
  set3[i] = str(y2);
}
size(panelHeight, panelWidth);

println(panelWidth + " " + panelHeight);
i1 = 1;

//count_x = countx;
//count_y = county;
point( countx + int(set2[i1]), county + int(set3[i1]));
println( countx + int(set2[i1])+ " " + county + int(set3[i1]));

for (int i=1; i < NUM; i++)
{
  point( countx + int(set2[i]), county + int(set3[i]));
}

