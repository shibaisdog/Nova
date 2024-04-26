import '../../VM.dart';
import '../Interpreter.dart';

void repl(Map<String, List<String>> Token, String line) {
  if (Token.containsKey('fun')) {
    String name = line.substring(line.indexOf('fun') + 3, line.indexOf('(')).trim();
    //String args = line.substring(line.indexOf('(') + 1, line.indexOf(')')).trim();
    VM.GET_Local_Stack()?.FUNCTION_ADD(name);
    Memory.FUN_Push_Name = name;
    Memory.FUN_Push = true;
    return;
  }
  if (line.trim().startsWith('run')) {
    String name = line.substring(line.indexOf('run') + 3, line.indexOf('(')).trim();
    RUNING(name);
  }
}

dynamic RUNING(String name) {
  List<String> RUNING = VM.GET_Local_Stack()?.FUNCTION_WORKLINE[name] ?? [];
  Memory.Fun_Run = true;
  Memory.FUN_Run_Name = name;
  for (String RL in RUNING) {
    doing(RL);
  }
  Memory.Fun_Run = false;
  return VM.GET_Local_Stack()?.FUNCTION_END(Memory.FUN_Run_Name);
}