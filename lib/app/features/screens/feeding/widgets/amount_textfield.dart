// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';
import 'package:flutter/services.dart';

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
        padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.06),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(height: displayHeight(context) * 0.08),
          child: TextField(
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{1,10}$'))],
            keyboardType: TextInputType.number,
            onChanged: (value) {
              feedingViewmodel.changeVisible();
            },
            style: const TextStyle(fontWeight: FontWeight.bold),
            controller: controller,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    bottom: displayHeight(context) * 0.04, top: displayHeight(context) * 0.02, left: 10.0),
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
      ),
    );
  }
}
