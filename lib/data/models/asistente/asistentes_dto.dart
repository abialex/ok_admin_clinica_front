// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/asistente.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'asistentes_dto.g.dart';

@JsonSerializable()
class AsistentesDto extends Asistente {
  final int usuario_id;
  final String username;

  AsistentesDto({
    required super.id,
    required this.usuario_id,
    required this.username,
    required super.nombres,
    required super.apellidos,
  }) : super(usuarioId: usuario_id, usuarioUsername: username);

  //fromJson
  factory AsistentesDto.fromJson(Map<String, dynamic> map) =>
      _$AsistentesDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$AsistentesDtoToJson(this);
}
