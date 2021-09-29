import 'package:flutter/material.dart';
import 'package:team_app/nav.dart';
import 'package:provider/provider.dart';
import 'package:team_app/model/feed_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FeedDeal(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.deepPurple[700],
          fontFamily: 'IBM Plex Sans Thai'),
      debugShowCheckedModeBanner: false,
      home: Nav(),
    );
  }
}
