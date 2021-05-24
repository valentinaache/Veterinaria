import 'package:flutter/material.dart';
import 'package:veterinaria/common_widgets/custom_appbar.dart';
import 'package:veterinaria/screens/auth/form.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            CustomAppBar(true),
            MyCustomForm(),
          ],
        ),
      ),
    );
  }
}
