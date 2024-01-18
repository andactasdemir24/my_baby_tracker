import 'package:baby_tracker_app/app/features/screens/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/getIt/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_onb_image.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onbViewmodel = locator.get<OnboardingViewmodel>();
    return Scaffold(
        appBar: AppBar(toolbarHeight: 0, backgroundColor: bg),
        backgroundColor: bg,
        body: Observer(builder: (_) {
          return PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: onbViewmodel.controller,
            itemCount: onbViewmodel.onbList.length,
            onPageChanged: (value) {
              onbViewmodel.changeIndex(value);
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(height: displayHeight(context) * 0.01),
                  CustomOnbImage(
                      onbViewmodel: onbViewmodel,
                      image: DecorationImage(image: AssetImage(onbViewmodel.onbList[index].image), fit: BoxFit.fill)),
                  CustomContainer(
                      text: onbViewmodel.onbList[index].title, text2: onbViewmodel.onbList[index].description),
                ],
              );
            },
          );
        }));
  }
}
