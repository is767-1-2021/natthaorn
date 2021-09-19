import 'package:flutter/material.dart';
import 'package:team_app/searchbar.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  final tabs = [
    Searchbar(), //ปลั๊กหน้า เหมือน routing
    Center(child: Text('Home')),
    Center(child: Text('Around You')),
    Center(child: Text('Favorite')),
    Center(child: Text('Chat')),
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
              backgroundColor: Colors.deepOrange[400]),
          BottomNavigationBarItem(
              icon: Icon(Icons.near_me),
              label: 'Around You',
              backgroundColor: Colors.red[400]),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
              backgroundColor: Colors.green[400]),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Chat',
              backgroundColor: Colors.lightBlue[400]),
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
