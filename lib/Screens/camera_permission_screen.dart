import 'package:diet_app/Screens/home_screen.dart';
import 'package:diet_app/app_color.dart';
import 'package:diet_app/constants.dart';
import 'package:flutter/material.dart';

class CameraPermissionScreen extends StatelessWidget {
  const CameraPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            height(40),
            const Text('ACCESS YOUR CAMERA',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: AppColor.black2)),
            height(20),
            Container(
                height: 370,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: AppColor.colorCode3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset('assets/images/camera.png'),
                ))),
            height(30),
            SizedBox(
              height: 50,
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
