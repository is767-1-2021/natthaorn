import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_app/widgets/messages.dart';
import 'package:team_app/widgets/new_msg.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Chats',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              FirebaseAuth _auth = FirebaseAuth.instance;

              await _auth.signOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Messages(),
              ),
              NewMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
