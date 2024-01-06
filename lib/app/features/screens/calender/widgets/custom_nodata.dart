import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNoDataWidget extends StatelessWidget {
  const CustomNoDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(noDataImage, height: 120.h),
        Text(
          noDataText,
          style: TextStyle(color: shade500, fontWeight: FontWeight.bold),
        )
      ],
    ));
  }
}
