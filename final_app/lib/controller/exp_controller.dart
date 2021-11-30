// import 'dart:async';

// import 'package:final_app/services/exp_service.dart';
// import 'package:final_app/models/exp_model.dart';

// class ExpController {
//   final Services services;
//   List<ExpData> exps = List.empty();

//   StreamController<bool> onSyncController = StreamController();
//   Stream<bool> get onSync => onSyncController.stream;

//   ExpController(this.services);

//   Future<List<ExpData>> fectExps() async {
//     onSyncController.add(true);
//     exps = await services.getData();
//     onSyncController.add(false);
//     return exps;
//   }
// }
