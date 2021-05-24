//Historia Clinica y Registro strong types class

class ClinicHistory {
  int idRegistro;
  int idAnimal;
  ClinicHistory(this.idRegistro, this.idAnimal);

  factory ClinicHistory.fromJson(Map<String, dynamic> json) {
    return ClinicHistory(json['idRegistro'], json['idAnimal']);
  }
}

class Registry {
  int idRegistro;
  String nombre;
  String propiedades;
  String rutaImagenEntrada;
  String rutaImagenSalida;
  Registry(this.idRegistro,this.nombre, this.propiedades,
      this.rutaImagenEntrada, this.rutaImagenSalida);
  factory Registry.fromJson(Map<String, dynamic> json) {
    return Registry(json['idRegistro'], json['nombre'], json['propiedades'],
        json['rutaImagenEntrada'], json['rutaImagenSalida']);
  }
}
