import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veterinaria/common_widgets/custom_appbar.dart';

class Barber extends StatefulWidget {
  @override
  _BarberState createState() => _BarberState();
}

class _BarberState extends State<Barber> {
  TextStyle decor = GoogleFonts.acme(
    color: Colors.white,
    fontSize: 24,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
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
                  Navigator.pushNamed(context, '/pet_in');
                },
                child: Center(
                  child: Text(
                    "Ingreso",
                    textAlign: TextAlign.center,
                    style: decor,
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
                  Navigator.pushNamed(context, '/pet_out');
                },
                child: Center(
                  child: Text(
                    "Salida",
                    textAlign: TextAlign.center,
                    style: decor,
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
    );
  }
}
