import 'package:flutter/material.dart';

//* กด stful ได้ structure ทั้งหมด แก้แต่ชื่อตัวแปร
class Feedform extends StatefulWidget {
  const Feedform({Key? key}) : super(key: key);

  @override
  _FeedformState createState() => _FeedformState();
}

class _FeedformState extends State<Feedform> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Demo'),
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildEmailField(),
          _buildPasswordField(),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      //*add validator to check whether value is not null before sending.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter Email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Password';
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        // Validate returns true if the form is valid
        if (_formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar.
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Processing Data')));
        }
      },
      child: Text('Submit'),
    );
  }
}
