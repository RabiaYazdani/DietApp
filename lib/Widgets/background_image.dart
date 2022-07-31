import 'package:flutter/material.dart';

class ContainerBackgroundDesign extends StatelessWidget {
  const ContainerBackgroundDesign({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          height: heightMediaQuery,
          width: widthMediaQuery,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Stack(
            children: [
              Image.asset('assets/images/back1.png'),
              Positioned(
                  top: heightMediaQuery * 0.25,
                  child: Image.asset('assets/images/back1.png')),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
