import 'package:baby_tracker_app/app/app.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.privacy),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.privacy1,
                      style:  TextStyle(
                        fontSize: 20.0.spMin,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.privacy2,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.privacy3,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.privacy4,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.privacy5,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.privacy6,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.privacy7,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.privacy8,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.privacy9,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.privacy10,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.privacy11,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.privacy12,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.privacy13,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.privacy14,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.privacy15,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.privacy16,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.privacy17,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.privacy18,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.privacy19,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.privacy20,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
