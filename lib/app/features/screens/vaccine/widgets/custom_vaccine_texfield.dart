// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomVaccineTextField extends StatelessWidget {
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

  const CustomVaccineTextField({
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.06),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: displayHeight(context) * 0.08),
        child: TextField(
          inputFormatters: inputFormatters,
          readOnly: readOnly ?? false,
          keyboardType: textInputType,
          onTap: onTap,
          onChanged: onChanged,
          style: textStyle,
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  bottom: displayHeight(context) * 0.04, top: displayHeight(context) * 0.02, left: 10.0),
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
      ),
    );
  }
}
