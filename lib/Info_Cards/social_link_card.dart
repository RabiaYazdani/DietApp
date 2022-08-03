import 'package:flutter/material.dart';

import '../app_color.dart';
import '../constants.dart';

class SocialLinkCard extends StatelessWidget {
  const SocialLinkCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.25,
      width: mediaQuery.width * 0.44,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.share, size: 40, color: AppColor.colorCode3),
          height(10),
          const Text('Share',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.colorCode3)),
          height(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialLinkSharingWidget(
                socialMediaLink: GestureDetector(
                    onTap: () {},
                    child: Image.asset('assets/images/twitter.png')),
              ),
              width(10),
              SocialLinkSharingWidget(
                socialMediaLink: GestureDetector(
                    onTap: () {},
                    child: Image.asset('assets/images/facebook.png')),
              ),
              width(10),
              SocialLinkSharingWidget(
                socialMediaLink: GestureDetector(
                    onTap: () {},
                    child: Image.asset('assets/images/whatsapp.png')),
              ),
              width(10),
              SocialLinkSharingWidget(
                socialMediaLink: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/insta.png',
                      fit: BoxFit.fitWidth,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SocialLinkSharingWidget extends StatelessWidget {
  const SocialLinkSharingWidget({Key? key, required this.socialMediaLink})
      : super(key: key);
  final Widget socialMediaLink;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.blackShade,
          border: Border.all(color: AppColor.blackShade, width: 1),
        ),
        child: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.white,
              border: Border.all(color: AppColor.blackShade, width: 1),
            ),
            child: socialMediaLink));
  }
}
