import 'dart:convert';
import '../../Stack/Heap/Heap.dart';
import '../../Stack/Heap/Type.dart';
import '../VM.dart';

String extractValue_(Map<String, List<String>> TOKEN, String line) {
  if (TOKEN.containsKey('_var')) {
    for (String i in TOKEN['_var'] as List<String>) {
      Heap? LS = Memory.Fun_Run ? (VM.GET_Local_Stack()?.FUNCTION_GET(Memory.FUN_Run_Name, i.substring(i.indexOf('\$') + 1))) : (VM.GET_Local_Stack()?.MAIN_GET(i.substring(i.indexOf('\$') + 1)));
      if (LS?.get_type() == "string") {
        line = line.replaceFirst(i, (LS?.value).toString().replaceAll('"', '').replaceAll("'", '')).toString();
      } else {
        line = line.replaceFirst(i, (LS?.value).toString()).toString();
      }
    }
  }
  return line;
}
String Map_List(Map<String, List<String>> TOKEN, String line) {
  if (TOKEN.containsKey('_var')) {
    for (String i in TOKEN['_var'] as List<String>) {
      String na;
      if (i.indexOf('[') != -1 && i.indexOf(']') != -1) {
        na = i.substring(i.indexOf('\$') + 1, i.indexOf('['));
      } else {
        na = i.substring(i.indexOf('\$') + 1);
      }
      Heap? LS = Memory.Fun_Run ? (VM.GET_Local_Stack()?.FUNCTION_GET(Memory.FUN_Run_Name, na)) : (VM.GET_Local_Stack()?.MAIN_GET(na));
      if (LS?.get_type() == "string") {
        line = line.replaceFirst(i, (LS?.value).toString().replaceAll('"', '').replaceAll("'", '')).toString();
      } else {
        if (LS?.get_type() == "List" || LS?.get_type() == "Map") {
          if (RegExp(r'\[(\w+)\]').hasMatch(i)) {
            dynamic res = [];
            var matches = RegExp(r'\[(\w+)\]').allMatches(i);
            for (var match in matches) {
              if (RegExp(r'^[0-9]+$').hasMatch(match.group(1)!)) {
                if (res != null && res.isEmpty) {
                  res = (auto(LS?.get_value())[0])?[int.parse(match.group(1)!)];
                } else {
                  res = (res)?[int.parse(match.group(1)!)];
                }
              } else {
                if (res != null && res.isEmpty) {
                  res = (auto(LS?.get_value())[0])?[(match.group(1)!).toString().replaceAll('"', '').replaceAll("'", '')];
                } else {
                  res = (res)?[(match.group(1)!).toString().replaceAll('"', '').replaceAll("'", '')];
                }
              }
            }
            line = line.replaceFirst(i, jsonEncode(res)).toString();
            if (auto(line)[1] == "string") {
              line = line.toString().replaceAll('"', '').replaceAll("'", '');
            }
          } else {
            line = line.replaceFirst(i, (LS?.value).toString()).toString();
          }
        } else {
          line = line.replaceFirst(i, (LS?.value).toString()).toString();
        }
      }
    }
  }
  return line;
}