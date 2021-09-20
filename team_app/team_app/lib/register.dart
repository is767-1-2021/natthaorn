import 'package:flutter/material.dart';
import 'package:team_app/nav.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("SignUp"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "WeDeal",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black87),
                  ),

                  //Text("Name", style: TextStyle(fontSize: 16)),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Please input your Name',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Text("Phone Number", style: TextStyle(fontSize: 16)),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Please input your Phone Number',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Text("Email", style: TextStyle(fontSize: 16)),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Please input your Email',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Text("Password", style: TextStyle(fontSize: 16)),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Please input your Password',
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)))),
                  SizedBox(
                    height: 10,
                  ),
                  //Text("Confirm Password", style: TextStyle(fontSize: 16)),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Please input your Confirm Password',
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)))),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.indigo.shade900),
                      child: Text("Sign Up", style: TextStyle(fontSize: 18)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Nav()));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
