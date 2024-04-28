// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/doctor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../ubicacion/ubicacion_dto.dart';
part 'doctor_dto.g.dart';

@JsonSerializable()
class DoctorDto extends Doctor {
  final int usuario_id;
  final String usuario_username;

  DoctorDto({
    required super.id,
    required this.usuario_id,
    required this.usuario_username,
    required List<UbicacionDto> super.ubicaciones,
    required super.dni,
    required super.nombres,
    required super.apellidos,
    super.celular,
    super.domicilio,
    super.fechaNacimiento,
    super.especialidad,
  }) : super(usuarioId: usuario_id, usuarioUsername: usuario_username);

  //fromJson
  factory DoctorDto.fromJson(Map<String, dynamic> map) =>
      _$DoctorDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$DoctorDtoToJson(this);
}
