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
          color: shade500,
          activeColor: mainIconColor,
          backgroundColor: cwhite,
          tabBackgroundColor: shade200,
          selectedIndex: _selectedIndex,
          gap: 8,
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
              icon: Icons.photo_library,
              text: memories,
            ),
            GButton(
              icon: Icons.person,
              text: profile,
            ),
          ]),
    );
  }
}
