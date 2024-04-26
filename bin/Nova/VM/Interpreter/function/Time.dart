String repl(String line) {
  line = line.replaceAll("Time.now()",(DateTime.now().millisecondsSinceEpoch).toString());
  return line;
}