void setup() {
  BufferedReader reader = createReader("C:\Users\Ollie\Documents\Java\DearData\Data.csv");
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      println(line);
    }
    reader.close();
  } catch (IOException e) {
    e.printStackTrace();
  }
}

void draw() {
  
}
