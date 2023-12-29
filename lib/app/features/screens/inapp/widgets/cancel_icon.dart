// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/constants/mediaquery_constants.dart';
import '../../../theme/baby_icons.dart';

class CancelIcon extends StatelessWidget {
  final Function()? onPressed;
  const CancelIcon({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: displayHeight(context) * 0.04),
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(Baby.cancel, size: displayHeight(context) * 0.06),
        ),
      ),
    );
  }
}
