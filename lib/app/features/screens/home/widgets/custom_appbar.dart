import 'package:baby_tracker_app/app/features/screens/settings/view/settings_page.dart';
import 'package:baby_tracker_app/app/features/theme/baby_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/text_constants.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        babyAppbartext,
        style: TextStyle(color: cwhite, fontWeight: FontWeight.bold),
      ),
      backgroundColor: homeAppbar,
      actions: [
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
            child: Icon(Baby.settings, size: 50.h, color: cwhite)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
