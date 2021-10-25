import 'dart:async';

import 'package:first_app/model/todo.dart';
import 'package:first_app/services/services.dart';

class TodoController {
  final HttpServices service;
  List<Todo> todos = List.empty();

  StreamController<bool> onSyncControlller = StreamController();
  Stream<bool> get onSync => onSyncControlller.stream;

  TodoController(this.service);

  Future<List<Todo>> fectTodos() async {
    onSyncController.add(true);
    todos = await service.getTodos();
    onSyncController.add(false);
    return todos;

  }
}
