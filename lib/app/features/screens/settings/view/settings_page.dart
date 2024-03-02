import 'package:baby_tracker_app/app/features/screens/settings/view/privacypolicy_page.dart';
import 'package:baby_tracker_app/app/features/screens/settings/view/termsofuse_page.dart';
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
          //   child: Image.asset(ImagesConst.settingsPremium, height: displayHeight(context) * 0.09),
          // ),
          //CustomSettingsContainer(text: AppLocalizations.of(context)!.rateUs, image: ImagesConst.s1),
          CustomSettingsContainer(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsOfUse()));
              },
              text: AppLocalizations.of(context)!.termsofuse,
              image: ImagesConst.s2),
          CustomSettingsContainer(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicy()));
              },
              text: AppLocalizations.of(context)!.privacy,
              image: ImagesConst.s3),
          GestureDetector(
              onTap: () {
                final Uri emailLaunchUri = Uri(
                    scheme: TextConst.scheme,
                    path: TextConst.mailtoPath,
                    query: informationViewmodel
                        .encodeQueryParameters(<String, String>{'subject': AppLocalizations.of(context)!.subject}));
                launchUrl(emailLaunchUri);
              },
              child: CustomSettingsContainer(text: AppLocalizations.of(context)!.contact, image: ImagesConst.s4)),
          const Spacer(),
          const RemoveBabyWidget(),
          SizedBox(height: displayHeight(context) * 0.03),
        ],
      ),
    );
  }
}
