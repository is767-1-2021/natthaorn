import 'package:flutter/cupertino.dart';

class ProfileFromModel extends ChangeNotifier {
  String? _userName;
  String? _firstName;
  String? _lastName;
  String? _dateOfBirth;
  int? _age;
  String? _gender;
  String? _email;

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
}
