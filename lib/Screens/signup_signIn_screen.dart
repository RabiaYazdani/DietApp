import 'package:diet_app/Screens/camera_permission_screen.dart';
import 'package:diet_app/Widgets/background_image.dart';
import 'package:diet_app/app_color.dart';
import 'package:diet_app/constants.dart';
import 'package:flutter/material.dart';

import '../Widgets/text_action_card.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key, required this.screenTitle}) : super(key: key);
  final String screenTitle;
  @override
  Widget build(BuildContext context) {
    // final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ContainerBackgroundDesign(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              height(heightMediaQuery * 0.2),
              Text(screenTitle,
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: AppColor.colorCode3)),
              height(heightMediaQuery * 0.1),
              SocialLoginWidget(
                action: () {
                  //TODO: Google Login Functionality Goes Here.
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const CameraPermissionScreen()));
                },
                title: "Continue with Google",
                icon: "google.png",
                color: AppColor.blueShade,
              ),
              height(heightMediaQuery * 0.012),
              SocialLoginWidget(
                action: () {
                  //TODO: Google Login Functionality Goes Here.
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const CameraPermissionScreen()));
                },
                title: "Continue with Twitter",
                icon: "twitter.png",
                color: AppColor.blueShade2,
              ),
              height(heightMediaQuery * 0.012),
              SocialLoginWidget(
                action: () {
                  //TODO: Google Login Functionality Goes Here.
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const CameraPermissionScreen()));
                },
                title: "Continue with Apple",
                icon: "apple.png",
                color: AppColor.black,
              ),
              height(heightMediaQuery * 0.012),
              SocialLoginWidget(
                action: () {
                  //TODO: Google Login Functionality Goes Here.
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const CameraPermissionScreen()));
                },
                title: "Continue with Facebook",
                icon: "facebook.png",
                color: AppColor.blueShade3,
              ),
              const Spacer(),
              TextActionCard(
                action: () {
                  //todo: Add Navigation to Terms and Services Screen Here..
                },
                labelText: "By signing up you are agreeing to our ",
                actionText: "Terms and Conditions",
                style:
                    blackFont700.copyWith(decoration: TextDecoration.underline),
              ),
              height(5),
              TextActionCard(
                action: () {
                  //todo: Add Navigation to Privacy Policy Screen Here..
                },
                labelText: "See how we use your data in our ",
                actionText: "Privacy Policy",
                style:
                    blackFont700.copyWith(decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget(
      {Key? key,
      required this.color,
      required this.title,
      required this.icon,
      required this.action})
      : super(key: key);
  final String title;
  final String icon;
  final Color color;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action(),
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: color, width: 2)),
        child: Row(
          children: [
            width(20),
            Image.asset("assets/images/$icon"),
            width(50),
            Text(
              title,
              style: TextStyle(
                  color: color, fontSize: 16, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
