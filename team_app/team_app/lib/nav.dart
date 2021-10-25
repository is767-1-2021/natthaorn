import 'package:flutter/material.dart';
import 'package:team_app/chatpage.dart';
import 'package:team_app/dealnow.dart';
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
    /*ปลั๊กหน้า เหมือน routing*/
    DealNow(),
    LocationPage(),
    ProfilePage(),
    ChatPage(),
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
              /*ครอบด้วย Stack ที่ไอคอน ให้ซ้อน แล้วซ้อน container อีกที แล้วก็ใส่ขนาด 5+5 แต่งสี แล้วซ้อนด้วย Text แล้วเลือก position แล้วใส่ค่าด้วย allNoti*/
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
