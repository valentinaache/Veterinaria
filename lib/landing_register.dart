import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veterinaria/common_widgets/custom_appbar.dart';
import 'package:http/http.dart' as http;
import 'package:veterinaria/model/animalType.dart';
import 'package:veterinaria/model/raza.dart';

//Doctores, Usuarios, Mascotas

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextStyle decor = GoogleFonts.acme(
    color: Colors.white,
    fontSize: 40,
  );
  String dropdownType = "1";
  String dropdownRaza = "1";
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
// email RegExp
  final _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final petNameController = TextEditingController();
  final petBirthController = TextEditingController();

  // uniquely identifies a Form
  final _formKey = GlobalKey<FormState>();
  Future<List<AnimalType>> fetchAnimalType() async {
    final response =
        await http.get(Uri.parse('http://localhost:5000/api/tipoAnimal/'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<AnimalType>((json) => AnimalType.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load topics');
    }
  }

  Future<List<Raza>> fetchRaza(String idAnimalType) async {
    String tipo = idAnimalType;
    final response = await http
        .get(Uri.parse('http://localhost:5000/api/tipoAnimal/tipo/${tipo}'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      print(response.body);
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Raza>((json) => Raza.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load razas');
    }
  }

  Future<dynamic> registerPet(String name, String fechaNacimiento) async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/api/animal/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'nombre': name, 'fechaNacimiento': fechaNacimiento}),
    );
    return jsonDecode(response.body)['insertId'];
    //Me devuelve el id del animal
  }

  Future<List<dynamic>> checkRazaTipo(
      String idRaza, String idTipoAnimal) async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/api/razaTipo/searchesp/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'idRaza': idRaza, 'idtipoAnimal': idTipoAnimal}),
    );
    return jsonDecode(response.body);
    //Me deberia devolver un arreglo con la raza tipo de eso, si no existe, debo crear una raza tipo
  }

  Future<dynamic> createRazaTipo(String idRaza, String idTipoAnimal) async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/api/razaTipo/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'idRaza': idRaza, 'idtipoAnimal': idTipoAnimal}),
    );
    return jsonDecode(response.body)['insertId'];
    //Creo la raza tipo ya que no existe
  }

  Future<List<dynamic>> registerTypeRazaPet(
      String idRazaTipo, String idAnimal) async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/api/tipoAnimal/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'idRazaTipo': idRazaTipo, 'idAnimal': idAnimal}),
    );
    //Registro finalmente el animal con su raza y su tipo
    return jsonDecode(response.body);
  }

  @override
  void dispose() {
    petNameController.dispose();
    petBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Text(
            "Registra a tu mascota",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Container(
            width: width * 0.5,
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
                      style: style,
                      controller: petNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Nombre de la mascota",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      style: style,
                      controller: petBirthController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Fecha de Nacimiento",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    FutureBuilder<List<AnimalType>>(
                      future: this.fetchAnimalType(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButton<String>(
                            value: dropdownType,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownType = newValue!;
                              });
                            },
                            items: snapshot.data?.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item.type),
                                value: item.id.toString(),
                              );
                            }).toList(),
                          );
                        } else if (snapshot.hasError) {
                          return Text("No funciona socio");
                        }
                        return Text("No tenemos aun ninguna categoría llenada");
                      },
                    ),
                    SizedBox(height: 25.0),
                    FutureBuilder<List<Raza>>(
                      future: this.fetchRaza(this.dropdownType),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButton<String>(
                            value: dropdownRaza,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownRaza = newValue!;
                              });
                            },
                            items: snapshot.data?.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item.name),
                                value: item.id.toString(),
                              );
                            }).toList(),
                          );
                        } else if (snapshot.hasError) {
                          return Text("No funciona socio");
                        }
                        return Text("No tenemos aun ninguna categoría llenada");
                      },
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Container(
                      height: 40,
                      width: width * 0.25,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.grey.shade300,
                      ),
                      child: InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            int petId = await this.registerPet(
                                petNameController.text,
                                petBirthController.text);
                            List<dynamic> razaTipo = await this
                                .checkRazaTipo(dropdownRaza, dropdownType);
                            String idRaza = "";
                            if (razaTipo.isEmpty) {
                              int razaNew = await this
                                  .createRazaTipo(dropdownRaza, dropdownType);
                              idRaza = razaNew.toString();
                            } else {
                              //Obtener Id Raza Tipo
                              idRaza = razaTipo.first['idRaza'];
                            }
                            this.registerTypeRazaPet(idRaza, petId.toString());
                            
                          }
                        },
                        child: Center(
                          child: Text(
                            "Ingresa a tu red",
                            textAlign: TextAlign.center,
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
            ),
          ),
        ],
      ),
    );
  }
}
