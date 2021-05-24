import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veterinaria/common_widgets/custom_appbar.dart';

class Vet extends StatefulWidget {
  @override
  _VetState createState() => _VetState();
}

class _VetState extends State<Vet> {
  TextStyle decor = GoogleFonts.acme(
    color: Colors.white,
    fontSize: 15,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            children: [
              CustomAppBar(),
               Container(
      width: 400,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Form(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 45.0),
              TextFormField(
                  decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Id Mascota",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 40,
                width: 180,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Colors.brown[800],
                ),
                child: InkWell(
                  onTap: () {
                    
                  },
                  child: Center(
                    child: Text(
                      "Buscar Historia Clínica",
                      textAlign: TextAlign.center,
                      style: decor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 40,
                width: 180,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  color: Colors.brown[800],
                ),
                child: InkWell(
                  onTap: () {
                    
                  },
                  child: Center(
                    child: Text(
                      "Crear Historia Clínica",
                      textAlign: TextAlign.center,
                      style: decor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 40,
                width: 180,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
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


            ],
          ),
        ),
      ),
               )
            ]
              ),
            
    );
            
  }}