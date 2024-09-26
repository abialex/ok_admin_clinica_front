// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import '../ubicacion/ubicacion_dto.dart';
part 'asistente_dto.g.dart';

@JsonSerializable() //extends Asistente
class AsistenteDto {
  final int id;
  final int usuario_id;
  final String usuario_username;
  final UbicacionDto ubicacion;
  final String dni;
  final String nombres;
  final String apellidos;
  final String? celular;
  final String? domicilio;
  final String? fechaNacimiento;
  DateTime? get fechaNacimientoDate => fechaNacimiento != null ? DateTime.parse(fechaNacimiento!) : null;

  AsistenteDto({
    required this.id,
    required this.usuario_id,
    required this.usuario_username,
    required this.ubicacion,
    required this.dni,
    required this.nombres,
    required this.apellidos,
    this.celular,
    this.domicilio,
    this.fechaNacimiento,
  });
  //fromJson
  factory AsistenteDto.fromJson(Map<String, dynamic> map) => _$AsistenteDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$AsistenteDtoToJson(this);
}
