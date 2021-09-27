import 'package:flutter/material.dart';
import 'package:team_app/inboxscreen.dart';
import 'package:team_app/profile.dart';
import 'package:team_app/searchbar.dart';
import 'package:team_app/around_you.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  final tabs = [
    Searchbar(),
    LocationPage(),
    ProfilePage(),
    InboxScreen(), /*ปลั๊กหน้า เหมือน routing*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.grey[300],
        iconSize: 30.0,
        selectedFontSize: 14.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.deepPurple[800]),
          BottomNavigationBarItem(
              icon: Icon(Icons.near_me),
              label: 'Around You',
              backgroundColor: Colors.deepPurple[800]),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.deepPurple[800]),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Message',
              backgroundColor: Colors.deepPurple[800]),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
