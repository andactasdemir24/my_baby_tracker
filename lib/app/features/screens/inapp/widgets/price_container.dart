import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05),
      child: Container(
        height: displayHeight(context) * 0.08,
        width: double.infinity,
        decoration: ShapeDecoration(
            color: annualColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                priceContainerText,
                style: TextStyle(color: annualPriceText, fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                priceContainerCost,
                style: TextStyle(color: annualPriceText, fontSize: 18, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
