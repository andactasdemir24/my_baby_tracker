// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:baby_tracker_app/app/app.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String appbarText;
  final bool? centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  const CustomAppbar({
    super.key,
    required this.appbarText,
    this.centerTitle,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: Text(
        appbarText,
        style: TextStyle(
          color: ColorConst.getPremiumTextColor,
          fontSize: 27.spMin,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
