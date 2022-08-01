import 'package:flutter/material.dart';

import '../app_color.dart';
import '../constants.dart';

class TipsAndErrorCard extends StatelessWidget {
  const TipsAndErrorCard(
      {Key? key,
      required this.label,
      required this.imageUrl,
      required this.information})
      : super(key: key);
  final String imageUrl;
  final List<String> information;
  final String label;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.47,
      width: mediaQuery.width * 0.65,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(
              height: mediaQuery.height * 0.13,
              width: mediaQuery.width * 0.2,
              child: Image.asset(
                "assets/images/$imageUrl.png",
                fit: BoxFit.fill,
              )),
          Text(label,
              style: const TextStyle(
                  color: AppColor.colorCode3,
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
          height(10),
          ...List.generate(
              information.length,
              (index) => Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 8, bottom: 14, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 4,
                          backgroundColor: AppColor.colorCode3,
                        ),
                        width(10),
                        Expanded(
                          child: Text(
                            information[index],
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  ))
        ],
      ),
    );
  }
}
