import 'package:baby_tracker_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FeedingAlert extends StatelessWidget {
  const FeedingAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AlertDialog(
        title: Text(AppLocalizations.of(context)!.warningText),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(AppLocalizations.of(context)!.feedingAlertText),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(AppLocalizations.of(context)!.okey),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }
}
