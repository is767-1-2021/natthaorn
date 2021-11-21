import 'dart:async';
import 'package:team_app/model/favorite_model.dart';
import 'package:team_app/services/favorite_service.dart';

class FavoriteController {
  final FvServices services;
  List<Favorite> favorites = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  FavoriteController(this.services);

  Future<List<Favorite>> fectFavorites() async {
    onSyncController.add(true);
    favorites = await services.getFavorites();
    onSyncController.add(false);
    return favorites;
  }
}
