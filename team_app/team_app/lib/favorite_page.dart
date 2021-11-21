import 'dart:ui';

import 'package:team_app/controllers/favorite_controller.dart';
import 'package:team_app/deal_page.dart';
import 'package:flutter/material.dart';
import 'package:team_app/model/favorite_model.dart';
import 'package:team_app/profile.dart';
import 'package:team_app/screens/chat_screen.dart';
import 'package:team_app/services/favorite_service.dart';
import 'around_you.dart';
import 'create_deal.dart';
import 'join_deal_favorite.dart';

class FavoritePage extends StatefulWidget {
  var controller;
  var fvservice = FavoriteServices();

  FavoritePage() {
    controller = FavoriteController(fvservice);
  }

  @override
  _FavoritePageState createState() => _FavoritePageState(this.controller);
}

class _FavoritePageState extends State<FavoritePage> {
  List<Favorite> favorites = List.empty();
  bool isLoading = false;
  int _selectedIndex = 0;
  var controller;

  _FavoritePageState(this.controller);

  @override
  void initState() {
    _getFavorites();
    super.initState();

    widget.controller.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
  }

  void _getFavorites() async {
    var newFavorites = await widget.controller.fectFavorites();

    setState(() {
      favorites = newFavorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
        title: Text('Your Favorite Deals!',
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
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(10),
                      itemCount: favorites.isEmpty ? 1 : favorites.length,
                      itemBuilder: (BuildContext context, int index) {
                        Favorite fv = favorites[index];
                        if (favorites.isNotEmpty) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        JoinDealFavorite(fv: fv)),
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
                                            favorites[index].category ==
                                                    'Food & Beverage'
                                                ? Icons.dinner_dining
                                                : favorites[index].category ==
                                                        'Entertainment'
                                                    ? Icons.tv
                                                    : favorites[index]
                                                                .category ==
                                                            'Travel'
                                                        ? Icons.landscape
                                                        : favorites[index]
                                                                    .category ==
                                                                'Groceries'
                                                            ? Icons.shopping_bag
                                                            : favorites[index]
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
                                          Text(favorites[index].title,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.deepPurple[900],
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0)),
                                          Text(favorites[index].brand,
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
                                                favorites[index].place,
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.indigo),
                                              ),
                                              Text(
                                                  favorites[index]
                                                      .price
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
      // ปุ่ม สร้างข้อมูล
      //floatingActionButton: FloatingActionButton(
      //  foregroundColor: Colors.white,
      //  backgroundColor: Colors.deepPurple[900],
      //  child: Icon(Icons.add),
      //  onPressed: () {
      //    Navigator.pushReplacement(
      //        context, MaterialPageRoute(builder: (context) => CreateDeal()));
      //  },
      //),
    );
  }
}
