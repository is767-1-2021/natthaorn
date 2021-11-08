import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';
import 'package:team_app/join_deal.dart';
import 'package:team_app/model/Created_Deal_Model.dart';
import 'package:team_app/searchbar.dart';
import 'create_deal.dart';

class DealNow extends StatefulWidget {
  const DealNow({Key? key}) : super(key: key);

  @override
  _DealNowState createState() => _DealNowState();
}

class _DealNowState extends State<DealNow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Searh Deal'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                  ;
                },
                icon: Icon(Icons.search)),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 5),
          child: Column(
            children: <Widget>[
              ImageSlideshow(
                  height: 250,
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    Image.asset('image/HOTPOT4BUY3.jpg', fit: BoxFit.cover),
                    Image.asset('image/JUMBODEAL.jpg', fit: BoxFit.cover),
                    Image.asset('image/OISHI4BUY3.jpg', fit: BoxFit.cover),
                    Image.asset('image/MLB50OFF.jpg', fit: BoxFit.cover),
                    Image.asset('image/HMSALE.jpg', fit: BoxFit.cover),
                  ]),
              Consumer<CreatedDealModel>(
                builder: (BuildContext context, value, Widget? child) {
                  List<DealDB> dList = [];
                  dList = value.deal! as List<DealDB>;

                  if (value.deal == null) {
                    return Center(child: Text('No deal right now'));
                  } else {
                    int _allNoti = dList.toList().length;

                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 1.1,
                      child: Column(
                        children: [
                          Flexible(
                              child: Text(
                                  'Upcoming Deal: ${_allNoti.toString()}')),
                          Flexible(
                            child: SizedBox(
                              child: ListView.builder(
                                padding: EdgeInsets.all(10),
                                itemCount: dList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  DealDB deal = dList[index];

                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                JoinDeal(deal: deal)),
                                      );
                                    },
                                    child: Card(
                                      margin: EdgeInsets.only(top: 5.0),
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
                                                  deal.category ==
                                                          'Food & Beverage'
                                                      ? Icons.dinner_dining
                                                      : deal.category ==
                                                              'Entertainment'
                                                          ? Icons.tv
                                                          : deal.category ==
                                                                  'Travel'
                                                              ? Icons.landscape
                                                              : deal.category ==
                                                                      'Groceries'
                                                                  ? Icons
                                                                      .shopping_bag
                                                                  : deal.category ==
                                                                          'Other'
                                                                      ? Icons
                                                                          .money
                                                                      : null,
                                                  size: 35.0,
                                                ),
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
                                                  Text(deal.dealtitle!,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 24.0)),
                                                  Text(deal.dealdescription!,
                                                      style: TextStyle(
                                                          fontSize: 18.0)),
                                                  Wrap(
                                                    spacing: 100.0,
                                                    children: [
                                                      Text(
                                                        deal.location!,
                                                        style: TextStyle(
                                                            fontSize: 15.0),
                                                      ),
                                                      Text(
                                                          deal.numberofpeople
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 15.0)),
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
                                                  child: Icon(
                                                      Icons.favorite_border)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple[600],
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateDeal()));
            }));
  }
}
