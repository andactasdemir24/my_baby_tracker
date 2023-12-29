import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:baby_tracker_app/app/features/theme/baby_icons.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';

class CustomDescRow extends StatelessWidget {
  final String text;
  const CustomDescRow({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.2),
      child: Row(
        children: [
          const Icon(Baby.tick),
          Text(text, style: const TextStyle(color: annualPriceText, fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
