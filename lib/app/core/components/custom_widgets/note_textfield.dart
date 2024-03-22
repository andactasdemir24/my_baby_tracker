// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomNoteTextfield extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  const CustomNoteTextfield({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.06),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(fontWeight: FontWeight.bold),
        maxLines: 8,
        maxLength: 60,
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: ColorConst.annualColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
            hintText: AppLocalizations.of(context)!.note,
            hintStyle: TextStyle(color: ColorConst.settingsIndex)),
      ),
    );
  }
}
