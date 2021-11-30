// import 'package:cloud_firestore/cloud_firestore.dart';

// class ExpData {
//   final String expName;
//   final int cost;
//   final String category;
//   final DateTime createdAt;

//   ExpData(this.expName, this.cost, this.category, this.createdAt);

//   factory ExpData.fromJson(
//     Map<String, dynamic> json,
//   ) {
//     return ExpData(
//       json['expName'] as String,
//       json['cost'] as int,
//       json['category'] as String,
//       json['createdAt'].toDate() as DateTime,
//     );
//   }
// }

// class AllExps {
//   final List<ExpData> exps;
//   AllExps(this.exps);

//   factory AllExps.fromJson(List<dynamic> json) {
//     List<ExpData> exps;

//     exps = json.map((index) => ExpData.fromJson(index)).toList();

//     return AllExps(exps);
//   }

//   factory AllExps.fromSnapshot(QuerySnapshot s) {
//     List<ExpData> exps = s.docs.map((DocumentSnapshot ds) {
//       return ExpData.fromJson(ds.data() as Map<String, dynamic>);
//     }).toList();

//     return AllExps(exps);
//   }
// }
