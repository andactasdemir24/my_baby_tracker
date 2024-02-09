import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomSymptompsListContainer extends StatefulWidget {
  const CustomSymptompsListContainer({
    Key? key,
    required this.symptompsViewmodel,
    required this.symptomp,
  }) : super(key: key);

  final SymptompsViewmodel symptompsViewmodel;
  final SymptopmsModel symptomp;

  @override
  State<CustomSymptompsListContainer> createState() => _CustomSymptompsListContainerState();
}

class _CustomSymptompsListContainerState extends State<CustomSymptompsListContainer> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            widget.symptompsViewmodel.toggleSelectedIndex(widget.symptomp);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: ColorConst.annualColor,
              border: Border.all(
                color: widget.symptompsViewmodel.selectedIndices.contains(widget.symptomp)
                    ? ColorConst.sympListShadow
                    : ColorConst.ctransparent,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(widget.symptomp.image!, height: 75.spMin),
                SizedBox(height: displayHeight(context) * 0.02),
                Text(
                  widget.symptomp.name!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.spMin),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
