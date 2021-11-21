import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_app/deal_page.dart';
import 'package:team_app/widgets/messages.dart';
import 'package:team_app/widgets/new_msg.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => DealPage()));
          },
        ),
        title: Text('Chats'),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.exit_to_app),
        //     onPressed: () async {
        //       await FirebaseAuth.instance.signOut();
        //     },
        //   )
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Messages(),
          ),
          /*ใส่ class หน้าแชทใหม่*/
          NewMessage(),
        ],
      ),
    );
  }
}
