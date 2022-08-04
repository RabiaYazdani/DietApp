import 'package:flutter/material.dart';

import '../Widgets/text_action_widget.dart';
import '../Screens/signup_signIn_screen.dart';
import '../Widgets/background_image_widget.dart';
import '../Widgets/buttoni_font_widget.dart';
import '../app_color.dart';
import '../constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.colorCode3,
      body: ContainerBackgroundDesign(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const ButtoniText(
                  size: 96, color: AppColor.white, text: 'Diet App'),
              const Spacer(),
              SizedBox(
                width: widthMediaQuery,
                height: heightMediaQuery * 0.09,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const SignInScreen(
                                    screenTitle: "Sign Up",
                                  )));
                    },
                    style: elevatedButtonStyle(
                        AppColor.white, AppColor.colorCode3),
                    child: const Text('Lets Get Started')),
              ),
              height(10),
              TextActionCard(
                action: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const SignInScreen(
                                screenTitle: "Sign In",
                              )));
                },
                labelText: "Already have an account?",
                actionText: "Sign In",
                style: blackFont700.copyWith(color: AppColor.white),
              ),
              height(30),
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
    );
  }
}
