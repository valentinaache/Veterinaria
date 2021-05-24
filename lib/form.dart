import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
// email RegExp
  final _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // uniquely identifies a Form
  final _formKey = GlobalKey<FormState>();
  Future<List<dynamic>> signIn(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/api/doctor/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'idPersona': username, 'password': password}),
    );
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String validatePassword(String value) {
      String message = "";
      if (!(value.length > 5) && value.isNotEmpty) {
        message = "Password should contain more than 5 characters";
      }
      return message;
    }

    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.5,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 45.0),
              TextFormField(
                style: style,
                controller: usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              TextFormField(
                obscureText: true,
                style: style,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: passwordController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Password",
                  errorText: validatePassword(passwordController.text),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              Container(
                height: 40,
                width: width * 0.25,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.grey.shade300,
                ),
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      this
                          .signIn(
                              usernameController.text, passwordController.text)
                          .then((value) => {
                                if (value.isEmpty)
                                  {
                                    print("empty"),
                                  }
                              });
                    }
                  },
                  child: Center(
                    child: Text(
                      "Ingresa a tu red",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
