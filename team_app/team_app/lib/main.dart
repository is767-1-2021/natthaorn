import 'package:flutter/material.dart';
import 'package:team_app/edit_profile.dart';
import 'package:team_app/firstpage.dart';
import 'package:team_app/historyPageDeal.dart';
import 'package:team_app/join_deal.dart';
import 'package:team_app/login.dart';
import 'package:team_app/model/Created_Deal_Model.dart';
import 'package:team_app/nav.dart';
import 'package:provider/provider.dart';
import 'package:team_app/services/deal_services.dart';
import 'controllers/deal_controller.dart';
import 'deal_page.dart';
import 'model/ProfileFormModel.dart';
import 'profile.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var services = FirebaseServices();
  var controller = DealController(services);

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProfileFormModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreatedDealModel(),
        ),
      ],
      child: DealApp(
        controller: controller,
      )));
}

class DealApp extends StatelessWidget {
  final DealController controller;
  DealApp({required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DealPage(
        controller: controller,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller;
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.deepPurple[700],
          fontFamily: 'IBM Plex Sans Thai'),
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/Nav',
      routes: <String, WidgetBuilder>{
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/Nav': (context) => Nav(
              controller: controller,
            ),
        '/editProfile': (context) => EditProfilePage(),
        '/profile': (context) => ProfilePage(),
        '/historydeal': (context) => HistoryDealPage(),
        // '/joindeal': (context) => JoinDeal(ds: ds),
      },
    );
  }
}
