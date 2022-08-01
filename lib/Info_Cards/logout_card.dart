import 'package:flutter/material.dart';

import '../app_color.dart';
import '../constants.dart';

class LogoutCard extends StatelessWidget {
  const LogoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.4,
      width: mediaQuery.width * 0.65,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.logout, color: AppColor.colorCode3, size: 70),
          height(10),
          const Text('Delete Account?',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.colorCode3)),
          height(10),
          Text('Are you sure you want to log out ?',
              textAlign: TextAlign.center,
              style: blackFont500.copyWith(fontSize: 12)),
          height(15),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.colorCode3, width: 1),
            ),
            child: TextButton(
                onPressed: () {
                  //todo: Functionality to delete an account goes here.
                },
                child: const Text(
                  'Log 0ut',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.colorCode3),
                )),
          ),
          height(15),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: elevatedButtonStyle(AppColor.blackShade, AppColor.white),
              child: const Text('Cancel'),
            ),
          ),
        ],
      ),
    );
  }
}
