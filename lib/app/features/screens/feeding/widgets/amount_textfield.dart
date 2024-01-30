// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';

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
              fillColor: ColorConst.annualColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: AppLocalizations.of(context)!.amount,
              hintStyle: TextStyle(color: ColorConst.settingsIndex)),
        ),
      ),
    );
  }
}
