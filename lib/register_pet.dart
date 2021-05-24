import 'package:flutter/material.dart';
import 'package:veterinaria/common_widgets/custom_appbar.dart';


class RegisterPet extends StatefulWidget {
  @override
  _RegisterPetState createState() => _RegisterPetState();
}

class _RegisterPetState extends State<RegisterPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          
        ],
      ),
    );
  }
}