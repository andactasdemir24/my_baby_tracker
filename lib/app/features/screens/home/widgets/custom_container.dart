import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Ekran boyutlarına göre ölçekleme için

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
        horizontal: 15.w,
        vertical: 5.h,
      ),
      child: SizedBox(width: double.infinity, child: Image.asset(image, fit: BoxFit.cover)),
    );
  }
}
