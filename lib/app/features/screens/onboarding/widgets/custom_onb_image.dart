import 'package:flutter/material.dart';

import '../../../../core/constants/mediaquery_constants.dart';
import '../viewmodel/onboarding_viewmodel.dart';

class CustomOnbImage extends StatelessWidget {
  const CustomOnbImage({
    super.key,
    required this.onbViewmodel,
    required this.image,
  });

  final OnboardingViewmodel onbViewmodel;
  final DecorationImage? image;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: displayWidth(context) * 0.9,
        height: displayHeight(context) * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: image,
        ),
      ),
    );
  }
}
