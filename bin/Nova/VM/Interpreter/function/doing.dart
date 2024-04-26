import '../Interpreter.dart';

void repl(String line) {
  if (line.indexOf("doing") != -1) {
    String _Do = line.substring(0,line.indexOf("->"));
    String _Da = line.substring(line.indexOf("->")+2);
    int runing = int.parse(_Do.substring(_Do.indexOf("(")+1,_Do.indexOf(")")).replaceAll(" ",""));
    for (int i = 0; i < runing; i++) {
      doing(_Da.trim());
    }
  }
}