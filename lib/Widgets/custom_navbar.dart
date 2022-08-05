import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../Info_Cards/social_link_card.dart';
import '../Screens/bite_screen.dart';
import '../Screens/camera_screen.dart';
import '../app_color.dart';
import '../constants.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BiteNavigationButton(),
          Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.colorCode3),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const CameraScreen()));
                },
                icon: Image.asset('assets/images/cam_selected.png'),
                iconSize: 30,
              )),
          const SocialNavigationButton(),
        ],
      ),
    );
  }
}

class SocialNavigationButton extends StatelessWidget {
  const SocialNavigationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  content: const SocialLinkCard(),
                ));
      },
      icon: Image.asset('assets/images/social.png'),
      iconSize: 30,
    );
  }
}

class BiteNavigationButton extends StatelessWidget {
  const BiteNavigationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const BiteScreen()));
      },
      icon: Image.asset('assets/images/eat.png'),
      iconSize: 30,
    );
  }
}
