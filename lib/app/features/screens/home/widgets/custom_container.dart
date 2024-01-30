import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final String image;
  const CustomImageContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: displayWidth(context) * 0.05,
        vertical: displayHeight(context) * 0.007,
      ),
      child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(25),
          child: SizedBox(width: double.infinity, child: Image.asset(image, fit: BoxFit.cover))),
    );
  }
}
