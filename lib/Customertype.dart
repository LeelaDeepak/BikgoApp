import 'package:bigkoapp/CustomerScreen.dart';
import 'package:bigkoapp/InfoPage.dart';
import 'package:bigkoapp/Userprofilepage.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customertype extends StatefulWidget {
  const Customertype({Key? key}) : super(key: key);

  @override
  State<Customertype> createState() => _CustomertypeState();
}

class _CustomertypeState extends State<Customertype> {
  final List<Widget> _tabItems = [
    const Userprofile(),
    const CustomerScreen(),
    const InfoPage(),
  ];

  late SharedPreferences riderstatus;
  int _activePage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: _tabItems[_activePage],
      bottomNavigationBar: GNav(
        backgroundColor: Colors.blue.shade900,
        gap: 2,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.yellow,
        padding: const EdgeInsets.all(14.5),
        onTabChange: (index) {
          print(index);
          setState(() {
            _activePage = index;
          });
        },
        tabBorderRadius: 50,
        selectedIndex: 1,
        tabs: const [
          GButton(
            icon: Icons.account_box_rounded,
            iconSize: 30,
            iconColor: Colors.black,
            text: "Profile",
            textColor: Colors.black,
            iconActiveColor: Colors.black,
          ),
          GButton(
            icon: Icons.home,
            text: "Home",
            iconColor: Colors.black,
            iconSize: 30,
            textColor: Colors.black,
            iconActiveColor: Colors.black,
          ),
          GButton(
            icon: Icons.info,
            text: "About",
            iconSize: 30,
            iconColor: Colors.black,
            textColor: Colors.black,
            iconActiveColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
