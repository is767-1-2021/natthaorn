import 'package:flutter/material.dart';

var assetImage = AssetImage('image/profile.png');
var image = Image(
  image: assetImage,
);
//void main() {
//runApp(MyApp());
//}

//class MyApp extends StatelessWidget {
// @override
//Widget build(BuildContext context) {
//return MaterialApp(
// title: 'Flutter Demo',
//theme: ThemeData(
// primarySwatch: Colors.amber,
//visualDensity: VisualDensity.adaptivePlatformDensity,
// ),
//home: ProfilePage(title: 'Profile'),
// );
//}
//}

/// Profile Page ///
class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var entries;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 4.0,
          actions: [
            Icon(Icons.chat_bubble),
            SizedBox(
              width: 12.0,
            ),
            Icon(Icons.settings),
            SizedBox(
              width: 12.0,
            ),
          ],
          leading: Icon(Icons.arrow_back),
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 190.0,
                height: 190.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('image/profile.png')))),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "John Doe",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "Edit Profile",
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    onPressed: () {},
                    icon: Icon(Icons.timelapse),
                    label: Text(
                      "History Deal",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    onPressed: () {},
                    icon: Icon(Icons.star),
                    label: Text(
                      "Favorite",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    onPressed: () {},
                    icon: Icon(Icons.book),
                    label: Text(
                      "Review",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  width: 250,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    onPressed: () {},
                    icon: Icon(Icons.question_answer),
                    label: Text(
                      "Help",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: 120,
                  child: ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(primary: Colors.red.shade700),
                    onPressed: () {},
                    icon: Icon(Icons.logout),
                    label: Text(
                      "Log Out",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            )
          ],
        )));
  }
}
