import './Stack-Heap.dart';
import 'Heap/Heap.dart';
class Stack {
  local                       MAIN_MEMORY    = local();
  Map<String,local>         FUNCTION_MEMORY  = <String,local> {};
  Map<String,dynamic>       FUNCTION_RETURN  = <String,dynamic> {};
  Map<String,List<String>> FUNCTION_WORKLINE = <String,List<String>> {};
  /**
   * MAIN_MEMORY
   */
  void MAIN_SET(String name,dynamic value) {
    MAIN_MEMORY.set(name, value);
  }
  /**
   * MAIN_MEMORY
   */
  void MAIN_DEL(String name) {
    MAIN_MEMORY.del(name);
  }
  /**
   * MAIN_MEMORY
   */
  Heap? MAIN_GET(String name) {
    return MAIN_MEMORY.get(name);
  }
  /////////////////////////////////////////////////////////////////////
  /**
   * FUNCTION_MEMORY
   */
  void FUNCTION_SET(String fun_name,String val_name,dynamic value) {
    FUNCTION_MEMORY[fun_name]?.set(val_name,value);
  }
  /**
   * FUNCTION_MEMORY
   */
  void FUNCTION_DEL(String fun_name,String val_name) {
    FUNCTION_MEMORY[fun_name]?.del(val_name);
  }
  /**
   * FUNCTION_MEMORY
   */
  void FUNCTION_SET_RTN(String fun_name,dynamic value) {
    FUNCTION_RETURN[fun_name] = value;
  }
  /**
   * FUNCTION_MEMORY
   */
  Heap? FUNCTION_GET(String fun_name,String val_name) {
    if (!FUNCTION_MEMORY.containsKey(fun_name)) {
      return null;
    } else {
      return FUNCTION_MEMORY[fun_name]?.get(val_name);
    }
  }
  /////////////////////////////////////////////////////////////////////
  /**
   * FUNCTION_WORKLINE
   */
  void FUNCTION_ADD(String name) {
    FUNCTION_MEMORY[name] = local();
    FUNCTION_RETURN[name] = [];
    FUNCTION_WORKLINE[name] = [];
  }
  /**
   * FUNCTION_WORKLINE
   */
  dynamic FUNCTION_END(String name) {
    dynamic _DATA = FUNCTION_RETURN[name];
    FUNCTION_MEMORY[name] = local();
    FUNCTION_RETURN[name] = [];
    return _DATA;
  }
  /**
   * FUNCTION_WORKLINE
   */
  void FUNCTION_PUSH(String name,String Line) {
    FUNCTION_WORKLINE[name]?.add(Line);
  }
}