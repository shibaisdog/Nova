import 'dart:io';
import '../../Nova.dart' as Nova;
class De {
  static bool TM = false;
}
void version(String args) {
  if (
    args == "-v" || 
    args == "--v" ||
    args == "-version" ||
    args == "--version"
  ) {
    print('Nova 1.0.0 at (Dart ${Platform.version})');
    exit(0);
  }
}
bool process(String args) {
  if (
    args == "-p" || 
    args == "--p" ||
    args == "-process" ||
    args == "--process"
  ) {
    De.TM = true;
    return true;
  }
  return false;
}
void run(String args) async {
  if (De.TM) {
    int start_u = DateTime.now().microsecondsSinceEpoch;
    await Nova.run(args);
    int process_u = (DateTime.now().microsecondsSinceEpoch - start_u);
    print("----- [code exit] -----");
    print((process_u / 1000).toString()+"ms");
    return;
  }
  await Nova.run(args);
}