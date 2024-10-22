import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomGenderListContainer extends StatefulWidget {
  const CustomGenderListContainer({
    super.key,
    required this.informationViewModel,
    required this.gender,
  });

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
              color: ColorConst.annualColor,
              border: Border.all(
                color: widget.informationViewModel.selectedIndices.contains(widget.gender)
                    ? ColorConst.sympListShadow
                    : ColorConst.ctransparent,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.gender.image!,
                  height: displayHeight(context) * 0.05,
                  width: displayWidth(context) * 0.08,
                ),
                Text(
                  '${widget.gender.name!} *',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.spMin),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
