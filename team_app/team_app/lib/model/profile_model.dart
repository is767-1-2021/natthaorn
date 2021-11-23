import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileFormModel extends ChangeNotifier {
  String? _userName;
  String? _phoneNumber;
  String? _email;
  int? _age;
  String? _gender;
  String? _password;
  String? _confirmPassword;
  String? _uid;
  bool _isLoggedIn = false;
  List<UserDB> _userList = [];

  UserDB? _selectedUser;

  Map<String, dynamic> toJson() => {
        'username': _userName,
        'phone': _phoneNumber,
        'email': _email,
        'age': _age,
        'gender': _gender,
        'uid': _uid,
        'isLoggedIn': _isLoggedIn,
      };

  reset() {
    _userName = '';
    _phoneNumber = '';
    _email = '';
    _password = '';
    _isLoggedIn = false;
    notifyListeners();
  }

  String? get userName {
    return _userName;
  }

  set userName(String? val) {
    _userName = val;
    notifyListeners();
  }

  String? get phoneNumber {
    return _phoneNumber;
  }

  set phoneNumber(String? val) {
    _phoneNumber = val;
    notifyListeners();
  }

  String? get email {
    return _email;
  }

  set email(String? val) {
    _email = val;
    notifyListeners();
  }

  int? get age {
    return _age;
  }

  set age(int? val) {
    _age = val;
    notifyListeners();
  }

  String? get gender {
    return _gender;
  }

  set gender(String? val) {
    _gender = val;
    notifyListeners();
  }

  String? get password {
    return _password;
  }

  set password(String? val) {
    _password = val;
    notifyListeners();
  }

  String? get confirmPassword {
    return _confirmPassword;
  }

  set confirmPassword(String? val) {
    _confirmPassword = val;
    notifyListeners();
  }

  String? get uid {
    return _uid;
  }

  set uid(String? val) {
    _uid = val;
    notifyListeners();
  }

  bool? get isLoggedIn {
    return _isLoggedIn;
  }

  set isLoggedIn(bool? val) {
    _isLoggedIn = val!;
    notifyListeners();
  }

  List get user {
    return _userList;
  }

  set userList(List<dynamic> val) {
    _userList = val as List<UserDB>;
    notifyListeners();
  }

  UserDB? get selectedUser {
    return _selectedUser;
  }

  set selectedUser(UserDB? val) {
    _selectedUser = val;
    notifyListeners();
  }
}

class UserDB {
  UserDB(
      {this.userName,
      this.phoneNumber,
      this.email,
      this.age,
      this.gender,
      this.password,
      this.confirmPassword,
      this.uid,
      this.isLoggedIn});
  String? userName;
  String? phoneNumber;
  String? email;
  int? age;
  String? gender;
  String? password;
  String? confirmPassword;
  String? uid;
  bool? isLoggedIn = false;
}
