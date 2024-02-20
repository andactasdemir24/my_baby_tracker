import 'package:flutter/material.dart';
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: displayHeight(context) * 0.04, width: displayWidth(context)),
        SizedBox(
          width: displayWidth(context) * 0.9,
          child: Text(
            text,
            style: TextStyle(fontSize: 24.spMin, fontWeight: FontWeight.w600, color: ColorConst.cblack),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: displayHeight(context) * 0.02),
        SizedBox(
          width: displayWidth(context) * 0.9,
          child: Text(
            text2,
            style: TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w500, color: ColorConst.cblack),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        const CurrentIndexContainer(),
        SizedBox(height: displayHeight(context) * 0.02),
        CustomButton(
          text: Text(
            AppLocalizations.of(context)!.buttonText,
            style: TextStyle(color: ColorConst.cwhite, fontSize: 20.spMin, fontWeight: FontWeight.w600),
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
        ),
      ],
    );
  }
}
