class DoctorCredentialsViewModel {
  final String username;
  final String password;
  DoctorCredentialsViewModel({
    required this.username,
    required this.password,
  });
}

class DoctorsViewModel {
  final int usuarioId;
  final String username;
  final int id;
  final String nombres;
  final String apellidos;

  DoctorsViewModel({
    required this.usuarioId,
    required this.username,
    required this.id,
    required this.nombres,
    required this.apellidos,
  });

  @override
  String toString() {
    // TODO: implement toString
    return nombres;
  }
}

class DoctorViewModel {
  final int id;
  final int usuarioId;
  final String username;
  final String dni;
  final String nombres;
  final String apellidos;
  final List<int> ubicacionesId;
  final String? celular;
  final String? domicilio;
  final DateTime? fechaNacimiento;
  final String? especialidad;

  DoctorViewModel({
    required this.usuarioId,
    required this.username,
    required this.id,
    required this.nombres,
    required this.apellidos,
    required this.dni,
    required this.ubicacionesId,
    this.celular,
    this.domicilio,
    this.fechaNacimiento,
    this.especialidad,
  });
}

class DoctorCreateViewModel {
  final String dni;
  final String nombres;
  final String apellidos;
  final String celular;
  final DateTime fechaNacimiento;
  final List<int> ubicacionesId;

  DoctorCreateViewModel({
    required this.dni,
    required this.nombres,
    required this.apellidos,
    required this.celular,
    required this.fechaNacimiento,
    required this.ubicacionesId,
  });
}

class DoctorUpdateViewModel {
  final int id;
  final String dni;
  final String nombres;
  final String apellidos;
  final String celular;
  final DateTime fechaNacimiento;
  final List<int>? ubicacionesId;

  DoctorUpdateViewModel({
    required this.id,
    required this.dni,
    required this.nombres,
    required this.apellidos,
    required this.celular,
    required this.fechaNacimiento,
    required this.ubicacionesId,
  });
}
