import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_appbar.dart';
import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/text_constants.dart';
import '../widgets/custom_settings_container.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(appbarText: customAppbarText),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(settingsPremium, height: displayHeight(context) * 0.09),
          ),
          const CustomSettingsContainer(text: rateUs, image: s1),
          const CustomSettingsContainer(text: termsofuse, image: s2),
          const CustomSettingsContainer(text: privacy, image: s3),
          const CustomSettingsContainer(text: contact, image: s4),
          const CustomSettingsContainer(text: restore, image: s5),
        ],
      ),
    );
  }
}
