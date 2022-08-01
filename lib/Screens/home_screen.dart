import 'package:flutter/material.dart';

import '../Info_Cards/payment_card.dart';
import '../app_color.dart';
import 'drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool food = false;
  bool cam = false;
  bool social = false;
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        drawer: DrawerView(),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset('assets/images/foodImage.png',
                      fit: BoxFit.fill),
                ),
                Positioned(
                  top: 50,
                  left: 60,
                  child: Container(
                    height: 200,
                    width: 300,
                    child: Image.asset(
                      'assets/images/border.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      scaffoldState.currentState?.openDrawer();
                    },
                    icon: Icon(Icons.menu))
              ],
            ),
            const Spacer(),
          ],
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: food ? AppColor.colorCode3 : AppColor.white),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        food = !food;
                        cam = false;
                        social = false;
                      });
                    },
                    icon: food
                        ? Image.asset('assets/images/eat_selected.png')
                        : Image.asset('assets/images/eat.png'),
                    iconSize: 30,
                  )),
              Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: cam ? AppColor.colorCode3 : AppColor.white),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        cam = !cam;
                        food = false;
                        social = false;
                      });
                    },
                    icon: cam
                        ? Image.asset('assets/images/cam_selected.png')
                        : Image.asset('assets/images/cam.png'),
                    iconSize: 30,
                  )),
              Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: social ? AppColor.colorCode3 : AppColor.white),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        social = !social;
                        food = false;
                        cam = false;
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  contentPadding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  content: const PaymentCard(),
                                ));
                      });
                    },
                    icon: social
                        ? Image.asset('assets/images/social_selected.png')
                        : Image.asset('assets/images/social.png'),
                    iconSize: 30,
                  )),
              // SizedBox(
              //     height: 30,
              //     width: 30,
              //     child: Image.asset('assets/images/cam.png')),
              // SizedBox(
              //     height: 30,
              //     width: 30,
              //     child: Image.asset('assets/images/social.png')),
            ],
          ),
        ),
      ),
    );
  }
}
