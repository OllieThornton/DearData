class Entry {
  String day;
  String cause;
  int numOfLogicErrors;
  int numOfSyntaxErrors;
  
  Entry(String day, String cause, int numOfLogicErrors, int numOfSyntaxErrors) {
    this.day = day;
    this.cause = cause;
    this.numOfLogicErrors = numOfLogicErrors;
    this.numOfSyntaxErrors = numOfSyntaxErrors;
  }
}
