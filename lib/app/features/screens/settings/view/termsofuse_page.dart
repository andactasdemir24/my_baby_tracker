import 'package:baby_tracker_app/app/app.dart';
import 'package:flutter/material.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.termsofuse),
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
                      AppLocalizations.of(context)!.term1,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.term2,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.term3,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.term4,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.term5,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.term6,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.term7,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.term8,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.term9,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.term10,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.term11,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.term12,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.term13,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.term14,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.term15,
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Text(
                      AppLocalizations.of(context)!.term16,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.term17,
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
