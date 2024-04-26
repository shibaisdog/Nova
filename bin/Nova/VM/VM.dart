import '../Stack/Stack-Frame.dart';
import '../Stack/Stack.dart';

class Memory {
  static StackFrame Nova = StackFrame();
  static String Runing = "";
  static int Line = 1;
  static bool FUN_Push = false;
  static String FUN_Push_Name = "";
  static bool Fun_Run = false;
  static String FUN_Run_Name = "";
}

class VM {
  static Stack? GET_ELSE_Local_Stack(String filename) {
    return Memory.Nova.local_Stack(filename);
  }

  static Stack? GET_Local_Stack() {
    return Memory.Nova.local_Stack(Memory.Runing);
  }

  static Stack? GET_Global_Stack() {
    return Memory.Nova.global_Stack();
  }

  static void Doing_File(String file) {
    if (!Memory.Nova.FILES_VM.containsKey(file)) {
      Memory.Nova.init(file);
    }
    Memory.Runing = file;
    Memory.Line = 1;
  }
}
