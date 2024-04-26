import 'package:admin_clinica_front/dominio/entities/ubicacion.dart';

class Doctor {
  final int? id;
  final int? usuarioId;
  final String? usuarioUsername;
  final List<Ubicacion>? ubicaciones;
  final String? dni;
  final String? nombres;
  final String? apellidos;
  final String? celular;
  final String? domicilio;
  final DateTime? fechaNacimiento;
  final dynamic especialidad;

  Doctor({
    this.id,
    this.usuarioId,
    this.usuarioUsername,
    this.ubicaciones,
    this.dni,
    this.nombres,
    this.apellidos,
    this.celular,
    this.domicilio,
    this.fechaNacimiento,
    this.especialidad,
  });

  // factory Doctor.fromJson(Map<String, dynamic> json) {
  //   List<Ubicacion>? ubicacionesList = [];
  //   if (json['ubicaciones'] != null) {
  //     json['ubicaciones'].forEach((ubicacionJson) {
  //       ubicacionesList.add(Ubicacion.fromJson(ubicacionJson));
  //     });
  //   }
  //   return Doctor(
  //     id: json['id'],
  //     usuarioId: json['usuario_id'],
  //     usuarioUsername: json['usuario_username'],
  //     ubicaciones: ubicacionesList,
  //     dni: json['dni'],
  //     nombres: json['nombres'],
  //     apellidos: json['apellidos'],
  //     celular: json['celular'],
  //     domicilio: json['domicilio'],
  //     fechaNacimiento: json['fechaNacimiento'] != null ? DateTime.parse(json['fechaNacimiento']) : null,
  //     especialidad: json['especialidad'],
  //   );
  // }
}



  // factory Ubicacion.fromJson(Map<String, dynamic> json) {
  //   return Ubicacion(
  //     id: json['id'],
  //     nombre: json['nombre'],
  //   );
  // }

