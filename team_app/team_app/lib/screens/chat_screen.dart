import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_app/widgets/messages.dart';
import 'package:team_app/widgets/new_msg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp),
            onPressed: () async {
              FirebaseAuth _auth = FirebaseAuth.instance;
              await _auth.signOut();
            }),
        title: Text('Chats'),
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
