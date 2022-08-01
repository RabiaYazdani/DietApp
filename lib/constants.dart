import 'package:flutter/material.dart';
import 'app_color.dart';

SizedBox width(double size) {
  return SizedBox(width: size);
}

SizedBox height(double size) {
  return SizedBox(height: size);
}

ButtonStyle elevatedButtonStyle(Color backgroundColor, Color foregroundColor) {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(backgroundColor),
      foregroundColor: MaterialStateProperty.all(foregroundColor),
      textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
}

TextStyle blackFont500 = const TextStyle(
    fontSize: 11, fontWeight: FontWeight.w500, color: AppColor.lightBlack);
TextStyle blackFont700 = const TextStyle(
    fontSize: 11, fontWeight: FontWeight.w700, color: AppColor.lightBlack);

List<String> tips = [
  "Drink calorie free drinks only",
  "Calorie free drinks are water",
  "Black coffee and black tea",
  "Sparkling water",
  "Diet soda"
];
