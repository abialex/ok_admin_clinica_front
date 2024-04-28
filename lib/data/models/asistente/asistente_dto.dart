// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/asistente.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../ubicacion/ubicacion_dto.dart';
part 'asistente_dto.g.dart';

@JsonSerializable()
class AsistenteDto extends Asistente {
  final int usuario_id;
  final String usuario_username;

  AsistenteDto({
    required super.id,
    required this.usuario_id,
    required this.usuario_username,
    required UbicacionDto super.ubicacion,
    required super.dni,
    required super.nombres,
    required super.apellidos,
    super.celular,
    super.domicilio,
    super.fechaNacimiento,
  }) : super(usuarioId: usuario_id, usuarioUsername: usuario_username);

  //fromJson
  factory AsistenteDto.fromJson(Map<String, dynamic> map) =>
      _$AsistenteDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$AsistenteDtoToJson(this);
}
