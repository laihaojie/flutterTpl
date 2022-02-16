import 'dart:ui';

class Utils {
  static Color cl([String code = "#999999"]) {
    if (code.isEmpty ||
        code[0] != "#" ||
        (code.length != 4 && code.length != 7)) {
      throw "传的字符串格式错误";
    }
    if (code.length == 4) {
      code = "#${code[1]}${code[1]}${code[2]}${code[2]}${code[3]}${code[3]}";
    }
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
