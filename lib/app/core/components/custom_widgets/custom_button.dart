import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomButton extends StatelessWidget {
  final Text text;
  final Function() onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorConst.getPremiumTextColor,
            fixedSize: Size(displayWidth(context) * 0.9, displayHeight(context) * 0.07),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        onPressed: onPressed,
        child: text);
  }
}
