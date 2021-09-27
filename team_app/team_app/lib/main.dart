import 'package:flutter/material.dart';
import 'package:team_app/nav.dart';
//import 'package:team_app/chatpage.dart';

//import 'inboxscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Nav(),
    );
  }
}
