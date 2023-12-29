import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String appbarText;
  const CustomAppbar({
    Key? key,
    required this.appbarText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        appbarText,
        style: const TextStyle(
          color: getPremiumTextColor,
          fontSize: 27,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
