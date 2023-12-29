import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_button.dart';
import 'package:baby_tracker_app/app/features/screens/home/view/home_page.dart';
import 'package:baby_tracker_app/app/features/screens/inapp/view/webview.dart';
import 'package:baby_tracker_app/app/features/screens/inapp/widgets/cancel_icon.dart';
import 'package:baby_tracker_app/app/features/screens/inapp/widgets/custom_desc_row.dart';
import 'package:baby_tracker_app/app/features/screens/inapp/widgets/get_premium.dart';
import 'package:baby_tracker_app/app/features/screens/inapp/widgets/price_container.dart';
import 'package:flutter/material.dart';

class InAppPage extends StatelessWidget {
  const InAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CancelIcon(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          Padding(
              padding: EdgeInsets.only(right: displayWidth(context) * 0.25),
              child: Image.asset(inApp // Adjust as needed
                  )),
          AspectRatio(aspectRatio: displayHeight(context) * 0.02),
          const GetPremium(),
          AspectRatio(aspectRatio: displayHeight(context) * 0.02),
          const CustomDescRow(text: preDesc1),
          const CustomDescRow(text: preDesc2),
          const CustomDescRow(text: preDesc3),
          AspectRatio(aspectRatio: displayHeight(context) * 0.01),
          const PriceContainer(),
          AspectRatio(aspectRatio: displayHeight(context) * 0.007),
          CustomButton(
            text: const Text(inappCustomButtonText,
                style: TextStyle(color: buttonTextColor, fontSize: 20, fontWeight: FontWeight.w600)),
            onPressed: () {},
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: displayHeight(context) * 0.06, vertical: displayWidth(context) * 0.07),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WebViews(text: 'https://www.google.com/', text2: vebViewT1),
                  const VerticalDivider(color: annualPriceText, thickness: 2),
                  WebViews(text: 'https://www.google.com/', text2: vebViewT1),
                  const VerticalDivider(color: annualPriceText, thickness: 2),
                  WebViews(text: 'https://www.google.com/', text2: vebViewT1),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
