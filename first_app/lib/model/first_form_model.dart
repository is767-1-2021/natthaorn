import 'package:flutter/material.dart';

/*เป็น class ในการเก็บข้อมูลตัวฟอร์ม*/
/*notifylistener มีหน้าที่เอาไว้บอกว่าค่าเปลี่ยนแล้ว ต้องรีเฟรช และเก็บใหม่*/
class FirstFormModel extends ChangeNotifier {
/*ประกาศค่าตามฟอร์มที่เราต้องการจะเก็บข้อมูล */
  String? _firstName;
  String? _lastName;
  int? _age;

/*setterfunction*/
  get firstName => this._firstName;

  set firstName(value) {
    this._firstName = value;
    notifyListeners();
  }

  get lastName => this._lastName;

  set lastName(value) {
    this._lastName = value;
    notifyListeners();
  }

  get age => this._age;

  set age(value) {
    this._age = value;
    notifyListeners();
  }
}
