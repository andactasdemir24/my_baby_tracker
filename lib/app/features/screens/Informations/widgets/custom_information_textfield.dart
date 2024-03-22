// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:baby_tracker_app/app/app.dart';

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
  final Text? labelText;

  const CustomInformationTextField({
    super.key,
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
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.06, vertical: displayHeight(context) * 0.01),
      child: TextField(
        inputFormatters: inputFormatters,
        readOnly: readOnly ?? false,
        keyboardType: textInputType,
        onTap: onTap,
        onChanged: onChanged,
        style: textStyle,
        controller: controller,
        decoration: InputDecoration(
            label: labelText,
            prefixIcon: icon,
            prefixIconColor: ColorConst.sympListShadow,
            filled: true,
            fillColor: ColorConst.annualColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: hintStyle),
      ),
    );
  }
}
