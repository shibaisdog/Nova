import '../VM.dart';
import 'dart:io';

void throw_Error(String Error_Message) {
  print("<RUN TIME ERROR>");
  print("  L  Exception : $Error_Message");
  print("  L  ${Memory.Runing} / line: ${Memory.Line}");
  exit(-1);
}
