import 'package:admin_clinica_front/app/dominio/entities/ubicacion.dart';

class Asistente {
  final int? id;
  final int? usuarioId;
  final String? usuarioUsername;
  final Ubicacion? ubicacion;
  final String? dni;
  final String? nombres;
  final String? apellidos;
  final String? celular;
  final String? domicilio;
  final DateTime? fechaNacimiento;
  final int? tipo;

  Asistente({
    this.id,
    this.usuarioId,
    this.usuarioUsername,
    this.ubicacion,
    this.dni,
    this.nombres,
    this.apellidos,
    this.celular,
    this.domicilio,
    this.fechaNacimiento,
    this.tipo,
  });

  // factory UserDetail.fromJson(Map<String, dynamic> json) {
  //   return UserDetail(
  //     id: json['id'],
  //     usuarioId: json['usuario_id'],
  //     usuarioUsername: json['usuario_username'],
  //     ubicacion: json['ubicacion'] != null ? Ubicacion.fromJson(json['ubicacion']) : null,
  //     dni: json['dni'],
  //     nombres: json['nombres'],
  //     apellidos: json['apellidos'],
  //     celular: json['celular'],
  //     domicilio: json['domicilio'],
  //     fechaNacimiento: json['fechaNacimiento'] != null ? DateTime.parse(json['fechaNacimiento']) : null,
  //     tipo: json['tipo'],
  //   );
  // }
}
