import 'package:diet_app/Widgets/report_card_widget.dart';
import 'package:diet_app/Widgets/buttoni_font_widget.dart';
import 'package:diet_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/delete&logout_card_widget.dart';
import '../Widgets/logout_card_widget.dart';
import '../app_color.dart';

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
            DrawerActionCards(
              label: "Delete Account",
              icon: Icons.delete_outlined,
              action: () {
                showDialog(
                    context: context,
                    builder: (ctx) => const AlertDialog(
                          content: DeleteAndLogoutCard(),
                        ));
              },
            ),
            const Spacer(),
            const Divider(thickness: 2, color: AppColor.white),
            height(10),
            DrawerActionCards(
              label: "Log Out",
              icon: Icons.logout,
              action: () {
                showDialog(
                    context: context,
                    builder: (ctx) => const AlertDialog(
                          content: LogoutCard(),
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
      children: [
        Icon(icon),
        width(13),
        TextButton(
            onPressed: () {
              print('function Called');
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
