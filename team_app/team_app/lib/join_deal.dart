import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/model/Created_Deal_Model.dart';
import 'dealnow.dart';

class JoinDeal extends StatefulWidget {
  final DealDB? deal;

  /*สร้าง key ให้กับ ๋deal ของ Joindeal*/
  JoinDeal({Key? key, this.deal}) : super(key: key);

  @override
  _JoinDealState createState() => _JoinDealState();
}

class _JoinDealState extends State<JoinDeal> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if (_counter == context.read<CreatedDealModel>().numberofpeople) {
      } else
        _counter++;
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
                        widget.deal!.dealtitle!,
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
                widget.deal!.dealdescription!,
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
                        widget.deal!.location!,
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
                      child: Text(widget.deal!.numberofpeople.toString(),
                          style: TextStyle(fontSize: 20)),
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
                        'Category',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Consumer<CreatedDealModel>(
                        builder: (context, value, child) {
                          return Text(
                            '${value.category}',
                            style: TextStyle(fontSize: 20),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
