import 'package:baby_tracker_app/app/app.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static SnackBar show(BuildContext context) {
    return SnackBar(
      action: SnackBarAction(
        label: AppLocalizations.of(context)!.undo,
        onPressed: () {},
      ),
      content: Text(AppLocalizations.of(context)!.noEmptyText),
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
