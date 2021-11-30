import 'package:flutter/material.dart';

class HisProvider with ChangeNotifier {
  List _history = [];
  List get history => _history;
  void updatelist(List history) {
    _history = history;
    notifyListeners();
  }
}

class HisModel {
  final String operand;
  final String result;

  HisModel({required this.operand, required this.result});
}
