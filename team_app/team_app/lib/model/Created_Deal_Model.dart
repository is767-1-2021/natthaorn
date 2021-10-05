import 'package:flutter/cupertino.dart';

class CreatedDealModel extends ChangeNotifier {
  String? _dealtitle;
  String? _dealdescription;
  String? _location;
  int? _numberofpeople;
  String? _category;

  List<DealDB> _dealList = []; /*dealList เป็น list ของ DealDB*/

  get dealtitle => this._dealtitle;

  set dealtitle(value) {
    this._dealtitle = value;
    notifyListeners();
  }

  get dealdescription => this._dealdescription;

  set dealdescription(value) {
    this._dealdescription = value;
    notifyListeners();
  }

  get location => this._location;

  set location(value) {
    this._location = value;
    notifyListeners();
  }

  get numberofpeople => this._numberofpeople;

  set numberofpeople(value) {
    this._numberofpeople = value;
    notifyListeners();
  }

  get category => this._category;

  set category(value) {
    this._category = value;
    notifyListeners();
  }

  add(DealDB value) {
    _dealList.add(value);
    notifyListeners();
  }

  List get deal {
    return _dealList;
  }

  // set dealData(List? val) {
  // //   _dealData = val;
  // //   notifyListeners();
  // }

}

class DealDB {
  DealDB(
      {this.dealtitle,
      this.dealdescription,
      this.location,
      this.numberofpeople,
      this.category});

  String? dealtitle;
  String? dealdescription;
  String? location;
  int? numberofpeople;
  String? category;
}

// class Deal {
//   String? dealtitle;
//   String? dealdescription;
//   String? location;
//   int? numberofpeople;
//   String? category;

//   Deal(
//       {this.dealtitle,
//       this.dealdescription,
//       this.location,
//       this.numberofpeople,
//       this.category});
// }



// class DealDB {
//   List<Deal> deals = [];
//   void addDealToList(Deal deal) => deals.add(deal);
// }