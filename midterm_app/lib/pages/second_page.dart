import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:midterm_app/model/dealFormModel.dart';

class secondPage extends StatelessWidget {
  const secondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed Deal'),
      ),
      body: dealForm(),
    );
  }
}

class dealForm extends StatefulWidget {
  const dealForm({Key? key}) : super(key: key);

  @override
  _dealFormState createState() => _dealFormState();
}

class _dealFormState extends State<dealForm> {
  final _dealForm = GlobalKey<FormState>();

  String? _dealName;
  String? _dealdetail;
  String? _deallocation;
  int? _dealParty;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _dealForm,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Please input deal',
              icon: Icon(Icons.note_alt_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter deal.';
              }
            },
            onSaved: (value) {
              _dealName = value;
            },
            initialValue: context.read<dealFormModel>().dealName,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Please input detail',
              icon: Icon(Icons.pending_actions_rounded),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter detail';
              }
            },
            onSaved: (value) {
              _dealdetail = value;
            },
            initialValue: context.read<dealFormModel>().dealdetial,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Please input location',
              icon: Icon(Icons.location_on),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter location.';
              }
            },
            onSaved: (value) {
              _deallocation = value;
            },
            initialValue: context.read<dealFormModel>().deallocation,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Please input number of party',
              icon: Icon(Icons.person_add_alt_1_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter number of Party';
              }
              return null;
            },
            onSaved: (value) {
              _dealParty = int.parse(value!);
            },
            initialValue: context.read<dealFormModel>().dealParty.toString(),
          ),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
            onPressed: () {
              if (_dealForm.currentState!.validate()) {
                _dealForm.currentState!.save();

                context.read<dealFormModel>().dealName = _dealName;
                context.read<dealFormModel>().dealdetial = _dealdetail;
                context.read<dealFormModel>().deallocation = _deallocation;
                context.read<dealFormModel>().dealParty = _dealParty;

                Navigator.pop(context);
              }
            },
            child: Text('Submit Your Deal'),
          ),
        ],
      ),
    );
  }
}
