import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var informationViewmodel = locator.get<InformationViewModel>();

    return Scaffold(
      appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.customAppbarText),
      body: Column(
        children: [
          // GestureDetector(
          //   onTap: () {},
          //   child: Image.asset(settingsPremium, height: displayHeight(context) * 0.09),
          // ),
          CustomSettingsContainer(text: AppLocalizations.of(context)!.rateUs, image: s1),
          CustomSettingsContainer(text: AppLocalizations.of(context)!.termsofuse, image: s2),
          CustomSettingsContainer(text: AppLocalizations.of(context)!.privacy, image: s3),
          GestureDetector(
              onTap: () {
                final Uri emailLaunchUri = Uri(
                    scheme: scheme,
                    path: mailtoPath,
                    query: informationViewmodel
                        .encodeQueryParameters(<String, String>{'subject': AppLocalizations.of(context)!.subject}));
                launchUrl(emailLaunchUri);
              },
              child: CustomSettingsContainer(text: AppLocalizations.of(context)!.contact, image: s4)),
          const Spacer(),
          const RemoveBabyWidget(),
          SizedBox(height: displayHeight(context) * 0.03),
        ],
      ),
    );
  }
}
