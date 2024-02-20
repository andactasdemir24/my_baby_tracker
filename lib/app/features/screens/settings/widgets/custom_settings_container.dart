// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:baby_tracker_app/app/app.dart';

class CustomSettingsContainer extends StatelessWidget {
  final String text;
  final String image;
  final Function()? onTap;

  const CustomSettingsContainer({
    Key? key,
    required this.text,
    required this.image,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: displayWidth(context) * 0.055,
        vertical: displayHeight(context) * 0.01,
      ),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: displayHeight(context) * 0.08,
            width: displayWidth(context) * 0.9,
            decoration: ShapeDecoration(
              color: ColorConst.annualColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        image,
                        height: displayHeight(context) * 0.1.spMin,
                      ),
                      Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.spMin))
                    ],
                  ),
                  Icon(
                    Baby.left,
                    color: ColorConst.settingsIndex,
                    size: 25.spMin,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
