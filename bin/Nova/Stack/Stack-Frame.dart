import 'Stack.dart';

class StackFrame {
  Map<String, Stack> FILES_VM = <String, Stack>{};
  Stack GLOBAL_MEMORY = Stack();
  void init(String filename) {
    FILES_VM[filename] = Stack();
  }

  Stack? local_Stack(String filename) {
    if (!FILES_VM.containsKey(filename)) {
      throw Exception('The stack is not declared.');
    } else {
      return FILES_VM[filename];
    }
  }

  Stack? global_Stack() {
    return GLOBAL_MEMORY;
  }
}
