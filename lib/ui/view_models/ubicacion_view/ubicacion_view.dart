class UbicacionsViewModel {
  final int id;
  final String nombre;

  UbicacionsViewModel({
    required this.nombre,
    required this.id,
  });

  @override
  String toString() {
    // TODO: implement toString
    return nombre;
  }
}
