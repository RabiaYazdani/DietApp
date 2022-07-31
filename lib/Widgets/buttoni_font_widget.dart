import 'package:flutter/material.dart';

class ButtoniText extends StatelessWidget {
  const ButtoniText(
      {Key? key, required this.size, required this.color, required this.text})
      : super(key: key);
  final String text;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "Buttoni",
          fontSize: size,
          fontWeight: FontWeight.w400,
          color: color),
    );
  }
}
