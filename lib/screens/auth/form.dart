import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../common_widgets/validators.dart';

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

  TextStyle decor = GoogleFonts.acme(
    color: Colors.white,
    fontSize: 15,
  );

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
              Text(
                "Inicio de Sesión",
                style: GoogleFonts.acme(
                  fontSize: 30,
                  color: Colors.brown[800],
                ),
              ),
              SizedBox(height: 45.0),
              TextFormField(
                style: style,
                controller: usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Coloca algo de texto';
                  }
                  if (!value.isValidPhone) {
                    return 'Por favor ingresa solamente numeros';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Ingresa tu documento",
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
                    return 'Por favor coloca una contraseña';
                  }
                  if (!value.isValidPassword) {
                    return 'Por favor coloca una contraseña válida, recuerda: minimo 8 caracteres, incluye caracteres alfanumericos y especiales';
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
                  color: Colors.brown[800],
                ),
                child: InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      List<dynamic> data = await this.signIn(
                          usernameController.text, passwordController.text);
                      if (data.isEmpty) {
                        //No pasa
                      } else {
                        Navigator.pushNamed(context, '/main_menu');
                      }
                    }
                  },
                  child: Center(
                    child: Text(
                      "Iniciar Sesión",
                      textAlign: TextAlign.center,
                      style: decor,
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
