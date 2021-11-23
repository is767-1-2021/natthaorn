import 'package:flutter/material.dart';
import 'package:team_app/login.dart';
import 'package:team_app/register.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeDeal',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("image/bg2.png"),
          fit: BoxFit.fill,
        )),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.display3,
              children: [
                TextSpan(
                    text: "We",
                    style: TextStyle(
                        fontFamily: 'IBMPlexSansThai',
                        color: Colors.amber.shade500)),
                TextSpan(
                  text: "Deal",
                  style: TextStyle(
                      fontFamily: 'IBMPlexSansThai',
                      color: Colors.deepPurple.shade600,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 320.0,
            width: 320.0,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("image/logo4.jpg"))),
          ),
          SizedBox(height: 20),
          Column(children: <Widget>[
            MaterialButton(
              minWidth: 270,
              height: 50,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              color: Color(0xff8455b3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
                minWidth: 270,
                height: 50,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                color: Color(0xff8455b3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
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
    );
  }
}
