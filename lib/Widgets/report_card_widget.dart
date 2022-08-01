import 'package:flutter/material.dart';

import '../app_color.dart';
import '../constants.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.57,
      width: mediaQuery.width * 0.65,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Report A Problem',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColor.red,
            ),
          ),
          height(3),
          Text(
            'Describe the problem that you are facing',
            style: blackFont500.copyWith(fontSize: 12),
          ),
          height(10),
          Container(
              padding: const EdgeInsets.all(10),
              color: AppColor.lightGrey,
              child: TextField(
                maxLines: 8,
                maxLength: 500,
                decoration: InputDecoration.collapsed(
                    hintText: 'Type a message',
                    hintStyle: blackFont500.copyWith(
                        fontSize: 12, color: AppColor.greyShade2)),
              )),
          height(20),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                //todo: Message Sending functionality goes here.
              },
              style: elevatedButtonStyle(AppColor.red, AppColor.white),
              child: const Text('Send'),
            ),
          ),
          height(10),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.black, width: 1),
            ),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.black),
                )),
          ),
        ],
      ),
    );
  }
}
