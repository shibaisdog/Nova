import 'dart:convert';
import '../../VM/Method/ErrorMessage.dart';

dynamic auto(String value) {
  value = value.trim();

  if (value == "null") {
    try {
      return ['null', 'Null'];
    } catch (_) {}
  }

  if (value.startsWith('"') && value.endsWith('"')) {
    return [value, 'string'];
  } else if (value.startsWith('"') && value.endsWith('"')) {
    return [value, 'string'];
  }

  if (value.startsWith('{') && value.endsWith('}')) {
    try {
      dynamic map = jsonDecode(value);
      return [map, 'Map'];
    } catch (e) {}
  }

  if (value.startsWith('[') && value.endsWith("]")) {
    try {
      dynamic list = jsonDecode(value);
      return [list, 'List'];
    } catch (e) {}
  }

  if (RegExp(r'^[0-9]+$').hasMatch(value)) {
    try {
      int Type_int = int.parse(value);
      return [Type_int, 'int'];
    } catch (_) {}
  } else if (RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
    try {
      double Type_double = double.parse(value);
      return [Type_double, 'float'];
    } catch (_) {}
  }

  if (value == "true" || value == "false") {
    try {
      bool Type_bool = bool.parse(value);
      return [Type_bool, 'bool'];
    } catch (_) {}
  }

  throw_Error('Unknown type.');
}
