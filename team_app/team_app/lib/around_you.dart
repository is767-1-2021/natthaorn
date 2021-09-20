//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_app/favorite_page.dart';

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location'), actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritePage(),
                ),
              );
            },
            icon: Icon(Icons.favorite)),
        IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
      ]),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExpandDeal()),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'Location',
              child: Image.asset(
                'image/map1.jpeg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandDeal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'Expand',
            child: Image.asset(
              'image/APPLEBACKTOSCHOOL.jpg',
              width: 350,
            ),
          ),
        ),
      ),
    );
  }
}
