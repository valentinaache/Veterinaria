import 'package:flutter/material.dart';
import 'package:veterinaria/screens/hairdressing/barber.dart';
import 'package:veterinaria/screens/main_menu.dart';
import 'package:veterinaria/screens/home_page.dart';
import 'package:veterinaria/screens/register/landing_register.dart';
import 'package:veterinaria/screens/register/register_pet.dart';
import 'package:veterinaria/screens/hairdressing/pet_out.dart';
import 'package:veterinaria/screens/auth/sign_in.dart';
import 'package:veterinaria/screens/vet/event_vet.dart';
import 'package:veterinaria/screens/vet/vet.dart';
import 'package:veterinaria/screens/vet/registry_vet.dart';
import 'package:veterinaria/screens/hairdressing/pet_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veterinaria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/sign_in': (context) => SignIn(),
        '/main_menu': (context) => MainMenu(),
        //Inicio de Registro
        '/register': (context) => LandingRegister(),
        '/register_pet': (context) => RegisterPet(),
        //Fin de Registro
        //Veterinaria Inicio
        '/vet': (context) => Vet(),
        '/vet_form': (context) => FormVet(),
        '/vet_event': (context) => EventVet(),
        //Veterinaria Final
        '/barber': (context) => Barber(),
        '/pet_in': (context) => PetIn(),
        '/pet_out': (context) => PetOut(),
      },
    );
  }
}
