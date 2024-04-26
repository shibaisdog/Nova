import 'Heap/Heap.dart';
class local {
  Map<String,Heap> MEMORY = <String,Heap> {};
  void set(String name,dynamic value) {
    if (MEMORY.containsKey(name)) {
      MEMORY[name]?.change(value);
    } else {
      MEMORY[name] = Heap(name,value);
    }
  }
  void del(String name) {
    if (MEMORY.containsKey(name)) {
      MEMORY.remove(name);
    } else {
      throw Exception('Memory reference error.');
    }
  }
  Heap? get(String name) {
    return MEMORY[name];
  }
}