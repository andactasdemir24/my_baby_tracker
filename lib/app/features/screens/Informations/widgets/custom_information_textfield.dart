// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:baby_tracker_app/app/core/constants/color_constants.dart';

import '../../../../core/constants/mediaquery_constants.dart';

class CustomInformationTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? textInputType;
  final Function()? onTap;
  final String? hintText;
  final Function(String)? onChanged;
  final Icon? icon;
  final bool? readOnly;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;

  const CustomInformationTextField({
    Key? key,
    required this.controller,
    this.textInputType,
    this.onTap,
    this.hintText,
    this.onChanged,
    this.icon,
    this.readOnly,
    this.textStyle,
    this.hintStyle,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.06, vertical: displayHeight(context) * 0.015),
        child: TextField(
          inputFormatters: inputFormatters,
          readOnly: readOnly ?? false,
          keyboardType: textInputType,
          onTap: onTap,
          onChanged: onChanged,
          style: textStyle,
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: icon,
              prefixIconColor: sympListShadow,
              filled: true,
              fillColor: annualColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: hintText,
              hintStyle: hintStyle),
        ),
      ),
    );
  }
}