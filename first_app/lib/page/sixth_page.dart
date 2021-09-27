import 'package:first_app/model/first_form_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SixthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Form'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  int? _age;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter  your firstname',
              icon: Icon(Icons.business),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Firstname.';
              }
              return null;
            },
            onSaved: (value) {
              _firstName = value;
            },
            initialValue: context.read<FirstFormModel>().firstName,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your Lastname.',
              icon: Icon(Icons.family_restroom),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Lastname.';
              }
              return null;
            },
            onSaved: (value) {
              _lastName = value;
            },
            initialValue: context.read<FirstFormModel>().lastName,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your Age.',
              icon: Icon(Icons.ring_volume),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Age';
              }
              return null;
            },
            onSaved: (value) {
              _age = int.parse(value!);
            },
            /*create initial value for store value that onsaved*/
            initialValue: context.read<FirstFormModel>().age.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                /*เอาค่ามาได้เลยโดย import provier.dart มาด้วย */
                context.read<FirstFormModel>().firstName = _firstName;
                context.read<FirstFormModel>().lastName = _lastName;
                context.read<FirstFormModel>().age = _age;

                /*เอา response ออกเพราะอ่านได้เลย*/
                Navigator.pop(context);
              }
            },
            child: Text('Validate'),
          ),
        ],
      ),
    );
  }
}
