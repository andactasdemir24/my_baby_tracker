import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/features/screens/calender/view/calender_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../core/constants/text_constants.dart';
import '../home/view/home_page.dart';
import '../profile/view/profile_view.dart';

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
          tabMargin: EdgeInsets.all(15.r),
          padding: EdgeInsets.all(15.r),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          color: shade500,
          activeColor: mainIconColor,
          backgroundColor: cwhite,
          tabBackgroundColor: shade200,
          selectedIndex: _selectedIndex,
          gap: 10,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: home,
            ),
            GButton(
              icon: Icons.calendar_month_outlined,
              text: calendar,
            ),
            GButton(
              icon: Icons.person,
              text: profile,
            ),
          ]),
    );
  }
}
