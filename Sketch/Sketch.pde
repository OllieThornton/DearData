String[] categories;
ArrayList<String> days, causes;
ArrayList<Entry> entries;

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
}

void draw() {
}
