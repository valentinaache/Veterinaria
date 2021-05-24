import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final signIn;
  CustomAppBar(this.signIn);
  TextStyle stiloOpciones = GoogleFonts.acme(
    color: Colors.white,
    fontSize: 20,
  );
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.brown,
      height: height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 40,
            ),
            child: Image.asset(
              "assets/img/logo.png",
              width: 50,
              height: 50,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/sign_in');
                },
                child: Text(
                  this.signIn?"Ingresar":"Cerrar Sesion",
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
