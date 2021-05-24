import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veterinaria/common_widgets/custom_appbar.dart';

class MainMenu extends StatelessWidget {
  TextStyle decor = GoogleFonts.acme(
    color: Colors.white,
    fontSize: 40,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(30),
                  child: Container(
                  color: Colors.brown[800],
                  width: 200,
                  child: Text(
                    "Registros",
                    style: decor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/vet');
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(30),
                              child: Container(
                  color: Colors.brown[800],
                  width: 200,
                  child: Text(
                    "Veterinaria",
                    style: decor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/barber');
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(30),
                              child: Container(
                  color: Colors.brown[800],
                  width: 200,
                  child: Text(
                    "Peluquería",
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
