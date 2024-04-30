// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'user_dto.g.dart';

@JsonSerializable() //extends User
class UserLoginDTO {
  final int user_id;
  final bool is_new_token;
  final int dias_token;
  final String nombres;
  final String token;
  final String rol;
  final String username;

  const UserLoginDTO({
    required this.user_id,
    required this.username,
    required this.nombres,
    required this.token,
    required this.is_new_token,
    required this.rol,
    required this.dias_token,
  }) : super();

  //fromJson
  factory UserLoginDTO.fromJson(Map<String, dynamic> map) =>
      _$UserLoginDTOFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$UserLoginDTOToJson(this);
}
