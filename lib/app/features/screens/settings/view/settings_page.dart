import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';

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
          const Spacer(),
          const RemoveBabyWidget(),
          SizedBox(height: displayHeight(context) * 0.03),
        ],
      ),
    );
  }
}
