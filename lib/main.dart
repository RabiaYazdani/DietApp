import 'package:diet_app/Screens/camera_permission_screen.dart';
import 'package:diet_app/Screens/splash_screen.dart';
import 'package:diet_app/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: "Montserrat, Buttoni",
            primaryColor: AppColor.colorCode1,
            primarySwatch: Colors.yellow),
        home: const SplashScreen());
  }
}
