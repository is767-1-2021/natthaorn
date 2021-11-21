import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  //final String caption;
  final String brand;
  final String place;
  final String title;
  final String category;
  final String price;

  bool isClosed;

  /*constructor */
  Favorite(this.place, this.category, this.price, this.title, this.brand,
      this.isClosed);

  /*โยนค่าจาก json เป็น map object*/
  factory Favorite.fromJson(
    Map<String, dynamic> json,
  ) {
    return Favorite(
      json['brand'] as String,
      json['title'] as String,
      json['place'] as String,
      json['category'] as String,
      json['price'] as String,
      json['isClosed'] as bool,
    );
  }
}

class AllFavorites {
  final List<Favorite> allfavorites;
  AllFavorites(this.allfavorites);

  factory AllFavorites.fromJson(List<dynamic> json) {
    List<Favorite> favotites;

    favotites = json.map((index) => Favorite.fromJson(index)).toList();

    return AllFavorites(favotites);
  }

  factory AllFavorites.fromSnapshot(QuerySnapshot s) {
    List<Favorite> favorites = s.docs.map((DocumentSnapshot fv) {
      return Favorite.fromJson(fv.data() as Map<String, dynamic>);
    }).toList();

    return AllFavorites(favorites);
  }
}
