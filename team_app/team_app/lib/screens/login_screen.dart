import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _emailString = '';
  var _passString = '';

  var _isLoading = false;

  /*สร้าง form ให้เก็บค่าที่สมัคร*/
  final _formKey = GlobalKey<FormState>();

  /*signUp to Firebase*/
  void _submit() async {
    /*เซตตัวแปร _isValid แล้วก็เขียน condition ว่าอะไรคือ _isValid*/
    final _isValid = _formKey.currentState!.validate();

    /*เอา keyboard ออก*/
    FocusScope.of(context).unfocus();

    /*conditon if isValid is false*/
    if (!_isValid) {
      return;
    }

    _formKey.currentState!.save();

    /*set เวลากดปุ่ม signUp จะให้ขึ้นเป็น CircularProgressIndicator*/
    setState(() {
      _isLoading = true;
    });

    /*login เข้า firebaseAuth*/
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _emailString, password: _passString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  /*แต่ง UI*/
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    /*กรอก Email & Password*/
                    TextFormField(
                      /*สร้าง value เก็บค่าที่กรอกลงไป*/
                      validator: (val) {
                        /*|| == OR*/
                        /*!val.contains == if val not contains*/
                        if (val!.isEmpty || !val.contains('@')) {
                          return 'Please enter a valid Email';
                        }
                        /*value if true*/
                        return null;
                      },
                      onSaved: (val) {
                        _emailString = val!;
                      },
                      /*set keyboard*/
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) {
                        /*if value have less that 8 characters*/
                        if (val!.isEmpty || val.length < 3) {
                          return 'Password must be at least 8 units';
                        }
                        /*value if true*/
                        return null;
                      },
                      onSaved: (val) {
                        _passString = val!;
                      },
                      /*ซ๋อน password*/
                      obscureText: true,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: Icon(Icons.lock),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    /*if _isLoading = true >> Circular , if false ให้ทำต่อ*/
                    _isLoading
                        ? CircularProgressIndicator()
                        : Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text('Login'),
                              onPressed: _submit,
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
