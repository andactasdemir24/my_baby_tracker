import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

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
