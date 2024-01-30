import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CurrentIndexContainer extends StatelessWidget {
  const CurrentIndexContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final onbViewmodel = locator.get<OnboardingViewmodel>();
    return Observer(
      builder: (context) {
        return SizedBox(
          height: displayHeight(context) * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onbViewmodel.onbList.length,
              (index) => Container(
                height: 5,
                width: onbViewmodel.currentIndex == index ? 30 : 5,
                margin: const EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: onbViewmodel.currentIndex == index ? ColorConst.buttonColor : ColorConst.cgrey,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
