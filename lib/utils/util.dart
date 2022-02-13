import 'dart:ui';

Color cl([String code = "#999999"]) {
  if (code.isNotEmpty && code[0] == "#" && code.length == 4) {
    code = "#${code[1]}${code[1]}${code[2]}${code[2]}${code[3]}${code[3]}";
  } else {
    code = "#999999";
  }
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
