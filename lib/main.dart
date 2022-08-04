import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../Screens/splash_screen.dart';
import '../app_color.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ConstantParameters.cameraList();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: "Montserrat, Buttoni",
            primaryColor: AppColor.colorCode1,
            primarySwatch: Colors.yellow),
        home: const SplashScreen());
  }
}
