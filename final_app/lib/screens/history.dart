import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/models/history_model.dart';
import 'package:final_app/screens/calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  void initState() {
    getHistory();
    super.initState();
  }

  void getHistory() async {
    List _caltemp = [];
    await FirebaseFirestore.instance.collection('history').get().then((value) {
      if (value.docs.length > 0) {
        context.read<HisProvider>().history.clear();
        _caltemp.clear();
        value.docs.forEach((element) {
          HisModel newhis = HisModel(
              operand: element.data()['operand'],
              result: element.data()['result']);
          _caltemp.add(newhis);
        });
        context.read<HisProvider>().updatelist(_caltemp);
      }
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.blueGrey[900],
            appBar: AppBar(
              title: Text('back to calculator'),
              leading: IconButton(
                  icon: Icon(Icons.calculate),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              backgroundColor: Colors.blueGrey[900],
              bottom: TabBar(
                tabs: [
                  Text(
                    'History',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('Memory',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            body: ListView.builder(
                itemCount: context.watch<HisProvider>().history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      context.watch<HisProvider>().history[index].operand,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                    subtitle: Text(
                      context.watch<HisProvider>().history[index].result,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 20),
                    ),
                    trailing: Text('=',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w200)),
                  );
                })),
      ),
    );
  }
}
