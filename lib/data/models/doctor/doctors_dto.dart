// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/doctor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'doctors_dto.g.dart';

@JsonSerializable()
class DoctorsDto {
  final int id;
  final int usuario_id;
  final String username;
  final String nombres;
  final String apellidos;

  DoctorsDto({
    required this.id,
    required this.usuario_id,
    required this.username,
    required this.nombres,
    required this.apellidos,
  });
  //fromJson
  factory DoctorsDto.fromJson(Map<String, dynamic> map) =>
      _$DoctorsDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$DoctorsDtoToJson(this);
}
