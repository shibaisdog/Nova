import './Type.dart';

class Heap {
  String name;
  String type;
  dynamic value;
  Heap(this.name, this.value) : type = auto(value)[1];
  void change(dynamic _) {
    dynamic out = auto(_);
    value = out[0];
    type = out[1];
  }

  dynamic get_value() {
    return value;
  }

  String get_type() {
    return type;
  }
}
