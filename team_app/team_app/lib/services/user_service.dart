import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_app/model/user_model.dart';
import 'package:team_app/model/deal_model.dart';

abstract class Services {
  Future<List<UserData>> getUsers();
  Future<String> addUser(UserData value);
}

class UserServices extends Services {
  @override
  Future<List<UserData>> getUsers() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('group_users').get();

    AllUsers users = AllUsers.fromSnapshot(snapshot);
    return users.users;
  }

  Future<String> addUser(UserData value) async {
    DocumentReference ref =
        await FirebaseFirestore.instance.collection('group_users').add({
      'email': value.email,
      'fullname': value.fullname,
      'isLoggedIn': value.isLoggedIn,
      'phoneNo': value.phoneNo,
      'uid': value.uid,
    });

    return ref.id;
  }
}
