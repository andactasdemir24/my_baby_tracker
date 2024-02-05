import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentIndexContainer extends StatelessWidget {
  const CurrentIndexContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final onbViewmodel = locator.get<OnboardingViewmodel>();
    return Observer(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onbViewmodel.onbList.length,
            (index) => Container(
              height: displayHeight(context) * 0.0075,
              width: onbViewmodel.currentIndex == index ? displayWidth(context) * 0.08 : displayWidth(context) * 0.02,
              margin: EdgeInsets.only(right: displayWidth(context) * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: onbViewmodel.currentIndex == index ? ColorConst.buttonColor : ColorConst.cgrey,
              ),
            ),
          ),
        );
      },
    );
  }
}
