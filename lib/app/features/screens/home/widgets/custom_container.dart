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
      padding: EdgeInsets.symmetric(vertical: displayHeight(context) * 0.007, horizontal: 20),
      child: SizedBox(
          width: displayWidth(context),
          child: Image.asset(
            image,
            fit: BoxFit.fill,
            height: displayHeight(context) * 0.07,
          )),
    );
  }
}
