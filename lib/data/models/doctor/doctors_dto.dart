// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'doctors_dto.g.dart';

@JsonSerializable()
class DoctorsDto {
  final int id;
  final int usuario_id;
  final String username;
  final String nombres;
  final String apellidos;
  final bool is_active;
  final String fechaNacimiento;
  final String celular;

  DoctorsDto({
    required this.id,
    required this.usuario_id,
    required this.username,
    required this.nombres,
    required this.apellidos,
    required this.is_active,
    required this.fechaNacimiento,
    required this.celular,
  });
  //fromJson
  factory DoctorsDto.fromJson(Map<String, dynamic> map) => _$DoctorsDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$DoctorsDtoToJson(this);
}
