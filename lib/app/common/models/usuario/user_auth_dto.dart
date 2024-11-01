// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/app/common/models/ubicacion/ubicacion_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_auth_dto.g.dart';

@JsonSerializable()
class UserAuthDto {
  final String username;
  final String nombres;
  final int user_id;
  final String token;
  final bool is_new_token;
  final String rol;
  final int dias_token;
  final String tipo;
  final List<UbicacionDto> ubicaciones;

  UserAuthDto({
    required this.username,
    required this.nombres,
    required this.user_id,
    required this.token,
    required this.is_new_token,
    required this.rol,
    required this.dias_token,
    required this.tipo,
    required this.ubicaciones,
  });
  //fromJson
  factory UserAuthDto.fromJson(Map<String, dynamic> map) => _$UserAuthDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$UserAuthDtoToJson(this);
}
