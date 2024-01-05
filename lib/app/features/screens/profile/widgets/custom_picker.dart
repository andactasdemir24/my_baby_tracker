import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../Informations/viewmodel/information_viewmodel.dart';

class CustomPicker extends StatelessWidget {
  const CustomPicker({
    super.key,
    required this.informationviewmodel,
  });

  final InformationViewModel informationviewmodel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          informationviewmodel.pickImageFromGalery();
        },
        child: ClipRRect(
          child: informationviewmodel.selectedImage != null
              ? CircleAvatar(
                  maxRadius: 75.r,
                  backgroundImage: FileImage(informationviewmodel.selectedImage!),
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 2.w, color: mainIconColor),
                      ),
                    ),
                  ),
                )
              : Image.asset(picker, height: displayHeight(context) * 0.2),
        ));
  }
}
