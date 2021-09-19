import 'package:flutter/material.dart';
import 'package:team_app/nav.dart';
//import 'package:team_app/searchbar.dart';
//import 'package:team_app/login.dart';
//import 'package:team_app/feedform.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Nav(),
    );
  }
}
