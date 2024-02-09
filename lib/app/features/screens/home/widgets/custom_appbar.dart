import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.babyAppbartext,
        style: TextStyle(color: ColorConst.cwhite, fontWeight: FontWeight.bold, fontSize: 20.spMin),
      ),
      backgroundColor: ColorConst.homeAppbar,
      actions: [
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
            child: Icon(Baby.settings, size: 50.spMin, color: ColorConst.cwhite)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
