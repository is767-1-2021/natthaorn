import 'package:flutter/material.dart';

/*ตัว provider*/
class FeedDeal with ChangeNotifier {
  /*เก็บตัวแปรที่จะเอาไปกรอกใน card เพื่อโชว์ฟีด*/

  List<String> _dealtitle = [];
  List<String> _dealdescription = [];
  List<String> _location = [];
  List<String> _numberofpeople = [];
  List<String> _category = [];

  get dealtitle => this._dealtitle;

  set dealtitle(value) {
    this._dealtitle = value;
    _dealtitle.add(value);
    notifyListeners();
  }

  get dealdescription => this._dealdescription;

  set dealdescription(value) {
    this._dealdescription = value;
    _dealdescription.add(value);
    notifyListeners();
  }

  get location => this._location;

  set location(value) {
    this._location = value;
    _location.add(value);
    notifyListeners();
  }

  get numberofpeople => this._numberofpeople;

  set numberofpeople(value) {
    this._numberofpeople = value;
    _numberofpeople.add(value);
    notifyListeners();
  }

  get category => this._category;

  set category(value) {
    this._category = value;
    _category.add(value);
    notifyListeners();
  }
}

class DealList {
  final String? dealtitle;
  final String? dealdescription;
  final String? location;
  final int? numberofpeople;
  final String? category;
  final String? dealOwner;

  DealList(
      {this.dealtitle,
      this.dealdescription,
      this.location,
      this.numberofpeople,
      this.category,
      this.dealOwner});
}

List<DealList> Deals = [
  DealList(
      dealtitle: 'HOTPOT 4 BUY 3',
      dealdescription: 'หารตี้อีก 3 คนทานฮอตพอตค่ะ',
      location: 'Siam one',
      numberofpeople: 3,
      category: 'Food&Beverage'),
  DealList(
      dealtitle: 'OISHI BUFFET',
      dealdescription: 'หารตี้หารโออิชิบุฟค่ะ',
      location: 'Siam one',
      numberofpeople: 3,
      category: 'Food&Beverage'),
];
