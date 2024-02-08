// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomTimePicker extends StatelessWidget {
  final String text;
  final Color color;
  const CustomTimePicker({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.88,
      height: displayHeight(context) * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ColorConst.annualColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              )),
        ),
      ),
    );
  }
}
