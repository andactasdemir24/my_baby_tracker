// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import '../../constants/color_constants.dart';
import '../../constants/mediaquery_constants.dart';

class CustomNoteTextfield extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  const CustomNoteTextfield({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.06),
        child: TextField(
          onChanged: onChanged,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 8,
          maxLength: 60,
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: annualColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: note,
              hintStyle: const TextStyle(color: settingsIndex)),
        ),
      ),
    );
  }
}
