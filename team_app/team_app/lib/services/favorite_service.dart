import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/model/favorite_model.dart';

abstract class FvServices {
  Future<List<Favorite>> getFavorites();
  Future<String> addFavorite(Favorite value);
}

class FavoriteServices extends FvServices {
  @override
  Future<List<Favorite>> getFavorites() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('group_favorites').get();

    AllFavorites favorites = AllFavorites.fromSnapshot(snapshot);
    return favorites.allfavorites;
  }

  Future<String> addFavorite(Favorite value) async {
    DocumentReference ref =
        await FirebaseFirestore.instance.collection('group_favorites').add({
      'title': value.title,
      'brand': value.brand,
      'category': value.category,
      'place': value.place,
      'price': value.price,
      'isClosed': value.isClosed
    });

    return ref.id;
  }
}
