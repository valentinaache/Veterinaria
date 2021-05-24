import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veterinaria/model/clinic_history.dart';
import '../../common_widgets/custom_appbar.dart';
import 'package:http/http.dart' as http;

class PetIn extends StatefulWidget {
  @override
  _PetInState createState() => _PetInState();
}

class _PetInState extends State<PetIn> {
 TextStyle decor = GoogleFonts.acme(
    color: Colors.white,
    fontSize: 15,
  );
  final _formKey = GlobalKey<FormState>();
  final petIdController = TextEditingController();
  final dateController = TextEditingController();
  final propsController = TextEditingController();
  final beforeController = TextEditingController();

    Future<dynamic> registerRegistry(Registry registro) async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/api/registro/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nombre': registro.nombre,
        'propiedades': registro.propiedades,
        'rutaImagenEntrada': registro.rutaImagenEntrada,
        'rutaImagenSalida': registro.rutaImagenSalida
      }),
    );
    return jsonDecode(response.body)['insertId'];
    //Me devuelve el id del animal
  }

  Future<dynamic> registerClinicH(ClinicHistory clinic) async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/api/historiaClinica/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'idRegistro': clinic.idRegistro.toString(),
        'idAnimal': clinic.idAnimal.toString(),
      }),
    );
    return jsonDecode(response.body)['insertId'];
    //Me devuelve el id del animal
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            Container(
              width: 400,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 45.0),
                      TextFormField(
                        controller: petIdController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Id Animal",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      TextFormField(
                        controller: dateController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Fecha",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      TextFormField(
                        controller: propsController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Propiedades",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      TextFormField(
                        controller: beforeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Subir foto, antes",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                    
                      Container(
                        height: 50,
                        width: 120,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.brown[800],
                        ),




                        

                        child: InkWell(
                          onTap: () async {
                            if (this._formKey.currentState!.validate()) {
                              Registry registry = new Registry(
                                  0,
                                  "Ingreso Peluqueria",
                                  this.propsController.text,
                                  this.beforeController.text,
                                  "No Valido Aun");
                              int id = await this.registerRegistry(registry);
                              registry.idRegistro = id;
                              ClinicHistory clinic = new ClinicHistory(
                                  id,
                                  int.parse(this.petIdController.text));
                              this.registerClinicH(clinic);
                            }
                          },
                          child: Center(
                            child: Text(
                              "Guardar",
                              style: decor,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 120,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.brown[800],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/barber');
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
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}