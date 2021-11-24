import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:team_app/model/user_model2.dart';
import 'package:provider/provider.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _enteredMsg = '';
  var msgCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: msgCon,
              onChanged: (val) {
                setState(() {
                  _enteredMsg = val;
                });
              },
              decoration: InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            onPressed: _enteredMsg.trim().isEmpty
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    FirebaseAuth _auth = FirebaseAuth.instance;
                    var userdata = await FirebaseFirestore.instance
                        .collection('group_users')
                        .doc(_auth.currentUser!.uid)
                        .get();
                    await FirebaseFirestore.instance
                        .collection('group_chats')
                        .doc()
                        .set({
                      'text': _enteredMsg,
                      'createdAt': Timestamp.now(),
                      'userId': _auth.currentUser!.uid,
                      'username': _auth.currentUser!.email,
                      'userImage':
                          'https://firebasestorage.googleapis.com/v0/b/is-project01.appspot.com/o/user_image%2Fuser03.png?alt=media&token=9b32b994-d8f1-4982-8145-e8b890d3ccbc'
                    });
                    msgCon.clear();
                    setState(() {
                      _enteredMsg = '';
                    });
                  },
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
