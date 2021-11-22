import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_app/widgets/msg_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('group_chats')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var chatDocs = snapshot.data!.docs;
        FirebaseAuth _auth = FirebaseAuth.instance;
        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (ctx, int) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: MsgBubble(
                chatDocs[int]['text'],
                chatDocs[int]['userId'] == _auth.currentUser!.uid,
                chatDocs[int]['username'],
                chatDocs[int]['userImage'],
                key: ValueKey(chatDocs[int].id),
              ),
            );
          },
        );
      },
    );
  }
}
