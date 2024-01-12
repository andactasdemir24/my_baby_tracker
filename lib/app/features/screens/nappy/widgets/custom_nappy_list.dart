import 'package:baby_tracker_app/app/features/model/nappy_model_f.dart';
import 'package:baby_tracker_app/app/features/screens/nappy/viewmodel/nappy_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';

class CustomNappyListContainer extends StatefulWidget {
  const CustomNappyListContainer({
    Key? key,
    required this.nappyViewmodel,
    required this.nappy,
  }) : super(key: key);

  final NappyViewModel nappyViewmodel;
  final NappyModel nappy;

  @override
  State<CustomNappyListContainer> createState() => _CustomNappyListContainerState();
}

class _CustomNappyListContainerState extends State<CustomNappyListContainer> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            widget.nappyViewmodel.toggleSelectedIndex(widget.nappy);
            widget.nappyViewmodel.changeVisibleNappy();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: annualColor,
              border: Border.all(
                color: widget.nappyViewmodel.selectedIndicess.contains(widget.nappy) ? sympListShadow : ctransparent,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Image.asset(
                    widget.nappy.image!,
                    height: displayHeight(context) * 0.115,
                  ),
                  SizedBox(height: displayHeight(context) * 0.02),
                  Text(
                    widget.nappy.name!,
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
