// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/usuario.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_dto.g.dart';

@JsonSerializable()
class UserLoginDTO extends User {
  final int user_id;
  final String nombres;
  final String token;
  final bool is_new_token;
  final String? rol;
  final int dias_token;
  const UserLoginDTO({
    required this.user_id,
    required String username,
    required this.nombres,
    required this.token,
    required this.is_new_token,
    required this.rol,
    required this.dias_token,
  }) : super(
          id: user_id,
          username: username,
        );

  //fromJson
  factory UserLoginDTO.fromJson(Map<String, dynamic> map) =>
      _$UserLoginDTOFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$UserLoginDTOToJson(this);
}
