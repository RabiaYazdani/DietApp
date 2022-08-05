import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'Info_Cards/payment_card.dart';
import 'Info_Cards/tips_error_card.dart';
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
TextStyle yellowText = const TextStyle(
    fontWeight: FontWeight.w500, fontSize: 24, color: AppColor.colorCode3);

class ConstantParameters {
  static late List<CameraDescription> camera;

  static Future<List<CameraDescription>> cameraList() async {
    camera = await availableCameras();
    print('camera initialized Successfully');
    return camera;
  }
}

void showTips(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: TipsAndErrorCard(
            label: 'Tips',
            imageUrl: 'question',
            information: tips,
          ));
    },
  );
}

void showPaymentCard(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: const PaymentCard(),
      );
    },
  );
}
