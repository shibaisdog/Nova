import 'dart:io';

class file {
  static Future<String> read(String file) async {
    File f = File(file);
    return f.readAsStringSync();
  }
}
