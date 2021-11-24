import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:team_app/model/deal_model.dart';
import 'package:team_app/model/deal_model2.dart';

abstract class Services {
  Future<List<Deal>> getDeals();
  Future<String> addDeal(Deal value);
  Future<List<Deal>> getFavDeals();
  Future<void> updateFavDeal(int index, bool isFav);
  Future<List<DealDB>> getFromFirebase(String? uid);
}

class FirebaseServices extends Services {
  @override
  Future<List<Deal>> getDeals() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('group_deals').get();

    AllDeals deals = AllDeals.fromSnapshot(snapshot);
    return deals.deals;
  }

  @override
  Future<List<DealDB>> getFromFirebase(String? uid) async {
    print('getFromFirebase $uid');
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('group_deals').get();
    List<DealDB> dealList;
    dealList = snapshot.docs.map((element) {
      return DealDB(
        dealID: element.id,
        uid: element['uid'],
        title: element['title'],
        caption: element['caption'],
        place: element['place'],
        member: element['member'],
        category: element['category'],
        createdUser: element['createdUser'],
        createdDateTime: element['createdDateTime'].toDate(),
        isClosed: element['isClosed'],
      );
    }).toList();

    return dealList;
  }

  @override
  Future<String> addDeal(Deal value) async {
    DocumentReference ref =
        await FirebaseFirestore.instance.collection('group_deals').add({
      'uid': value.uid,
      'title': value.title,
      'caption': value.caption,
      'place': value.place,
      'member': value.member,
      'category': value.category,
      'createdUser': value.createdUser,
      'createdDateTime': value.createdDateTime,
      'isClosed': value.isClosed,
      'isFav': value.isFav,
    });

    return ref.id;
  }

  @override
  Future<List<Deal>> getFavDeals() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('group_deals')
        .where('isFav', isEqualTo: true)
        .get();

    AllDeals favdeals = AllDeals.fromSnapshot(snapshot);
    return favdeals.deals;
  }

  @override
  Future<void> updateFavDeal(int index, bool isFav) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('group_deals').get();
    await snapshot.docs[index].reference.update({'isFav': isFav});
  }
}
