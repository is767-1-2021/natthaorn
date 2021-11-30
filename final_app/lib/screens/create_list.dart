import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

class CreateExp extends StatelessWidget {
  const CreateExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Today Cost'),
      ),
      body: NewExp(),
    );
  }
}

class NewExp extends StatefulWidget {
  const NewExp({Key? key}) : super(key: key);

  @override
  _NewExpState createState() => _NewExpState();
}

class _NewExpState extends State<NewExp> {
  final _expForm = GlobalKey<FormState>();
  String? _expName;
  int? _cost;
  String? _category;
  DateTime? _createdAt = DateTime.now();

  final items = ['Foods', 'Shopping', 'Utility', 'Entertainment', 'Revenue'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _expForm,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Expense Detail',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                      hintText: 'e.g. Momo Paradise'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Type Expenses';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _expName = value;
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Cost',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                      hintText: 'e.g. 650'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Type Cost';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cost = int.parse(value!);
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Category',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  value: _category,
                  isExpanded: true,
                  items: items
                      .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          ))
                      .toList(),
                  hint: Text('Select Category'),
                  onChanged: (value) {
                    setState(() {
                      _category = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select category';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _category = value;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              onPressed: () async {
                if (_expForm.currentState!.validate()) {
                  _expForm.currentState!.save();

                  await FirebaseFirestore.instance
                      .collection('group_expenses')
                      .add({
                    'expName': _expName,
                    'cost': _cost,
                    'createdAt': _createdAt,
                    'category': _category
                  });
                  Navigator.pop(context);
                }
              },
              child:
                  Text('Create', style: TextStyle(fontWeight: FontWeight.bold)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
