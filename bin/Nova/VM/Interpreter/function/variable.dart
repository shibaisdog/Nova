import 'dart:convert';
import '../../VM.dart';
import './fun.dart' as fun;
import '../../../Stack/Heap/Heap.dart';
import '../../../Stack/Heap/Type.dart';
import '../../Method/ExtractValue.dart';
import '../../Method/ErrorMessage.dart';

void repl(Map<String, List<String>> Token, String line) {
  if (Token.containsKey('val') && Token.containsKey('=')) {
    line = Map_List(Token, line);
    String name = line.substring(line.indexOf('val') + 3, line.indexOf('=')).trim();
    String value = line.substring(line.indexOf('=') + 1).trim();
    if (value.trim().startsWith('run')) {
      String F_name = line.substring(line.indexOf('run') + 3, line.indexOf('(')).trim();
      value = (fun.RUNING(F_name)).toString();
      Memory.Fun_Run ? (VM.GET_Local_Stack()?.FUNCTION_SET(Memory.FUN_Run_Name, name, value)) : (VM.GET_Local_Stack()?.MAIN_SET(name, value));
      return;
    }
    Memory.Fun_Run ? (VM.GET_Local_Stack()?.FUNCTION_SET(Memory.FUN_Run_Name, name, value)) : (VM.GET_Local_Stack()?.MAIN_SET(name, value));
  } else if (Token.containsKey('=')) {
    line = Map_List(Token, line);
    String name = line.substring(0, line.indexOf('=')).trim();
    String value = line.substring(line.indexOf('=') + 1).trim();
    if (name.indexOf('[') != -1 && name.indexOf(']') != -1) {
      String na = (name.substring(0, name.indexOf('['))).trim();
      Heap? LS = Memory.Fun_Run ? (VM.GET_Local_Stack()?.FUNCTION_GET(Memory.FUN_Run_Name, na)) : (VM.GET_Local_Stack()?.MAIN_GET(na));
      Map<String,dynamic> res = auto(LS?.get_value())[0];
      RegExp(r'([a-zA-Z0-9]+(?:\[[a-zA-Z0-9]*\])+|[a-zA-Z0-9]+)', multiLine: false).allMatches(name).forEach((match) {
        if (LS?.get_type() == "Map") {
          if (RegExp(r'\[(\w+)\]').hasMatch(name)) {
            var matches = RegExp(r'\[(\w+)\]').allMatches(name);
            for (var match in matches) {
              res[(match.group(1)!).toString().replaceAll('"', '').replaceAll("'", '')] = value;
            }
          }
        }
      });
      Memory.Fun_Run ? (VM.GET_Local_Stack()?.FUNCTION_SET(Memory.FUN_Run_Name, na, jsonEncode(res))) : (VM.GET_Local_Stack()?.MAIN_SET(na, jsonEncode(res)));
    } else {
      if (value.trim().startsWith('run')) {
        String F_name = line.substring(line.indexOf('run') + 3, line.indexOf('(')).trim();
        value = (fun.RUNING(F_name)).toString();
        Memory.Fun_Run ? (VM.GET_Local_Stack()?.FUNCTION_SET(Memory.FUN_Run_Name, name, value)) : (VM.GET_Local_Stack()?.MAIN_SET(name, value));
        return;
      }
      Heap? LS = Memory.Fun_Run ? (VM.GET_Local_Stack()?.FUNCTION_GET(Memory.FUN_Run_Name, name)) : (VM.GET_Local_Stack()?.MAIN_GET(name));
      if (LS == null) {
        throw_Error('This variable is not specified.');
      } else {
        Memory.Fun_Run ? (VM.GET_Local_Stack()?.FUNCTION_SET(Memory.FUN_Run_Name, name, value)) : (VM.GET_Local_Stack()?.MAIN_SET(name, value));
      }
    }
  }
}
