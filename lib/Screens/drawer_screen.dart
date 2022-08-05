import 'package:flutter/material.dart';

import '../Info_Cards/delete_card.dart';
import '../Info_Cards/logout_card.dart';
import '../Info_Cards/payment_card.dart';
import '../Info_Cards/tips_error_card.dart';
import '../app_color.dart';
import '../Info_Cards/report_card.dart';
import '../Widgets/buttoni_font_widget.dart';
import '../constants.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      backgroundColor: AppColor.colorCode3,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 10),
        child: Column(
          children: [
            const ButtoniText(
                size: 36, color: AppColor.lightBlack, text: 'Diet App'),
            height(20),
            const Divider(thickness: 2, color: AppColor.white),
            height(10),
            DrawerActionCards(
              label: "Report A Problem",
              icon: Icons.info_outlined,
              action: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          content: const ReportCard(),
                        ));
              },
            ),
            height(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    'assets/images/delete.png',
                    color: AppColor.black,
                  ),
                ),
                width(10),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                content: const DeleteCard(),
                              ));
                    },
                    child: const Text(
                      "Delete Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            content: TipsAndErrorCard(
                              label: 'Error',
                              imageUrl: 'info',
                              information: tips,
                            ),
                          ));
                },
                child: const Text('error_card')),
            const Divider(thickness: 2, color: AppColor.white),
            height(10),
            DrawerActionCards(
              label: "Log Out",
              icon: Icons.logout,
              action: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          content: const LogoutCard(),
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerActionCards extends StatelessWidget {
  const DrawerActionCards(
      {Key? key, required this.label, required this.icon, required this.action})
      : super(key: key);
  final IconData icon;
  final String label;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        width(13),
        TextButton(
            onPressed: () {
              action();
            },
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ))
      ],
    );
  }
}
