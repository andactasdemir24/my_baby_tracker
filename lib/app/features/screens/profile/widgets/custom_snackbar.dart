import 'package:flutter/material.dart';
import '../../../../core/constants/text_constants.dart';

class CustomSnackbar {
  static SnackBar show(BuildContext context) {
    return SnackBar(
      action: SnackBarAction(
        label: undo,
        onPressed: () {},
      ),
      content: const Text(noEmptyText),
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
