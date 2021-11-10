import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/deal_page.dart';
import 'model/deal_model.dart';

class JoinDeal extends StatefulWidget {
  final Deal ds;

  /*สร้าง key ให้กับ ๋deal ของ Joindeal*/
  JoinDeal({Key? key, required this.ds}) : super(key: key);

  @override
  _JoinDealState createState() => _JoinDealState();
}

class _JoinDealState extends State<JoinDeal> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter < widget.ds.member) {
        _counter += 1;
      } else {
        _counter += 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Deal'),
      ),
      body: Center(
        child: Column(
          children: [
            Table(
              children: [
                TableRow(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Host',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Deal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset('image/profile.png', width: 100),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.ds.title,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'John Doe',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        '',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Deal Detail',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.ds.caption,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Table(
              children: [
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Location',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.ds.place,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Table(
              children: [
                TableRow(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Joiner',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child:
                          Text('$_counter /', style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(widget.ds.member.toString(),
                          style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ],
            ),
            // Table(
            //   children: [
            //     TableRow(
            //       children: <Widget>[
            //         Container(
            //           padding: EdgeInsets.all(20),
            //           alignment: Alignment.centerLeft,
            //           child: Text(
            //             'Category',
            //             style: TextStyle(
            //                 fontSize: 18, fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //         Container(
            //           padding: EdgeInsets.all(20),
            //           alignment: Alignment.centerLeft,
            //           child: Consumer<CreatedDealModel>(
            //             builder: (context, value, child) {
            //               return Text(
            //                 '${value.category}',
            //                 style: TextStyle(fontSize: 20),
            //               );
            //             },
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _incrementCounter();
          // Navigator.pop(context);
        },
        child: Text('Join'),
      ),
    );
  }
}
