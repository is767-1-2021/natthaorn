import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:team_app/main.dart';
import 'package:team_app/model/message_model.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 8, //*ใส่เงาใต้ appbar*/
        leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.indigo[900],
            onPressed: () {}),
        title: Text(
          'Inbox',
          style: TextStyle(color: Colors.indigo[900]),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Theme.of(context).primaryColor,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5),
                      ]),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(chat.sender.imageUrl),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  /*65% of device,s width*/
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            chat.sender.name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            chat.time,
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: Text(
                        chat.text,
                        style: TextStyle(fontSize: 13, color: Colors.blue[600]),
                        overflow: TextOverflow.ellipsis,
                        /*เกินขอบจะแสดงเป็น...*/
                        maxLines: 2,
                      )),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
