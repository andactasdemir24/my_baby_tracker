import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/text_constants.dart';

class FeedingAlert extends StatelessWidget {
  const FeedingAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AlertDialog(
        title: const Text(warningText),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(feedingAlertText),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(okey),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }
}
