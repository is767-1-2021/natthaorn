import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _emailString = '';
  var _passString = '';
  var _userNameString = '';
  var _isLoading = false;

  /*สร้าง form ให้เก็บค่าที่สมัคร*/
  final _formKey = GlobalKey<FormState>();

  /*Add Image file from camera*/
  File? _imageFile;

  /*function เลือกภาพจากกล้อง*/
  void _takePicture() async {
    final _picker = ImagePicker();
    final _pickedImage =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 20);

    /*setState for ImageFile*/
    setState(() {
      _imageFile = File(_pickedImage!.path);
    });
  }

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
    if (_imageFile == null) {
      return;
    }

    _formKey.currentState!.save();

    /*set เวลากดปุ่ม signUp จะให้ขึ้นเป็น CircularProgressIndicator*/
    setState(() {
      _isLoading = true;
    });

    /*Detail of User ก็คือรูป*/
    UserCredential userCredential;

    /*save เข้า firebaseAuth*/
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailString, password: _passString);

    /*เก็บรูปใน storage โดยสร้าง Folder 'user_image ขึ้นมาแล้วก็เซฟรูปเป็น 'uid'.jpg*/
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child(userCredential.user!.uid + 'jpg');

    await ref.putFile(_imageFile!).whenComplete(() {});

    /*ให้ url ของรูปคือ ref*/
    final url = await ref.getDownloadURL();

    /*set each doc have unique identifier as name*/
    await FirebaseFirestore.instance
        .collection('group_users')
        .doc(userCredential.user!.uid)
        .set({
      /*mapping*/
      'userId': userCredential.user!.uid,
      'userName': _userNameString,
      'image': url,
      'email': _emailString,
    });
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
                    CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        backgroundImage:
                            /*if it has not imageFile, it could be nulled, if not it show _imageFile*/
                            _imageFile == null ? null : FileImage(_imageFile!)),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton.icon(
                      /*ให้มันไปเรียก function takepicture มา*/
                      onPressed: _takePicture,
                      icon: Icon(Icons.camera),
                      label: Text('Take picture'),
                    ),
                    SizedBox(
                      height: 30,
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
                        if (val!.isEmpty || val.length < 8) {
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
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty || val.length < 3) {
                          return 'Username must be at least 3 units';
                        }
                        /*value if true*/
                        return null;
                      },
                      onSaved: (val) {
                        _userNameString = val!;
                      },
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: Icon(Icons.person),
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
                              child: Text('Signup'),
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
