// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      padding: EdgeInsets.symmetric(horizontal: displayHeight(context) * 0.02, vertical: displayWidth(context) * 0.02),
      child: Image.asset(image),
    );
  }
}
