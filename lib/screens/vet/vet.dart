import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veterinaria/common_widgets/custom_appbar.dart';
import 'package:veterinaria/model/clinic_history.dart';
import 'package:http/http.dart' as http;

class Vet extends StatefulWidget {
  @override
  _VetState createState() => _VetState();
}

class _VetState extends State<Vet> {
  final petIdController = TextEditingController();
  bool searchENA = false;
  TextStyle decor = GoogleFonts.acme(
    color: Colors.white,
    fontSize: 15,
  );
  bool canCreate = false;
  Future<List<ClinicHistory>> fetchClinicHistory(String idMascota) async {
    String id = idMascota;

    final response = await http
        .get(Uri.parse('http://localhost:5000/api/historiaClinica/${id}'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<ClinicHistory>((json) => ClinicHistory.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load clinic history');
    }
  }

  Future<List<Registry>> fetchRegistry(String idMascota) async {
    String id = idMascota;
    final response =
        await http.get(Uri.parse('http://localhost:5000/api/registro/${id}'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Registry>((json) => Registry.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load registry');
    }
  }

  @override
  void dispose() {
    petIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
                      color: Colors.brown[800],
                    ),
                    child: InkWell(
                      onTap: () async {
                        List<ClinicHistory> history = await this
                            .fetchClinicHistory(this.petIdController.text);
                        if (history.isEmpty) {
                          setState(() {
                            this.canCreate = true;
                          });
                        } else {
                          setState(() {
                            this.canCreate = false;
                            this.searchENA = true;
                          });
                        }
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
                      color:
                          canCreate ? Colors.brown[800] : Colors.grey.shade300,
                    ),
                    child: InkWell(
                      onTap: this.canCreate
                          ? () {
                              Navigator.pushNamed(context, '/vet_form');
                            }
                          : null,
                      child: Center(
                        child: Text(
                          "Crear Historia Clínica",
                          textAlign: TextAlign.center,
                          style: decor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 180,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color:
                          canCreate ? Colors.grey.shade300:Colors.brown[800]  ,
                    ),
                    child: InkWell(
                      onTap: this.canCreate
                          ? null
                          : () {
                              Navigator.pushNamed(context, '/vet_event');
                            },
                      child: Center(
                        child: Text(
                          "Añadir Registro a Historia",
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
        ),
        this.searchENA
            ? FutureBuilder<List<Registry>>(
                future: this.fetchRegistry(this.petIdController.text),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'idRegistro',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Nombre',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Propiedades',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Ruta Imagen Entrada',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Ruta Imagen Salida',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: snapshot.data!
                            .map(
                              (data) => DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      data.idRegistro.toString(),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      data.nombre,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      data.propiedades,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      data.rutaImagenEntrada,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      data.rutaImagenSalida,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList());
                  } else if (snapshot.hasError) {
                    Text("Algo fallo :((");
                  }
                  return Text("Estamos Cargando la Información");
                },
              )
            : Text("Los resultados de tus busquedas Aparecerán aca"),
      ]),
    );
  }
}
