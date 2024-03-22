// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:baby_tracker_app/app/app.dart';

class CustomImageContainer extends StatelessWidget {
  final IconData icons;
  final Color containerColor;
  final String text;
  const CustomImageContainer({
    super.key,
    required this.icons,
    required this.containerColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: displayHeight(context) * 0.007, horizontal: 20),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: displayHeight(context) * 0.075,
          decoration: ShapeDecoration(
            color: containerColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icons, color: ColorConst.cwhite, size: 46.spMin),
                const SizedBox(width: 5),
                Text(text, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22.spMin, color: ColorConst.cwhite)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
