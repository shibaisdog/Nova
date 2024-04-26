import '../../Method/operations.dart';
import '../../Method/ExtractValue.dart';

String repl(Map<String, List<String>> Token, String line) {
  if (line.contains("Math")) {
    String calculation = line.substring(line.indexOf("(") + 1, line.lastIndexOf(")"));
    String result = invalue(Map_List(Token,calculation)).replaceAll(" ", ""); //extractValue(Token, calculation)
    line = line.replaceFirst("Math(" + calculation + ")", result);
  }
  return line; //.replaceAll('"','');
}
