import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          tabMargin: const EdgeInsets.symmetric(vertical: 15),
          padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.03, vertical: 15),
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
              iconSize: 26.spMin,
              text: AppLocalizations.of(context)!.home,
              textStyle: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, color: ColorConst.buttonColor),
            ),
            GButton(
              icon: Icons.calendar_month_outlined,
              iconSize: 26.spMin,
              text: AppLocalizations.of(context)!.calendar,
              textStyle: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, color: ColorConst.buttonColor),
            ),
            GButton(
              icon: Icons.photo_library,
              iconSize: 26.spMin,
              text: AppLocalizations.of(context)!.memories,
              textStyle: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, color: ColorConst.buttonColor),
            ),
            GButton(
              icon: Icons.person,
              iconSize: 26.spMin,
              text: AppLocalizations.of(context)!.profile,
              textStyle: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, color: ColorConst.buttonColor),
            ),
          ]),
    );
  }
}
