import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veterinaria/common_widgets/custom_appbar.dart';

class LandingRegister extends StatefulWidget {
  @override
  _LandingRegisterState createState() => _LandingRegisterState();
}

class _LandingRegisterState extends State<LandingRegister> {
  TextStyle decor = GoogleFonts.acme(
    color: Colors.white,
    fontSize: 40,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(false),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/register_pet');
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  color: Colors.brown[800],
                  width: 200,
                  child: Text(
                    "Registro de Mascotas",
                    style: decor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  color: Colors.brown[800],
                  width: 200,
                  child: Text(
                    "Registro de Dueño",
                    style: decor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/main_menu');
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  color: Colors.brown[800],
                  width: 200,
                  child: Text(
                    "Volver",
                    style: decor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
