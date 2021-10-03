import 'package:flutter/material.dart';

class dealFormModel extends ChangeNotifier {
  String? _dealName;
  String? _dealdetail;
  String? _deallocation;
  int? _dealParty;

  get dealName => this._dealName;

  set dealName(value) {
    this._dealName = value;
    notifyListeners();
  }

  get dealdetial => this._dealdetail;

  set dealdetial(value) {
    this._dealdetail = value;
    notifyListeners();
  }

  get deallocation => this._deallocation;

  set deallocation(value) {
    this._deallocation = value;
    notifyListeners();
  }

  get dealParty => this._dealParty;

  set dealParty(value) {
    this._dealParty = value;
    notifyListeners();
  }
}
