import 'package:flutter/material.dart';
import 'package:veterinaria/home_page.dart';
import 'package:veterinaria/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veterinaria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/sign_in': (context) => SignIn(),
      },
    );
  }
}
