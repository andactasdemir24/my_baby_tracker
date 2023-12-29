import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/text_constants.dart';

class GetPremium extends StatelessWidget {
  const GetPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(getPremium,
            style: TextStyle(
              fontSize: 27,
              color: buttonColor,
              fontWeight: FontWeight.w600,
            )));
  }
}
