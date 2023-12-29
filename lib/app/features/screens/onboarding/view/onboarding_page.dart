import 'package:baby_tracker_app/app/features/screens/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:baby_tracker_app/app/features/screens/onboarding/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import '../../../../core/getIt/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onbViewmodel = locator.get<OnboardingViewmodel>();
    return Scaffold(body: Observer(builder: (_) {
      return PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: onbViewmodel.controller,
        itemCount: onbViewmodel.onbList.length,
        onPageChanged: (value) {
          onbViewmodel.changeIndex(value);
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned(top: 10, left: 0, right: 0, child: Image.asset(onbViewmodel.onbList[index].image)),
              CustomContainer(text: onbViewmodel.onbList[index].title, text2: onbViewmodel.onbList[index].description),
            ],
          );
        },
      );
    }));
  }
}
