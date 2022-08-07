import 'package:diet_app/Model/status_bar_model.dart';
import 'package:flutter/material.dart';

import '../app_color.dart';
import 'custom_divider_widget.dart';

class WeeklyReport extends StatelessWidget {
  const WeeklyReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final Map<String, bool> data = DataModel.weeklyUpdates;
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
                      width: mediaQuery.width * 0.22,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40)),
                          color: data["breakfast"] == true
                              ? AppColor.colorCode4
                              : Colors.white),
                    ),
                    Container(
                        width: mediaQuery.width * 0.24,
                        color: data["lunch"] == true
                            ? AppColor.colorCode4
                            : Colors.white),
                    Container(
                        width: mediaQuery.width * 0.14,
                        color: data["snack"] == true
                            ? AppColor.colorCode4
                            : Colors.white),
                    Container(
                      width: mediaQuery.width * 0.281,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                          color: data["dinner"] == true
                              ? AppColor.colorCode4
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
                      padding: EdgeInsets.only(left: mediaQuery.width * 0.21),
                      child: const CustomDivider(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQuery.width * 0.20),
                      child: const CustomDivider(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQuery.width * 0.1),
                      child: const CustomDivider(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: mediaQuery.width * 0.05),
                        child: const Text('Breakfast')),
                    Padding(
                        padding: EdgeInsets.only(left: mediaQuery.width * 0.1),
                        child: const Text('Lunch')),
                    Padding(
                        padding: EdgeInsets.only(left: mediaQuery.width * 0.1),
                        child: const Text('Snack')),
                    Padding(
                        padding: EdgeInsets.only(left: mediaQuery.width * 0.1),
                        child: const Text('Dinner')),
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
