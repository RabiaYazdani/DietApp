import 'dart:async';
import 'package:flutter/material.dart';

import '../Widgets/buttoni_font_widget.dart';
import '../app_color.dart';
import '../constants.dart';
import 'drawer_screen.dart';

class BiteScreen extends StatefulWidget {
  const BiteScreen({Key? key}) : super(key: key);

  @override
  State<BiteScreen> createState() => _BiteScreenState();
}

class _BiteScreenState extends State<BiteScreen> {
  int _maxSeconds = 60;
  int _currentSecond = 0;
  Timer? _timer;
  int burp = 0;
  String get _timerText {
    const secondsPerMinute = 60;
    final secondsLeft = _maxSeconds - _currentSecond;

    final formattedMinutesLeft =
        (secondsLeft ~/ secondsPerMinute).toString().padLeft(2, '0');
    final formattedSecondsLeft =
        (secondsLeft % secondsPerMinute).toString().padLeft(2, '0');
    return '$formattedMinutesLeft : $formattedSecondsLeft';
  }

  void _startTimer() {
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      setState(() {
        _currentSecond = timer.tick;
        if (timer.tick >= _maxSeconds) {
          timer.cancel();
          setState(() {
            eating = false;
            _resetTimer();
          });
        }
      });
    });
  }

  _resetTimer() {
    _maxSeconds = 60;
    _currentSecond = 0;
    burp = 0;
  }

  bool eating = false;
  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  String status(int burp) {
    switch (burp) {
      case 0:
        return "Enjoy your meal";
      case 1:
        return "Check if you are feeling full";
      case 2:
        return "If you are full, You can take a break";
      default:
        return "You need a break";
    }
  }

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: scaffoldState,
        drawer: const DrawerView(),
        body: Stack(
          children: [
            backgroundImage(mediaQuery),
            Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        scaffoldState.currentState?.openDrawer();
                      });
                    },
                    icon: const Icon(Icons.menu, size: 40)),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    height(140),
                    Center(
                        child: ButtoniText(
                            size: 40,
                            text: status(burp),
                            color: AppColor.blackShade)),
                    height(50),
                    const LabelCards(),
                    height(20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_timerText,
                              style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.blackShade)),
                          Text('$burp',
                              style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.blackShade))
                        ]),
                    height(40),
                    GestureDetector(
                        onTap: eating
                            ? null
                            : () {
                                setState(() {
                                  _startTimer();
                                  eating = true;
                                  _resetTimer();
                                });
                              },
                        child: SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Take a bite',
                                  style: eating
                                      ? yellowText.copyWith(
                                          fontSize: 20,
                                          color: AppColor.colorCode3
                                              .withOpacity(0.5))
                                      : yellowText.copyWith(fontSize: 20),
                                )),
                          ),
                        )),
                    height(20),
                    GestureDetector(
                      onTap: () {
                        if (eating == false) {
                          return;
                        }
                        setState(() {
                          burp++;
                        });
                      },
                      child: const ActionCardWidget(
                          actionWidgetLabel: 'I had a burp'),
                    ),
                    height(20),
                    GestureDetector(
                      onTap: () {
                        if (eating == false) {
                          return;
                        }
                        setState(() {
                          _timer!.cancel();
                          eating = false;
                        });
                      },
                      child: const ActionCardWidget(
                          actionWidgetLabel: 'Finish Eating'),
                    ),
                    height(20),
                    GestureDetector(
                      onTap: () {},
                      child: const ActionCardWidget(
                          actionWidgetLabel: 'Party in 02:00:00 days'),
                    ),
                    height(20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget backgroundImage(mediaQuery) {
    return Container(
        height: mediaQuery.height,
        width: mediaQuery.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back3.png'),
          ),
        ));
  }
}

class ActionCardWidget extends StatelessWidget {
  const ActionCardWidget({Key? key, required this.actionWidgetLabel})
      : super(key: key);
  final String actionWidgetLabel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              actionWidgetLabel,
              style: yellowText.copyWith(fontSize: 20),
            )),
      ),
    );
  }
}

class LabelCards extends StatelessWidget {
  const LabelCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Next Bite', style: yellowText),
          Text('Burps', style: yellowText),
        ],
      ),
    );
  }
}
