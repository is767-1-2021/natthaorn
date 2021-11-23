// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:team_app/login.dart';
import 'package:team_app/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
            Color(0xFF612F7D),
            Color(0xFF420F65),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "WeDeal",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Better Life is high-cost,So make you deal.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/WeDeal_logo.png"))),
                  ),
                  Column(children: <Widget>[
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      color: Color(0xff8455b3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                    MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        color: Color(0xff8455b3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))
                  ])
                ]),
          ),
        ),
      ),
    );
  }
}
