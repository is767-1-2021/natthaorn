import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileFormModel extends ChangeNotifier {
  String? _userName = 'John Doe ';
  String? _phoneNumber = '0891234567';
  String? _email = 'jdoe@gmail.com';
  String? _dateOfBirth;
  int? _age = 30;
  String? _gender = 'Male';

  get userName => this._userName;

  set userName(value) {
    this._userName = value;
    notifyListeners();
  }

  get phoneNumber => this._phoneNumber;

  set phoneNumber(value) {
    this._phoneNumber = value;
    notifyListeners();
  }

  get email => this._email;

  set email(value) {
    this._email = value;
    notifyListeners();
  }

  get dateOfBirth => this._dateOfBirth;

  set dateOfBirth(value) {
    this._dateOfBirth = value;
    notifyListeners();
  }

  get age => this._age;

  set age(value) {
    this._age = value;
    notifyListeners();
  }

  get gender => this._gender;

  set gender(value) {
    this._gender = value;
    notifyListeners();
  }
}
