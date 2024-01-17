// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:baby_tracker_app/app/features/screens/vaccine/viewmodel/vaccine_viewmodel.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    Key? key,
    required this.vaccineViewModel,
    required this.text,
    this.color,
  }) : super(key: key);

  final VaccineViewModel vaccineViewModel;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: annualColor,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
          ),
          hint: Text(text, style: TextStyle(color: color)),
          value: vaccineViewModel.dropdownValue,
          padding: EdgeInsets.only(
              left: displayWidth(context) * 0.06,
              right: displayWidth(context) * 0.06,
              bottom: displayHeight(context) * 0.015),
          onChanged: (String? newValue) {
            vaccineViewModel.vaccineController.text = newValue!;
            vaccineViewModel.changeVisible();
          },
          items: vaccineViewModel.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}
