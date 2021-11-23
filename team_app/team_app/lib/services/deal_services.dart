import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/model/deal_model.dart';

abstract class Services {
  Future<List<Deal>> getDeals();
  Future<String> addDeal(Deal value);
  Future<List<Deal>> getFavDeals();
  Future<void> updateFavDeal(String uid, bool isFav);
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
  Future<void> updateFavDeal(String uid, bool isFav) async {
    CollectionReference _ref =
        FirebaseFirestore.instance.collection('groups_deals');
    await FirebaseFirestore.instance
        .collection('group_deals')
        .where('uid', isEqualTo: uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _ref
            .doc(doc.id)
            .update({'isFav': isFav})
            .then((value) => print("Deal Updated"))
            .catchError((error) => print("Failed to update Deals : $error"));
      });
    });
  }
}
