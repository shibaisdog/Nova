String invalue(String line) {
  if (line.indexOf("+") != -1 && line.indexOf("-") != -1 && line.indexOf("*") != -1 && line.indexOf("/") != -1) {return line;}
  RegExp pattern = RegExp(r'(-?\d+)\s*([+\-*/])\s*(-?\d+)');
  String result = line.replaceAllMapped(pattern, (match) {
    double operand1 = double.parse(match.group(1)!);
    String operator = match.group(2)!;
    double operand2 = double.parse(match.group(3)!);
    int computedResult = 0;
    switch (operator) {
      case '+':
        computedResult = (operand1 + operand2).toInt();
        break;
      case '-':
        computedResult = (operand1 - operand2).toInt();
        break;
      case '*':
        computedResult = (operand1 * operand2).toInt();
        break;
      case '/':
        computedResult = (operand1 ~/ operand2);
        break;
    }
    return computedResult.toString();
  });
  return result;
}