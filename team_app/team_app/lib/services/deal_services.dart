import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team_app/model/deal_model.dart';
import 'package:http/http.dart';

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

  // CollectionReference deals = FirebaseFirestore.instance.collection('todos');

  // Future<void> UpdateDeals() async {
  //   updateDeals(int id, bool completed) async {
  //     await FirebaseFirestore.instance
  //         .collection('todos')
  //         .add({

  //         })
  //         .then((QuerySnapshot querySnapshot) {
  //       return todos
  //           .doc(todos.id)
  //           .update({'completed': completed})
  //           .then((value) => print("todos updated"))
  //           .catchError((error) => print("Failed to update todos : $error"));
  //     });
  //   }
  // }

  // @override
  // Future<void> updateTodos(int id, bool completed) {
  //   // TODO: implement updateTodos
  //   throw UnimplementedError();
  // }
// }

// class HttpServices {
//   Client client = Client();

//   Future<List<Todo>> getTodos() async {
//     final response = await client
//         .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

//     if (response.statusCode == 200) {
//       var all = AllTodos.fromJson(
//         json.decode(response.body),
//       );

//       return all.todos;
//     }

//     throw Exception('Failed to load todos');
//   }
}
