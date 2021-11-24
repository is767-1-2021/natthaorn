import 'package:cloud_firestore/cloud_firestore.dart';

class Deal {
  final String caption;
  final String category;
  final DateTime createdDateTime;
  final String createdUser;
  final int member;
  final String place;
  final String title;
  final String uid;
  bool isClosed;
  bool isFav;

  /*constructor */
  Deal(this.caption, this.category, this.createdDateTime, this.createdUser,
      this.member, this.place, this.title, this.uid, this.isClosed, this.isFav);

  /*โยนค่าจาก json เป็น map object*/
  factory Deal.fromJson(
    Map<String, dynamic> json,
  ) {
    return Deal(
      json['caption'] as String,
      json['category'] as String,
      json['createdDateTime'].toDate() as DateTime,
      json['createdUser'] as String,
      json['member'] as int,
      json['place'] as String,
      json['title'] as String,
      json['uid'] as String,
      json['isClosed'] as bool,
      json['isFav'] as bool,
    );
  }
}

class AllDeals {
  final List<Deal> deals;
  AllDeals(this.deals);

  factory AllDeals.fromJson(List<dynamic> json) {
    List<Deal> deals;

    deals = json.map((index) => Deal.fromJson(index)).toList();

    return AllDeals(deals);
  }

  factory AllDeals.fromSnapshot(QuerySnapshot s) {
    List<Deal> deals = s.docs.map((DocumentSnapshot ds) {
      return Deal.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllDeals(deals);
  }
}

class Joiner {
  String jointID;
  String jointUID;
  String jointName;
  String jointPhone;
  String jointEmail;
  String jointImage;

  Joiner(
    this.jointID,
    this.jointUID,
    this.jointName,
    this.jointPhone,
    this.jointEmail,
    this.jointImage,
  );

  factory Joiner.fromJson(
    Map<String, dynamic> json,
  ) {
    return Joiner(
        json['jointID'] as String,
        json['joint_uid'] as String,
        json['joint_fullname'] as String,
        json['joint_email'] as String,
        json['joint_phoneNo'] as String,
        json['joint_image'] as String);
  }
}

class AllJoiners {
  final List<Joiner> joiners;
  AllJoiners(this.joiners);

  factory AllJoiners.fromJson(List<dynamic> json) {
    List<Joiner> joiners;

    joiners = json.map((index) => Joiner.fromJson(index)).toList();

    return AllJoiners(joiners);
  }

  factory AllJoiners.fromSnapshot(QuerySnapshot s) {
    List<Joiner> joiners = s.docs.map((DocumentSnapshot ds) {
      return Joiner.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllJoiners(joiners);
  }
}
