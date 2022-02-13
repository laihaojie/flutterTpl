import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonType {
  static const String nomarl = "nomarl";
  static const String small = "small";
  static const String large = "large";
}

class ElButton extends StatelessWidget {
  const ElButton(
    this.text, {
    Key? key,
    double? width,
    double? height,
    this.onPressed,
    this.onLongPress,
    this.type = ButtonType.nomarl,
  }) : super(key: key);

  final String text;
  final String type;

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  Widget generation() {
    if (type == ButtonType.nomarl) {
      return ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(60, 0, 60, 0))),
          child: Text(text));
    }
    if (type == ButtonType.small) {
      return ElevatedButton(onPressed: onPressed, child: Text(text));
    }
    if (type == ButtonType.large) {
      return ElevatedButton(onPressed: onPressed, child: Text(text));
    }
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }

  @override
  Widget build(BuildContext context) {
    return generation();
  }
}
