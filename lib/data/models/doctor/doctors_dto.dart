// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/doctor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'doctors_dto.g.dart';

@JsonSerializable()
class DoctorsDto extends Doctor {
  final int usuario_id;
  final String username;

  DoctorsDto({
    required super.id,
    required this.usuario_id,
    required this.username,
    required super.nombres,
    required super.apellidos,
  }) : super(usuarioId: usuario_id, usuarioUsername: username);

  //fromJson
  factory DoctorsDto.fromJson(Map<String, dynamic> map) =>
      _$DoctorsDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$DoctorsDtoToJson(this);
}
