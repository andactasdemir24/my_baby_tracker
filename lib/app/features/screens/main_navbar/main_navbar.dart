import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:baby_tracker_app/app/app.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({super.key});

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CalenderPage(),
    MemoriesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: GNav(
          onTabChange: (index) => _onItemTapped(index),
          tabMargin: EdgeInsets.symmetric(vertical: displayWidth(context) * 0.04),
          padding:
              EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.03, vertical: displayWidth(context) * 0.03),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          color: ColorConst.shade500,
          activeColor: ColorConst.mainIconColor,
          backgroundColor: ColorConst.cwhite,
          tabBackgroundColor: ColorConst.shade200,
          selectedIndex: _selectedIndex,
          gap: displayWidth(context) * 0.02,
          tabs: [
            GButton(
              icon: Icons.home,
              text: AppLocalizations.of(context)!.home,
            ),
            GButton(
              icon: Icons.calendar_month_outlined,
              text: AppLocalizations.of(context)!.calendar,
            ),
            GButton(
              icon: Icons.photo_library,
              text: AppLocalizations.of(context)!.memories,
            ),
            GButton(
              icon: Icons.person,
              text: AppLocalizations.of(context)!.profile,
            ),
          ]),
    );
  }
}
