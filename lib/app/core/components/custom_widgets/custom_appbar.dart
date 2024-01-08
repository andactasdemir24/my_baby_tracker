// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String appbarText;
  final bool? centerTitle;
  final List<Widget>? actions;
  const CustomAppbar({
    Key? key,
    required this.appbarText,
    this.centerTitle,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: Text(
        appbarText,
        style: const TextStyle(
          color: getPremiumTextColor,
          fontSize: 27,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
