// import 'dart:ui';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:final_app/controller/exp_controller.dart';
// import 'package:final_app/models/exp_model.dart';
// import 'package:final_app/screens/create_list.dart';
// import 'package:final_app/services/exp_service.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

// class ExpensePage extends StatefulWidget {
//   var controller;
//   var service = FirebaseService();

//   ExpensePage() {
//     controller = ExpController(service);
//   }

//   @override
//   _ExpensePageState createState() => _ExpensePageState(this.controller);
// }

// class _ExpensePageState extends State<ExpensePage> {
//   List<ExpData> exps = List.empty();
//   bool isLoading = false;

//   var controller;
//   _ExpensePageState(this.controller);

//   @override
//   void initState() {
//     _getData();

//     super.initState();

//     widget.controller.onSync
//         .listen((bool synState) => setState(() => isLoading = synState));
//   }

//   void _getData() async {
//     var newExps = await widget.controller.fectExps();

//     setState(() {
//       exps = newExps;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text('Expense List'),
//       ),
//       body: SingleChildScrollView(
//         child: isLoading
//             ? CircularProgressIndicator()
//             : Column(
//                 children: [
//                   Container(
//                     color: Colors.teal[100],
//                     height: 50,
//                     child: Center(
//                         child: Text(
//                       'Balance',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold),
//                     )),
//                   ),
//                   Container(
//                     child: TableCalendar(
//                       calendarFormat: CalendarFormat.week,
//                       headerStyle: HeaderStyle(
//                           decoration: BoxDecoration(color: Colors.teal),
//                           titleTextStyle: TextStyle(color: Colors.white)),
//                       firstDay: DateTime.utc(2020),
//                       lastDay: DateTime.utc(2025),
//                       focusedDay: DateTime.now(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.7,
//                     child: ListView.builder(
//                         itemCount: exps.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           ExpData ex = exps[index];
//                           return Card(
//                             color: Colors.white,
//                             margin: EdgeInsets.only(
//                                 top: 5.0, right: 5.0, left: 5.0),
//                             shadowColor: Colors.grey,
//                             child: Container(
//                               width: double.infinity,
//                               height: 100,
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(left: 20),
//                                     alignment: Alignment.centerLeft,
//                                     child: SizedBox(
//                                       height: 70.0,
//                                       child: Icon(
//                                         exps[index].category == 'Foods'
//                                             ? Icons.dining_rounded
//                                             : exps[index].category == 'Shopping'
//                                                 ? Icons.shopping_bag
//                                                 : exps[index].category ==
//                                                         'Utility'
//                                                     ? Icons.lightbulb
//                                                     : exps[index].category ==
//                                                             'Entertainment'
//                                                         ? Icons.tv
//                                                         : exps[index]
//                                                                     .category ==
//                                                                 'Revenue'
//                                                             ? Icons
//                                                                 .monetization_on
//                                                             : null,
//                                         color: Colors.teal,
//                                         size: 35.0,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Container(
//                                     width: 300,
//                                     margin: EdgeInsets.all(10),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           exps[index].expName,
//                                           style: TextStyle(
//                                               color: Colors.teal, fontSize: 20),
//                                         ),
//                                         Text(
//                                           exps[index].cost.toString(),
//                                           style: TextStyle(
//                                               color: Colors.teal, fontSize: 20),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         }),
//                   ),
//                 ],
//               ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           foregroundColor: Colors.white,
//           child: Icon(Icons.add),
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => CreateExp()));
//           }),
//     );
//   }
// }
