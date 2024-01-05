import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../Informations/viewmodel/information_viewmodel.dart';

class CustomEditButton extends StatelessWidget {
  const CustomEditButton({
    super.key,
    required this.informationviewmodel,
  });

  final InformationViewModel informationviewmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            informationviewmodel.isEditControl();
          },
          child: const Text(
            edit,
            style: TextStyle(color: buttonColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
