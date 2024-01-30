import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final String text2;
  const CustomContainer({
    Key? key,
    required this.text,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onbViewmodel = locator.get<OnboardingViewmodel>();
    return Observer(
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: ColorConst.cwhite,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
          child: Column(
            children: [
              SizedBox(height: displayHeight(context) * 0.04),
              SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: Text(text,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: ColorConst.cblack),
                      textAlign: TextAlign.center)),
              SizedBox(height: displayHeight(context) * 0.01),
              SizedBox(
                  width: displayWidth(context) * 0.9,
                  child: Text(text2,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: ColorConst.cblack),
                      textAlign: TextAlign.center)),
              SizedBox(height: displayHeight(context) * 0.01),
              const CurrentIndexContainer(),
              SizedBox(height: displayHeight(context) * 0.01),
              Observer(builder: (_) {
                return CustomButton(
                  text: Text(
                    AppLocalizations.of(context)!.buttonText,
                    style: TextStyle(color: ColorConst.cwhite, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    if (onbViewmodel.currentIndex == onbViewmodel.onbList.length - 1) {
                      onbViewmodel.saveIsSeen();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InformationPage(),
                        ),
                      );
                    }
                    onbViewmodel.controller.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
