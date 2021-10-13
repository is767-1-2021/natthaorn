import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreatedDealModel extends ChangeNotifier {
  /*ตัวแปรที่อยู่ใน create_deal*/

  String? _dealtitle;
  String? _dealdescription;
  String? _location;
  int? _numberofpeople;
  String? _category;
  String? _dealowner; /*เจ้าของดีล*/
  DateTime? _dealcreatetime;
  List<DealDB>? _dealList = [];

  get dealtitle => _dealtitle;
  set dealtitle(value) {
    _dealtitle = value;
    notifyListeners();
  }

  get dealdescription => _dealdescription;
  set dealdescription(value) {
    _dealdescription = value;
    notifyListeners();
  }

  get location => _location;
  set location(value) {
    _location = value;
    notifyListeners();
  }

  get numberofpeople => _numberofpeople;
  set numberofpeople(value) {
    _numberofpeople = value;
    notifyListeners();
  }

  get category => _category;
  set category(value) {
    _category = value;
    notifyListeners();
  }

  get dealowner => _dealowner;
  set dealowner(value) {
    _dealowner = value;
    notifyListeners();
  }

  get dealcreatetime => _dealcreatetime;
  set dealcreatetime(value) {
    _dealcreatetime = value;
    notifyListeners();
  }

  addDeal(DealDB value) {
    _dealList!.add(value); /*บังคับ null safety*/
    notifyListeners();
  }

  List<dynamic>? get deal => _dealList;
  set dealList(List<dynamic> value) {
    _dealList = value as List<DealDB>;
    notifyListeners();
  }

  // void deleteDeal(String? value) {
  //   _dealList!.removeWhere((element) => element.dealtitle == value);
  //   notifyListeners();
  // }
}

class DealDB {
  DealDB(
      {this.dealtitle,
      this.dealdescription,
      this.location,
      this.numberofpeople,
      this.category,
      this.dealowner,
      this.dealcreatetime});

  String? dealtitle;
  String? dealdescription;
  String? location;
  int? numberofpeople;
  String? category;
  String? dealowner;
  DateTime? dealcreatetime;
}
