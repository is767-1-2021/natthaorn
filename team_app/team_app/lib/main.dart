import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_app/edit_profile.dart';
import 'package:team_app/firstpage.dart';
import 'package:team_app/historyPageDeal.dart';
import 'package:team_app/join_deal.dart';
import 'package:team_app/login.dart';
import 'package:team_app/nav.dart';
import 'package:provider/provider.dart';
import 'package:team_app/screens/auth_screen.dart';
import 'package:team_app/screens/chat_screen.dart';
import 'package:team_app/screens/login_screen.dart';
import 'package:team_app/services/deal_services.dart';
import 'controllers/deal_controller.dart';
import 'deal_page.dart';
import 'model/user_model.dart';
import 'profile.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var services = FirebaseServices();
  var controller = DealController(services);

  runApp(DealApp(
    controller: controller,
  ));
}

class DealApp extends StatelessWidget {
  final DealController controller;
  DealApp({required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.deepPurple[900],
          fontFamily: 'IBM Plex Sans Thai'),
      debugShowCheckedModeBanner: false,
      // initialRoute: '/AuthScreen',
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return LoginScreen(); /*ต้องแก้เป็น DealPage*/
            }
            // return AuthScreen();
            return HomePage();
          }),
      // routes: <String, WidgetBuilder>{
      //   '/login': (context) => LoginPage(),
      //   '/home': (context) => HomePage(),
      //   '/Nav': (context) => Nav(
      //         controller: controller,
      //       ),
      //   // '/editProfile': (context) => EditProfilePage(),
      //   '/profile': (context) => ProfilePage(),
      //   '/historydeal': (context) => HistoryDealPage(),
      //   // '/joindeal': (context) => JoinDeal(ds: ds),
      //   '/DealPage': (context) => DealPage(),
      //   '/AuthScreen': (context) => AuthScreen(),
      // },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      // initialRoute: '/Nav',
    );
  }
}
