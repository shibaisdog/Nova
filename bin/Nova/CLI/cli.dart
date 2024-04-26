import 'function/commands.dart';
void manag(List<String> args) {
  if (args.isNotEmpty) {
    for (String f in args) {
      if (process(f)) {
        continue;
      }
      version(f);
      run(f);
    }
  } else {
    print("Owo?");
  }
}