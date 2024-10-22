import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomPicker extends StatelessWidget {
  const CustomPicker({
    super.key,
    required this.informationviewmodel,
  });

  final InformationViewModel informationviewmodel;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
          onTap: () {
            informationviewmodel.pickImageFromGalery();
          },
          child: ClipRRect(
            child: informationviewmodel.selectedImage != null
                ? CircleAvatar(
                    maxRadius: 70.r,
                    backgroundImage: FileImage(informationviewmodel.selectedImage!),
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(width: 2, color: ColorConst.borderSideColor),
                        ),
                      ),
                    ),
                  )
                : Image.asset(ImagesConst.picker, height: displayHeight(context) * 0.2),
          ));
    });
  }
}
