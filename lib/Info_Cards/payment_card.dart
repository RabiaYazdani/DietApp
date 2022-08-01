import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_color.dart';
import '../constants.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.57,
      width: mediaQuery.width * 0.65,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            height: mediaQuery.height * 0.2,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: AppColor.blackShade),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Premium',
                  style: TextStyle(
                      fontSize: 32,
                      color: AppColor.white,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Monthly/5\$',
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.white,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                      4,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  radius: 4,
                                  backgroundColor: AppColor.blackShade,
                                ),
                                width(20),
                                const Text('Lorem ipsum dolor sit amet')
                              ],
                            ),
                          )),
                  Spacer(),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: elevatedButtonStyle(AppColor.red, AppColor.white),
                      child: const Text('Buy'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
