import 'package:flutter/material.dart';

import 'drawer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            )
          ],
        ),
      ),
    );
  }
}
