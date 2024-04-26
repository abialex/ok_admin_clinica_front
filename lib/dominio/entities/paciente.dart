class Paciente {
  final int? id;
  final int? usuarioId;
  final String? usuarioUsername;
  final String? dni;
  final String? nombres;
  final String? apellidos;
  final String? celular;
  final String? domicilio;
  final DateTime? fechaNacimiento;
  final dynamic historialMedico;

  Paciente({
    this.id,
    this.usuarioId,
    this.usuarioUsername,
    this.dni,
    this.nombres,
    this.apellidos,
    this.celular,
    this.domicilio,
    this.fechaNacimiento,
    this.historialMedico,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'usuarioId': usuarioId,
      'usuarioUsername': usuarioUsername,
      'dni': dni,
      'nombres': nombres,
      'apellidos': apellidos,
      'celular': celular,
      'domicilio': domicilio,
      'fechaNacimiento': fechaNacimiento?.toIso8601String(),
      'historialMedico': historialMedico,
    };
  }

  // factory UserDetail.fromJson(Map<String, dynamic> json) {
  //   return UserDetail(
  //     id: json['id'],
  //     usuarioId: json['usuario_id'],
  //     usuarioUsername: json['usuario_username'],
  //     dni: json['dni'],
  //     nombres: json['nombres'],
  //     apellidos: json['apellidos'],
  //     celular: json['celular'],
  //     domicilio: json['domicilio'],
  //     fechaNacimiento: json['fechaNacimiento'] != null ? DateTime.parse(json['fechaNacimiento']) : null,
  //     historialMedico: json['historial_medico'],
  //   );
  // }
}
