import '../VM.dart';
import '../Method/Tokenizer.dart';
import '../Method/ExtractValue.dart';
import './function/variable.dart' as variable;
import './function/print.dart' as prints;
import './function/doing.dart' as doings;
import './function/fun.dart' as fun;
import './function/Time.dart' as Times;
import './function/Math.dart' as Maths;

void doing(String line) {
  if (Memory.FUN_Push) {
    if (line.trim() == '}') {
      Memory.FUN_Push = false;
    } else if (line.trim().startsWith('return')) {
      VM.GET_Local_Stack()?.FUNCTION_PUSH(Memory.FUN_Push_Name,line.trim());
      Memory.FUN_Push = false;
    } else {
      VM.GET_Local_Stack()?.FUNCTION_PUSH(Memory.FUN_Push_Name,line.trim());
    }
  } else {
    Map<String, List<String>> Token = Tokenizer(line);
    line = Times.repl(line);
    line = Maths.repl(Token, line);
    if (Memory.Fun_Run) {
      if (Token.containsKey('return')) {
        line = line.substring(line.indexOf('return')+6).trim();
        //line = extractValue(Token, line);
        line = Map_List(Token,line);
        VM.GET_Local_Stack()?.FUNCTION_RETURN[Memory.FUN_Run_Name] = line;
      }
    }
    variable.repl(Token,line);
    prints.repl(Token,line);
    fun.repl(Token,line);
    doings.repl(line);
  }
  Memory.Line += 1;
}
