import 'package:flutter/material.dart';

import '../constants.dart';

class TextActionCard extends StatelessWidget {
  const TextActionCard(
      {Key? key,
      required this.labelText,
      required this.action,
      required this.actionText,
      required this.style})
      : super(key: key);

  final TextStyle style;
  final String labelText;
  final String actionText;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(labelText, style: blackFont500),
        width(2),
        GestureDetector(
          onTap: () => action(),
          child: Text(actionText, style: style),
        ),
      ],
    );
  }
}
