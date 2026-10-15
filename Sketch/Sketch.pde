String[] categories;
ArrayList<String> days, causes;
ArrayList<Entry> entries;
float axisLowerX, axisUpperX, axisLowerY, axisUpperY, axisWidth, axisHeight;

void setup() {
  int lineNum = 0;
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
  
  BufferedReader reader = createReader("Data.csv");
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      if (lineNum == 0) {
        categories = line.split(",");
      } else {
        String[] values = line.split(",");
        String day = values[0];
        String cause = values[1];
        int numOfLogicErrors = Integer.parseInt(values[2]);
        int numOfSyntaxErrors = Integer.parseInt(values[3]);
        
        if (!causes.contains(cause)) {
          causes.add(cause);
        }
        
        entries.add(new Entry(day, cause, numOfLogicErrors, numOfSyntaxErrors));
      }
      lineNum++;
    }
    reader.close();
  }
  catch (IOException e) {
    e.printStackTrace();
  }
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
