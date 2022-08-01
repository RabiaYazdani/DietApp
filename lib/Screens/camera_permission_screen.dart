import 'package:diet_app/Screens/home_screen.dart';
import 'package:diet_app/app_color.dart';
import 'package:diet_app/constants.dart';
import 'package:flutter/material.dart';

class CameraPermissionScreen extends StatelessWidget {
  const CameraPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            height(mediaQuery.height * 0.07),
            const Text('ACCESS YOUR CAMERA',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: AppColor.black2)),
            height(20),
            Container(
                height: mediaQuery.height * 0.53,
                width: mediaQuery.width * 0.5,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: AppColor.colorCode3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: SizedBox(
                  height: mediaQuery.height * 0.2,
                  width: mediaQuery.width * 0.2,
                  child: Image.asset('assets/images/camera.png'),
                ))),
            height(mediaQuery.height * 0.04),
            SizedBox(
              height: mediaQuery.height * 0.07,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const HomeScreen()));
                },
                style: elevatedButtonStyle(AppColor.colorCode3, AppColor.white),
                child: const Text('Enable Access'),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const HomeScreen()));
                },
                child: const Text(
                  'Do Not Allow',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.greyShade,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
