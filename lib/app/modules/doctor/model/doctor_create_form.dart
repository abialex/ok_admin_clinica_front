class DoctorCreateForm {
  String dni;
  String nombres;
  String apellidos;
  String celular;
  DateTime fechaNacimiento;
  List<int> ubicacionesId;

  DoctorCreateForm({
    required this.dni,
    required this.nombres,
    required this.apellidos,
    required this.celular,
    required this.fechaNacimiento,
    required this.ubicacionesId,
  });
}
