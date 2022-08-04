import 'package:flutter/material.dart';

import '../Widgets/custom_navbar.dart';
import 'drawer_screen.dart';

import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
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
                  top: 50,
                  left: 60,
                  child: SizedBox(
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
                    icon: const Icon(Icons.menu, size: 40))
              ],
            ),
            const Spacer(),
          ],
        ),
        bottomSheet: const CustomNavigationBar(),
      ),
    );
  }
}
