import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileFormModel extends ChangeNotifier {
  String? _userName = 'Somchai';
  String? _firstName = 'Somchai';
  String? _lastName = 'LakSong';
  String? _dateOfBirth;
  int? _age;
  String? _gender = 'Male';
  String? _email = 'Somchai@mail.com';
  String? _changPassword;
  String? _confirmPassword;

  get userName => this._userName;

  set userName(value) {
    this._userName = value;
    notifyListeners();
  }

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

  get email => this._email;

  set email(value) {
    this._email = value;
    notifyListeners();
  }

  get changPassword => this._changPassword;

  set changPassword(value) {
    this._changPassword = value;
    notifyListeners();
  }

  get confirmPassword => this._confirmPassword;

  set confirmPassword(value) {
    this._confirmPassword = value;
    notifyListeners();
  }
}
