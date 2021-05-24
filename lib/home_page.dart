import 'package:flutter/material.dart';
import 'package:veterinaria/common_widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle stiloOpciones = TextStyle(
    color: Colors.white,
    fontSize: 18,
  );
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            CustomAppBar(),
          ],
        ),
      ),
    );
  }
}
