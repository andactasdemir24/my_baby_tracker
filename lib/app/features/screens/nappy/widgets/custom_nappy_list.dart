import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:baby_tracker_app/app/app.dart';

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
              borderRadius: BorderRadius.circular(25.r),
              color: ColorConst.annualColor,
              border: Border.all(
                color: widget.nappyViewmodel.selectedIndicess.contains(widget.nappy)
                    ? ColorConst.sympListShadow
                    : ColorConst.ctransparent,
                width: 2.w,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: displayHeight(context) * 0.01),
              child: Column(
                children: [
                  Image.asset(
                    widget.nappy.image!,
                    height: displayHeight(context) * 0.11,
                  ),
                  SizedBox(height: displayHeight(context) * 0.01),
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
