import 'package:flutter/material.dart';
import 'package:team_app/controllers/deal_controller.dart';
import 'package:team_app/deal_page.dart';
import 'package:team_app/widgets/messages.dart';
import 'package:team_app/widgets/new_msg.dart';

class ChatScreen extends StatelessWidget {
  final DealController controller;

  const ChatScreen({Key? key, required this.controller}) : super(key: key);

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
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DealPage(controller: controller)));
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
