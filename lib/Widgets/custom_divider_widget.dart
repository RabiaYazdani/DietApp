import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 55,
          child: VerticalDivider(
            thickness: 2,
            color: Color(0xff787878),
          ),
        ),
        SizedBox(height: 2),
        CircleAvatar(
          radius: 4,
          backgroundColor: Color(0xff787878),
        ),
      ],
    );
  }
}
