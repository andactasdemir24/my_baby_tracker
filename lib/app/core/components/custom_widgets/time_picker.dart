// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';
import '../../constants/mediaquery_constants.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: displayWidth(context) * 0.8878,
        height: displayHeight(context) * 0.082,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: annualColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.04),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(text,
                style: TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.bold,
                  color: color,
                )),
          ),
        ),
      ),
    );
  }
}
