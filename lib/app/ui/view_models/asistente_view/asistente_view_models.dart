class AsistenteCredentialsViewModel {
  final String username;
  final String password;
  AsistenteCredentialsViewModel({
    required this.username,
    required this.password,
  });
}

class AsistentesViewModel {
  final int usuarioId;
  final String username;
  final int id;
  final String nombres;
  final String apellidos;

  AsistentesViewModel({
    required this.usuarioId,
    required this.username,
    required this.id,
    required this.nombres,
    required this.apellidos,
  });
}

class AsistenteViewModel {
  final int id;
  final int usuarioId;
  final String username;
  final String dni;
  final String nombres;
  final String apellidos;
  final int ubicacionId;
  final String? celular;
  final String? domicilio;
  final DateTime? fechaNacimiento;

  AsistenteViewModel({
    required this.usuarioId,
    required this.username,
    required this.id,
    required this.nombres,
    required this.apellidos,
    required this.dni,
    required this.ubicacionId,
    this.celular,
    this.domicilio,
    this.fechaNacimiento,
  });
}

class AsistenteCreateViewModel {
  final String dni;
  final String nombres;
  final String apellidos;
  final String celular;
  final String fechaNacimiento;
  final int tipo;
  final int ubicacionId;

  AsistenteCreateViewModel({
    required this.dni,
    required this.nombres,
    required this.apellidos,
    required this.celular,
    required this.fechaNacimiento,
    required this.ubicacionId,
    required this.tipo,
  });
}

class AsistenteUpdateViewModel {
  final int id;
  final String dni;
  final String nombres;
  final String apellidos;
  final String celular;
  final String fechaNacimiento;
  final int ubicacionId;
  final int tipo;

  AsistenteUpdateViewModel({
    required this.id,
    required this.dni,
    required this.nombres,
    required this.apellidos,
    required this.celular,
    required this.fechaNacimiento,
    required this.ubicacionId,
    required this.tipo,
  });
}
