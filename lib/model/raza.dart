class Raza {
  int id;
  String name;
  String properties;
  String rutaImage;
  Raza(this.id, this.name, this.properties, this.rutaImage);

  factory Raza.fromJson(Map<String, dynamic> json) {
    return Raza(json['idRaza'], json['nombre'], json['propiedades'],
        json['rutaImagen']);
  }
}
