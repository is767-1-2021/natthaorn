import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:team_app/deal_page.dart';
import 'package:team_app/login.dart';
import 'package:team_app/services/deal_services.dart';

import 'controllers/deal_controller.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[700],
          title: Text(""),
        ),
        body: MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _fullname;
  String? _gender;
  DateTime? _birthday;
  String? _phoneNo;
  String? _password;
  String? _confirmPassword;
  String? _email;
  String? _uid;
  bool? _isLoggedIn;
  String? _userNameString;
  bool _isLoading = false;

  bool _obsecureTextSignup = true;
  bool _obsecureTextSignupConfirm = true;

  bool _isPasswordSixLetters = false;
  bool _hasPasswordOneNumber = false;

  onPasswordChange(String value) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordSixLetters = false;
      if (value.length >= 6) _isPasswordSixLetters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(value)) _hasPasswordOneNumber = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              //child: Form(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "WeDeal",
                    style: TextStyle(
                        fontFamily: 'IBMPlexSansThai',
                        fontWeight: FontWeight.w300,
                        fontSize: 40,
                        color: Colors.deepPurple.shade900),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_add_outlined,
                              color: Colors.black87),
                          labelText: 'Name',
                          hintText: 'Please input your Fullname',
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade500),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _fullname = value;
                      }),

                  SizedBox(
                    height: 7,
                  ),
                  //Text("Phone Number", style: TextStyle(fontSize: 14)),
                  TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone_android_outlined,
                              color: Colors.black87),
                          labelText: 'Phone Number',
                          hintText: 'Please input your Phone Number',
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade500),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Phone Number';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _phoneNo = value;
                      }),

                  SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.email_outlined, color: Colors.black87),
                          labelText: 'Email',
                          hintText: 'Please input your Email',
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade500),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _email = value;
                      }),

                  SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_clock_outlined,
                              color: Colors.black87),
                          suffixIcon: Icon(Icons.visibility_off_outlined,
                              color: Colors.black87),
                          labelText: 'Password',
                          hintText: 'Please input your Password',
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade500),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Password';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _password = value;
                      }),

                  SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.lock_outline, color: Colors.black87),
                          suffixIcon: Icon(Icons.visibility_off_outlined,
                              color: Colors.black87),
                          labelText: 'Confirm Password',
                          hintText: 'Please input your Confirm Password',
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade500),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Confirm Password';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        _confirmPassword = value;
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  /*ปุ่ม SignUp*/
                  _isLoading
                      ? CircularProgressIndicator()
                      : Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple[700]),
                            child: Text('Signup',
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            onPressed: () async {
                              var services = FirebaseServices();
                              var controller = DealController(services);
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                UserCredential userCredential;
                                userCredential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _email!, password: _password!);

                                await FirebaseFirestore.instance
                                    .collection('group_users')
                                    .doc(userCredential.user!.uid)
                                    .set({
                                  /*mapping*/
                                  'uid': userCredential.user!.uid,
                                  'fullname': _fullname,
                                  'email': _email,
                                  'phoneNo': _phoneNo,
                                  'image':
                                      'https://firebasestorage.googleapis.com/v0/b/is-project01.appspot.com/o/user_image%2Fuser03.png?alt=media&token=9b32b994-d8f1-4982-8145-e8b890d3ccbc',
                                  'isLoggedIn': false,
                                });
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Signup Successful! Lets Join WeDeal')));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DealPage()));
                              }
                            },
                          ),
                        ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.deepPurple,
                            textStyle: const TextStyle(
                                fontSize: 16, color: Colors.deepPurple)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: const Text("Sign In"),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "- Or -",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Sign Up with",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        //ใส่รูป
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 55.0,
                                width: 55.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage("image/facebook.png"),
                                )),
                              ),
                              Container(
                                height: 55.0,
                                width: 55.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage("image/google.png"),
                                )),
                              ),
                              Container(
                                height: 55.0,
                                width: 55.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage("image/line.png"),
                                )),
                              ),
                              Container(
                                height: 55.0,
                                width: 55.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage("image/twitter.png"),
                                )),
                              ),
                            ])
                      ]),
                ],
              )))),
    );
  }
}
