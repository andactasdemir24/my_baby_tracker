// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:flutter/material.dart';

import '../../../features/screens/feeding/viewmodel/feeding_viewmodel.dart';
import '../../constants/mediaquery_constants.dart';
import '../../getIt/locator.dart';

class AmountTextField extends StatelessWidget {
  final TextEditingController controller;

  const AmountTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feedingViewmodel = locator.get<FeedingViewModel>();

    return Center(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.06, vertical: displayHeight(context) * 0.02),
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            feedingViewmodel.changeVisible();
          },
          style: const TextStyle(fontWeight: FontWeight.bold),
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: annualColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: amount,
              hintStyle: const TextStyle(color: settingsIndex)),
        ),
      ),
    );
  }
}
