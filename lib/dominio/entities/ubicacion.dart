class Ubicacion {
  final int? id;
  final String? nombre;

  Ubicacion({
    this.id,
    this.nombre,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}
