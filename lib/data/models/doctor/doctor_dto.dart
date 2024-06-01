// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import '../ubicacion/ubicacion_dto.dart';
part 'doctor_dto.g.dart';

@JsonSerializable() // extends doctor
class DoctorDto {
  final int id;
  final int usuario_id;
  final String usuario_username;
  final String dni;
  final String nombres;
  final String apellidos;
  final List<UbicacionDto> ubicaciones;
  final String celular;
  final String? domicilio;
  final String fechaNacimiento;
  final String? especialidad;
  final bool is_active;

  DoctorDto({
    required this.id,
    required this.usuario_id,
    required this.usuario_username,
    required this.ubicaciones,
    required this.dni,
    required this.nombres,
    required this.apellidos,
    required this.celular,
    this.domicilio,
    required this.fechaNacimiento,
    this.especialidad,
    required this.is_active,
  });
  //fromJson
  factory DoctorDto.fromJson(Map<String, dynamic> map) => _$DoctorDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$DoctorDtoToJson(this);
}
