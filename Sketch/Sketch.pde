String[] categories;
ArrayList<String> days, causes;
ArrayList<Entry> entries;
float axisLowerX, axisUpperX, axisLowerY, axisUpperY, axisWidth, axisHeight;
color[] causeColours;

void setup() {
  initialiseVariables();

  readData();
  
  generateColours();
  
  for (Entry entry : entries) {
    println(entry.day);
    println(entry.cause);
    println(entry.numOfLogicErrors);
    println(entry.numOfSyntaxErrors);
  }

  size(400, 400);
}

void draw() {
  drawAxis();

  drawAxisText();
  
  drawEntries();
}

void initialiseVariables() {
  days = new ArrayList<String>();
  causes = new ArrayList<String>();
  entries = new ArrayList<Entry>();
  
  days.add("Monday");
  days.add("Tuesday");
  days.add("Wednesday");
  days.add("Thursday");
  days.add("Friday");
  days.add("Saturday");
  days.add("Sunday");
}

void readData() {
  String[] lines = loadStrings("Data.csv");
  for (int i = 0; i < lines.length; i++) {
    if (i == 0) {
      categories = lines[i].split(",");
    } else {
      String[] values = lines[i].split(",");
      String day = values[0];
      String cause = values[1];
      int numOfLogicErrors = Integer.parseInt(values[2]);
      int numOfSyntaxErrors = Integer.parseInt(values[3]);

      if (!causes.contains(cause)) {
        causes.add(cause);
      }

      entries.add(new Entry(day, cause, numOfLogicErrors, numOfSyntaxErrors));
    }
  }
}

void generateColours() {
  causeColours = new color[causes.size()];
  for(int i = 0; i < causeColours.length; i++) {
    causeColours[i] = color(random(255), random(255), random(255));
  }
}

void drawAxis() {
  axisLowerX = width*(1.0/12);
  axisUpperX = width*(11.0/12);
  axisLowerY = height*(1.0/12);
  axisUpperY = height*(11.0/12);
  axisWidth = axisUpperX - axisLowerX;
  axisHeight = axisUpperY - axisLowerY;
  line(axisLowerX, axisUpperY, axisUpperX, axisUpperY);
  line(axisLowerX, axisUpperY, axisLowerX, axisLowerY);
}

void drawAxisText() {
  int numOfSections = days.size();

  textAlign(CENTER, TOP);
  textSize(width/40);

  for (int i = 0; i < numOfSections; i++) {
    float xPos = (((i*(1.0/7))+(1.0/14)) * axisWidth) + axisLowerX;
    text(days.get(i), xPos, axisUpperY + 5);
  }
}

void drawEntries() {
  for (Entry entry : entries) {
    drawEntry(entry, 5, width/2, height/2);
  }
}

void drawEntry(Entry entry, int size, float x, float y) {
  String day = entry.day;
  String cause = entry.cause;
  int numOfLogicErrors = entry.numOfLogicErrors;
  int numOfSyntaxErrors = entry.numOfSyntaxErrors;
  
  int causeIndex = causes.indexOf(cause);
  color colour = causeColours[causeIndex];
  
  fill(colour);
  circle(x, y, size);
}
