import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/model/deal_model.dart';

abstract class Services {
  Future<List<Deal>> getDeals();
  // Future<void> updateTodos(int id, bool completed);
}

class FirebaseServices extends Services {
  @override
  Future<List<Deal>> getDeals() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('group_deals').get();

    AllDeals deals = AllDeals.fromSnapshot(snapshot);
    return deals.deals;
  }
}
