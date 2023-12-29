import 'package:baby_tracker_app/app/features/model/symptomps_model_f.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../viewmodel/symptomps_viewmodel.dart';

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
              color: annualColor,
              border: Border.all(
                color:
                    widget.symptompsViewmodel.selectedIndices.contains(widget.symptomp) ? sympListShadow : ctransparent,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Image.asset(
                    widget.symptomp.image!,
                    height: displayHeight(context) * 0.115,
                  ),
                  SizedBox(height: displayHeight(context) * 0.02),
                  Text(
                    widget.symptomp.name!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
