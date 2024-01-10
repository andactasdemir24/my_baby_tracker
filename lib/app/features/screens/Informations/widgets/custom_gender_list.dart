import 'package:baby_tracker_app/app/features/model/information_gender_model_f.dart';
import 'package:baby_tracker_app/app/features/screens/Informations/viewmodel/information_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';

class CustomGenderListContainer extends StatefulWidget {
  const CustomGenderListContainer({
    Key? key,
    required this.informationViewModel,
    required this.gender,
  }) : super(key: key);

  final InformationViewModel informationViewModel;
  final InformationGender gender;

  @override
  State<CustomGenderListContainer> createState() => _CustomGenderListContainerState();
}

class _CustomGenderListContainerState extends State<CustomGenderListContainer> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            widget.informationViewModel.toggleSelectedIndex(widget.gender);
            widget.informationViewModel.changeVisible();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: annualColor,
              border: Border.all(
                color:
                    widget.informationViewModel.selectedIndices.contains(widget.gender) ? sympListShadow : ctransparent,
                width: 2.w,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.gender.image!,
                  height: displayHeight(context) * 0.05,
                ),
                Text(
                  widget.gender.name!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
