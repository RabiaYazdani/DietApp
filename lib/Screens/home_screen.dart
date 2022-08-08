import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
//Widget Imports
import '../Widgets/custom_navbar.dart';
import '../Widgets/safe_to_eat_widget.dart';
import '../app_color.dart';
import 'drawer_screen.dart';
import '../Widgets/daily_update_widget.dart';
import '../Widgets/weekly_report.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int hours = 5;
  int minutes = 23;
  double width = 0.70;
  bool processing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    if (widget.imagePath != "") {
      Future.delayed(
          const Duration(seconds: 1), () => showPaymentCard(context));
    }
    if (widget.imagePath == "") {
      Future.delayed(const Duration(seconds: 1), () => showTips(context));
    }
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        drawer: const DrawerView(),
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: widget.imagePath != ""
                      ? Image.file(File(widget.imagePath), fit: BoxFit.fill)
                      : Image.asset('assets/images/foodImage.png',
                          fit: BoxFit.fill),
                ),
                Positioned(
                  top: mediaQuery.height * 0.07,
                  left: mediaQuery.width * 0.15,
                  child: Center(
                    child: SizedBox(
                      height: mediaQuery.height * 0.3,
                      width: mediaQuery.width * 0.7,
                      child: Image.asset(
                        'assets/images/border.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      scaffoldState.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu, size: 40))
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: ListView(
                  children: [
                    FastingCardUpdate(hours: hours, minutes: minutes),
                    height(10),
                    Text('SAFE TO EAT',
                        style: blackFont500.copyWith(fontSize: 15)),
                    height(10),
                    if (processing)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    SafeToEat(width: width),
                    Text('WEEKLY RECORD',
                        style: blackFont500.copyWith(fontSize: 15)),
                    height(10),
                    WeeklyReport(),
                    Text('DAILY RECORD',
                        style: blackFont500.copyWith(fontSize: 15)),
                    height(10),
                    DailyReportWidget(),
                    height(50),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomSheet: const CustomNavigationBar(),
      ),
    );
  }
}

class FastingCardUpdate extends StatelessWidget {
  const FastingCardUpdate({
    Key? key,
    required this.hours,
    required this.minutes,
  }) : super(key: key);

  final int hours;
  final int minutes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('You have been fasting',
            style: blackFont500.copyWith(fontSize: 14)),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('for ', style: blackFont500.copyWith(fontSize: 14)),
              Text(
                '$hours',
                style: const TextStyle(
                    color: AppColor.colorCode3,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Text(' hours ', style: blackFont500.copyWith(fontSize: 14)),
              Text(
                '$minutes',
                style: const TextStyle(
                    color: AppColor.colorCode3,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Text(' minutes ', style: blackFont500.copyWith(fontSize: 14)),
            ],
          ),
        )
      ],
    );
  }
}
