class AnimalType {
  int id;
  String type;
  AnimalType(this.id, this.type);

  factory AnimalType.fromJson(Map<String, dynamic> json) {
    return AnimalType(json['idtipoAnimal'], json['nombreTipo']);
  }
}
