import 'dart:ui';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:team_app/controllers/deal_controller.dart';
import 'package:team_app/model/deal_model.dart';
import 'package:flutter/material.dart';
import 'package:team_app/profile.dart';
import 'package:team_app/screens/chat_screen.dart';
import 'package:team_app/services/deal_services.dart';
import 'around_you.dart';
import 'create_deal.dart';
import 'join_deal.dart';

class FavoritePage extends StatefulWidget {
  var controller;
  var service = FirebaseServices();

  FavoritePage() {
    controller = DealController(service);
  }

  @override
  _FavoritePageState createState() => _FavoritePageState(this.controller);
}

class _FavoritePageState extends State<FavoritePage> {
  List<Deal> favdeals = List.empty();
  bool isLoading = false;
  int _selectedIndex = 0;
  var controller;

  _FavoritePageState(this.controller);

  @override
  void initState() {
    _getFavDeals();
    super.initState();

    widget.controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void _getFavDeals() async {
    var newDeals = await widget.controller.fectFavDeals();

    setState(() {
      favdeals = newDeals;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Enjoy with the best Deal!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(5)),
                  SizedBox(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Favorite Deal : ${favdeals.length.toString()} Deals Now!',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(10),
                      itemCount: favdeals.isEmpty ? 1 : favdeals.length,
                      itemBuilder: (BuildContext context, int index) {
                        Deal ds = favdeals[index];
                        if (favdeals.isNotEmpty) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JoinDeal(ds: ds)),
                              );
                            },
                            child: Card(
                              color: Colors.grey[100],
                              margin: EdgeInsets.only(
                                  top: 5.0, right: 5.0, left: 5.0),
                              shape: Border(
                                  left: BorderSide(
                                      color: Colors.pink, width: 5.0)),
                              child: Container(
                                width: double.infinity,
                                height: 100.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        width: 70.0,
                                        height: 70.0,
                                        child: Icon(
                                            favdeals[index].category ==
                                                    'Food & Beverage'
                                                ? Icons.dinner_dining
                                                : favdeals[index].category ==
                                                        'Entertainment'
                                                    ? Icons.tv
                                                    : favdeals[index]
                                                                .category ==
                                                            'Travel'
                                                        ? Icons.landscape
                                                        : favdeals[index]
                                                                    .category ==
                                                                'Groceries'
                                                            ? Icons.shopping_bag
                                                            : favdeals[index]
                                                                        .category ==
                                                                    'Other'
                                                                ? Icons.money
                                                                : null,
                                            size: 35.0,
                                            color: Colors.indigo),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(favdeals[index].title,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.deepPurple[900],
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0)),
                                          Text(favdeals[index].caption,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.indigo,
                                                  fontSize: 15.0)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                favdeals[index].place,
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.indigo),
                                              ),
                                              Text(
                                                  favdeals[index]
                                                      .member
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.indigo,
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                          width: 35.0,
                                          height: 35.0,
                                          child: IconButton(
                                            icon: Icon(Icons.favorite_outline),
                                            onPressed: () {},
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Text('No Deal');
                        }
                      },
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple[900],
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => CreateDeal()));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        iconSize: 30.0,
        selectedFontSize: 14.0,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurple[900],
            icon: InkWell(
              child: Icon(Icons.home, color: Colors.white),
              onTap: () {},
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
                child: Icon(Icons.near_me, color: Colors.white),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LocationPage()));
                }),
            label: 'Around You',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
                child: Icon(Icons.person, color: Colors.white),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Profile2Page()));
                }),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
                child: Icon(Icons.message, color: Colors.white),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ChatScreen()));
                }),
            label: 'Message',
          ),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
