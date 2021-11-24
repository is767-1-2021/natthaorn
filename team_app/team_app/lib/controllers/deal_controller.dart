import 'dart:async';
import 'package:team_app/model/deal_model.dart';
import 'package:team_app/services/deal_services.dart';

class DealController {
  final Services services;
  List<Deal> deals = List.empty();
  List<Deal> favdeals = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  DealController(this.services);

  Future<List<Deal>> fectDeals() async {
    onSyncController.add(true);
    deals = await services.getDeals();
    onSyncController.add(false);
    return deals;
  }

  Future<List<Deal>> fectFavDeals() async {
    onSyncController.add(true);
    favdeals = await services.getFavDeals();
    onSyncController.add(false);
    return favdeals;
  }

  Future<void> updateFavDeal(int i, bool isFav) async {
    await services.updateFavDeal(i, isFav);
  }

  Future<void> updateDeals(String uid, bool isClosed) async {
    await services.updateDeals(uid, isClosed);
  }
}
