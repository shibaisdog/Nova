import '../../Method/ExtractValue.dart';

void repl(Map<String, List<String>> Token, String line) {
  if (Token.containsKey('print')) {
    String read = line.substring(line.indexOf('(') + 1, line.indexOf(')')).trim();
    //read = extractValue(Token, read);
    read = Map_List(Token, read);
    print(read);
  }
}
