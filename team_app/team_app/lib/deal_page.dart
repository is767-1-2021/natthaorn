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

class DealPage extends StatefulWidget {
  var controller;
  var service = FirebaseServices();

  DealPage() {
    controller = DealController(service);
  }

  @override
  _DealPageState createState() => _DealPageState();
}

class _DealPageState extends State<DealPage> {
  List<Deal> deals = List.empty();
  bool isLoading = false;
  bool _isFavorited = false;
  int _selectedIndex = 0;

  @override
  void initState() {
    _getDeals();
    super.initState();

    widget.controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void _getDeals() async {
    var newDeals = await widget.controller.fectDeals();

    setState(() {
      deals = newDeals;
    });
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  void _updateFavDeal(int i, bool isFav) async {
    await FirebaseServices().updateFavDeal(i, !deals[i].isFav);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  ImageSlideshow(
                      height: 130,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: [
                        Image.asset('image/proAKA.jpg', fit: BoxFit.fitWidth),
                        Image.asset('image/proUniqlo.jpg',
                            fit: BoxFit.fitWidth),
                        Image.asset('image/proKoi.jpg', fit: BoxFit.fitWidth),
                        Image.asset('image/HOTPOT4BUY3.jpg',
                            fit: BoxFit.fitWidth)
                      ]),
                  SizedBox(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Upcoiming Deal : ${deals.length.toString()} Deals Now!',
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
                      itemCount: deals.isEmpty ? 1 : deals.length,
                      itemBuilder: (BuildContext context, int index) {
                        Deal ds = deals[index];
                        if (deals.isNotEmpty) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JoinDeal(ds: ds)),
                              );
                            },
                            child: Card(
                              color: Colors.white,
                              shadowColor: Colors.grey,
                              margin: EdgeInsets.only(
                                  top: 5.0, right: 5.0, left: 5.0),
                              shape: Border(
                                  left: BorderSide(
                                      color: Colors.amber, width: 5.0)),
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
                                            deals[index].category ==
                                                    'Food & Beverage'
                                                ? Icons.dinner_dining
                                                : deals[index].category ==
                                                        'Entertainment'
                                                    ? Icons.tv
                                                    : deals[index].category ==
                                                            'Travel'
                                                        ? Icons.landscape
                                                        : deals[index]
                                                                    .category ==
                                                                'Groceries'
                                                            ? Icons.shopping_bag
                                                            : deals[index]
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
                                          Text(deals[index].title,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0)),
                                          Text(deals[index].caption,
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
                                                deals[index].place,
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.indigo),
                                              ),
                                              Text(
                                                  deals[index]
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
                                            icon: deals[index].isFav == true
                                                ? Icon(Icons.favorite_outline)
                                                : Icon(Icons.favorite),
                                            color: Colors.red,
                                            iconSize: 18,
                                            onPressed: () async {
                                              setState(() {
                                                if (deals[index].isFav) {
                                                  deals[index].isFav = false;
                                                } else {
                                                  deals[index].isFav = true;
                                                }
                                                _updateFavDeal(
                                                    index, !deals[index].isFav);
                                              });
                                            }),
                                      ),
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
        backgroundColor: Colors.deepPurple,
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
            backgroundColor: Colors.deepPurple,
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
