import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:baby_tracker_app/app/features/screens/calender/view/calender_page.dart';
import 'package:baby_tracker_app/app/features/screens/settings/view/settings_page.dart';
import 'package:baby_tracker_app/app/features/theme/baby_icons.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(appbarText, style: TextStyle(color: cblack, fontSize: 22, fontWeight: FontWeight.w500)),
      leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
          },
          child: const Icon(Baby.settings, size: 50)),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: displayHeight(context) * 0.02),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CalenderPage()));
              },
              child: const Icon(Baby.calendar)),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
