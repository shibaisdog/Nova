Map<String, List<String>> Tokenizer(String Line) {
  Line = Line.replaceAll('(', ' ');
  Line = Line.replaceAll(')', ' ');
  Line = Line.replaceAll('"', ' ');
  Map<String, List<String>> __RETURN__ = <String, List<String>>{};
  List<String> Token = Line.trim().split(" ");
  for (String TK in Token) {
    switch (TK) {
      case 'val':
        __RETURN__['val'] = [];
        break;
      case '=':
        __RETURN__['='] = [];
        break;
      case 'fun':
        __RETURN__['fun'] = [];
        break;
      case 'return':
        __RETURN__['return'] = [];
        break;
      case 'println':
        __RETURN__['print'] = [];
        break;
    }

    RegExp(r'\$([a-zA-Z0-9]+(?:\[[a-zA-Z0-9]*\])+|[a-zA-Z0-9]+)', multiLine: false).allMatches(TK).forEach((match) {
      if (!__RETURN__.containsKey('_var')) {
        __RETURN__['_var'] = [];
      }
      __RETURN__['_var']?.add('\$'+match.group(1)!);
    });
  }
  return __RETURN__;
}