import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';
import 'package:team_app/model/Created_Deal_Model.dart';
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            ImageSlideshow(
                height: 230,
                autoPlayInterval: 3000,
                isLoop: true,
                children: [
                  Image.asset('image/HOTPOT4BUY3.jpg', fit: BoxFit.cover),
                  Image.asset('image/JUMBODEAL.jpg', fit: BoxFit.cover),
                  Image.asset('image/OISHI4BUY3.jpg', fit: BoxFit.cover),
                  Image.asset('image/MLB50OFF.jpg', fit: BoxFit.cover),
                  Image.asset('image/HMSALE.jpg', fit: BoxFit.cover),
                ]),
            Padding(padding: EdgeInsets.only(top: 15)),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Consumer<CreatedDealModel>(
                builder: (BuildContext context, value, Widget? child) {
                  List<DealDB> dList = [];
                  dList = value.deal! as List<DealDB>;

                  if (value.deal == null) {
                    return Center(child: Text('No deal right now'));
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: dList.length,
                      itemBuilder: (BuildContext context, int index) {
                        DealDB deal = dList[index];

                        return ListTile(
                          tileColor: Colors.purple[50],
                          title: Text(deal.dealtitle!),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(deal.dealdescription!),
                              Wrap(
                                spacing: 100.0,
                                children: [
                                  Text(deal.location!),
                                  Text(deal.numberofpeople.toString()),
                                ],
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {
                              /*add to favorite list*/
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple[600],
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CreateDeal()));
          }),
    );
  }
}
