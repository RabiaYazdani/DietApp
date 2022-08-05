import 'package:flutter/material.dart';

import '../Model/status_bar_model.dart';
import '../app_color.dart';
import 'custom_divider_widget.dart';

class DailyReportWidget extends StatelessWidget {
  const DailyReportWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width * 0.126;
    final Map<String, bool> data = DataModel.dailyUpdates;
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
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40)),
                          color: data["mon"] == true
                              ? AppColor.colorCode1
                              : Colors.white),
                    ),
                    Container(
                        width: width,
                        color: data["tues"] == true
                            ? AppColor.colorCode2
                            : Colors.white),
                    Container(
                        width: width,
                        color: data["wed"] == true
                            ? AppColor.colorCode3
                            : Colors.white),
                    Container(
                        width: width,
                        color: data["thur"] == true
                            ? AppColor.colorCode4
                            : Colors.white),
                    Container(
                        width: width,
                        color: data["fri"] == true
                            ? AppColor.colorCode5
                            : Colors.white),
                    Container(
                        width: width,
                        color: data["sat"] == true
                            ? AppColor.colorCode6
                            : Colors.white),
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                          color: data["sun"] == true
                              ? AppColor.colorCode7
                              : Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: mediaQuery.width * 0.11),
                      child: const CustomDivider(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQuery.width * 0.1),
                      child: const CustomDivider(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQuery.width * 0.09),
                      child: const CustomDivider(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQuery.width * 0.08),
                      child: const CustomDivider(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQuery.width * 0.084),
                      child: const CustomDivider(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQuery.width * 0.084),
                      child: const CustomDivider(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Mon'),
                    const Text('Tues'),
                    const Text('Wed'),
                    const Text('Thur'),
                    const Text('Fri'),
                    const Text('Sat'),
                    const Text('Sun'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
