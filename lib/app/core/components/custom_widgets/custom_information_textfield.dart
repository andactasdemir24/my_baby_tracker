// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import '../../constants/mediaquery_constants.dart';

class CustomInformationTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final Function()? onTap;
  final String? hintText;

  const CustomInformationTextField({
    Key? key,
    required this.controller,
    this.textInputType,
    this.onTap,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.06, vertical: displayHeight(context) * 0.015),
        child: TextField(
          keyboardType: textInputType,
          onTap: onTap,
          style: const TextStyle(fontWeight: FontWeight.bold),
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: annualColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: settingsIndex)),
        ),
      ),
    );
  }
}
