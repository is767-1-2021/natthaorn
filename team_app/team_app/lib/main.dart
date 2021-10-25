import 'package:flutter/material.dart';
import 'package:team_app/edit_profile.dart';
import 'package:team_app/firstpage.dart';
import 'package:team_app/historyPageDeal.dart';
import 'package:team_app/join_deal.dart';
import 'package:team_app/login.dart';
import 'package:team_app/model/Created_Deal_Model.dart';
import 'package:team_app/nav.dart';
import 'package:provider/provider.dart';
import 'model/ProfileFormModel.dart';
import 'profile.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ProfileFormModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => CreatedDealModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.deepPurple[700],
          fontFamily: 'IBM Plex Sans Thai'),
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/home',
      routes: <String, WidgetBuilder>{
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/Nav': (context) => Nav(),
        '/editProfile': (context) => EditProfilePage(),
        '/profile': (context) => ProfilePage(),
        '/historydeal': (context) => HistoryDealPage(),
        '/joindeal': (context) => JoinDeal(),
      },
    );
  }
}
