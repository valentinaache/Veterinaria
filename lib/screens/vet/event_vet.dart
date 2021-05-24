import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veterinaria/common_widgets/custom_appbar.dart';
import 'package:http/http.dart' as http;
import 'package:veterinaria/model/clinic_history.dart';

class EventVet extends StatefulWidget {
  @override
  _EventVetState createState() => _EventVetState();
}

class _EventVetState extends State<EventVet> {
  final petIdController = TextEditingController();
  final regIdController = TextEditingController();
  final regNameController = TextEditingController();
  final regPropController = TextEditingController();
  final regPathEController = TextEditingController();
  final regPathSController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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

  TextStyle decor = GoogleFonts.acme(
    color: Colors.white,
    fontSize: 15,
  );
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
                          hintText: "Identificacion de la Mascota",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      TextFormField(
                        controller: regNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Nombre del Registro",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      TextFormField(
                        controller: regPropController,
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
                        controller: regPathSController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Ruta de Imagen Salida",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      TextFormField(
                        controller: regPathEController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Ruta de Imagen Entrada",
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
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Colors.brown[800],
                        ),
                        child: InkWell(
                          onTap: () async {
                            if (this._formKey.currentState!.validate()) {
                              Registry registry = new Registry(
                                  0,
                                  this.regNameController.text,
                                  this.regPropController.text,
                                  this.regPathEController.text,
                                  this.regPathSController.text);
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
                              "Crear Historia",
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
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: Colors.brown[800],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/vet');
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
