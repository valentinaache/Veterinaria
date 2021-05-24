import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(true),
              Container(
                height: height,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      "assets/img/background.png",
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        "Planeta Animal 2000",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.acme(
                          fontSize: 40,
                          color: Colors.brown[800],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: 
                      
                      Container(
                        color: Colors.brown[800],
                        width: 150,
                        
                          child: Text(
                          "¡Bienvenido!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.acme(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
