// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';

class CustomNoDataWidget extends StatelessWidget {
  const CustomNoDataWidget({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 120.h),
        SizedBox(
          width: displayWidth(context) * 0.7,
          child: Text(
            text,
            style: TextStyle(color: shade500, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ));
  }
}
