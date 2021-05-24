import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veterinaria/common_widgets/custom_appbar.dart';

//Doctores, Usuarios, Mascotas


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextStyle decor = GoogleFonts.acme(
    color: Colors.white,
    fontSize: 30,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
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
                      "Registra una Mascota",
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
                      "Registra un Doctor",
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
                      "Registra un Cliente",
                      style: decor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: Container(
                height: 40,
                width: 200,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.brown[800],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/main_menu');
                  },
                  child: Center(
                    child: Text(
                      "Volver",
                      textAlign: TextAlign.center,
                      style: decor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}