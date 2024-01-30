import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomEditButton extends StatelessWidget {
  const CustomEditButton({
    super.key,
    required this.informationviewmodel,
  });

  final InformationViewModel informationviewmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: displayWidth(context) * 0.05),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            informationviewmodel.isEditControl();
          },
          child: Text(
            AppLocalizations.of(context)!.edit,
            style: TextStyle(color: ColorConst.buttonColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
