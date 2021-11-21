import 'package:flutter/material.dart';
import 'package:team_app/login.dart';
import 'package:team_app/screens/chat_screen.dart';
import 'package:team_app/screens/login_screen.dart';
import 'package:team_app/screens/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late List _pages;

  /*change page*/
  @override
  void initState() {
    super.initState();
    _pages = [
      /*key values pairs*/
      {
        'page': SignUpScreen(),
      },
      {
        'page': LoginScreen(),
      },
    ];
  }

  /*determine the index*/
  int _pageIndex = 0;

  void _changePage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*ใส่ key ต่อท้าย*/
      body: _pages[_pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        /*set counter*/
        currentIndex: _pageIndex,
        onTap: _changePage,
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            label: 'SignUp',
            icon: Icon(Icons.arrow_upward),
          ),
          BottomNavigationBarItem(
            label: 'Login',
            icon: Icon(Icons.login),
          ),
        ],
      ),
    );
  }
}
