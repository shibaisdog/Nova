import 'dart:io';
import './VM/VM.dart';
import './VM/Interpreter/Interpreter.dart';
import './VM/Method/Process.dart';
import './CLI/cli.dart' as CLI;

Future<void> run(String filename) async {
  VM.Doing_File(filename);
  File file_ = File(filename);
  if (file_.existsSync()) {
    String text = await file.read(filename);
    List<String> line = text.split('\n');
    for (String i in line) {
      if (i.isEmpty) {
        return;
      }
      doing(i);
    }
  } else {
    print("The file does not exist > (\"$filename\")");
  }
}

void main(List<String> args) {
  CLI.manag(args);
}
