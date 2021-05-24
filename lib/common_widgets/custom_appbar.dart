import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  TextStyle stiloOpciones = GoogleFonts.aleo(
    fontWeight: FontWeight.w200

  );
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.red,
      height: height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 40,
            ),
            child: Image.asset(
              "assets/img/bell.png",
              width: width * 0.125,
              height: width * 0.125,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                child: Text(
                  "Inicio",
                  style: stiloOpciones,
                ),
              ),
              SizedBox(
                width: width * 0.04,
              ),
              InkWell(
                child: Text(
                  "Acerca de Nosotros",
                  style: stiloOpciones,
                ),
              ),
              SizedBox(
                width: width * 0.04,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/sign_in');
                },
                child: Text(
                  "Ingresar",
                  style: stiloOpciones,
                ),
              ),
              SizedBox(
                width: width * 0.04,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
