import 'package:diet_app/constants.dart';
import 'package:flutter/material.dart';

import '../app_color.dart';
import 'custom_divider_widget.dart';

class SafeToEat extends StatelessWidget {
  const SafeToEat({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        height: mediaQuery.height * 0.15,
        child: Stack(
          children: [
            SizedBox(
              height: mediaQuery.height * 0.08,
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  children: [
                    Container(
                      width: width >= 0.88
                          ? mediaQuery.width * 0.88
                          : mediaQuery.width * width,
                      decoration: BoxDecoration(
                          borderRadius: width == 0.88
                              ? BorderRadius.circular(40)
                              : const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(40)),
                          gradient: width > 0.65
                              ? const LinearGradient(colors: [
                                  AppColor.colorCode1,
                                  AppColor.colorCode1,
                                  AppColor.colorCode1,
                                  AppColor.colorCode1,
                                  AppColor.colorCode1,
                                  AppColor.colorCode2,
                                  AppColor.colorCode2,
                                  AppColor.colorCode3,
                                  AppColor.colorCode3,
                                ])
                              : null,
                          color: AppColor.colorCode1),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: mediaQuery.width * 0.5),
              child: Column(
                children: const [
                  CustomDivider(),
                  Text('Safe Limit'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
