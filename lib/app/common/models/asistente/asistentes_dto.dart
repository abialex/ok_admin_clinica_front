// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'asistentes_dto.g.dart';

@JsonSerializable()
class AsistentesDto {
  final int id;
  final String nombres;
  final String apellidos;
  final int usuario_id;
  final String username;

  AsistentesDto({
    required this.id,
    required this.usuario_id,
    required this.username,
    required this.nombres,
    required this.apellidos,
  });
  //fromJson
  factory AsistentesDto.fromJson(Map<String, dynamic> map) =>
      _$AsistentesDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$AsistentesDtoToJson(this);
}
