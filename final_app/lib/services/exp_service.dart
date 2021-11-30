// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:final_app/models/exp_model.dart';

// abstract class Services {
//   Future<List<ExpData>> getData();
//   Future<String> addData(ExpData value);
// }

// class FirebaseService extends Services {
//   @override
//   Future<List<ExpData>> getData() async {
//     QuerySnapshot snapshot =
//         await FirebaseFirestore.instance.collection('group_expenses').get();

//     AllExps exps = AllExps.fromSnapshot(snapshot);
//     return exps.exps;
//   }

//   @override
//   Future<String> addData(ExpData value) async {
//     DocumentReference ref =
//         await FirebaseFirestore.instance.collection('group_expenses').add({
//       'ExpName': value.expName,
//       'cost': value.cost,
//       'category': value.category,
//       'createdAt': value.createdAt,
//     });

//     return ref.id;
//   }
// }
