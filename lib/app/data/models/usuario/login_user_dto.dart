// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'login_user_dto.g.dart';

@JsonSerializable()
class LoginUserDto {
  final String username;
  final String password;
  LoginUserDto({
    required this.username,
    required this.password,
  });
  //fromJson
  factory LoginUserDto.fromJson(Map<String, dynamic> map) =>
      _$LoginUserDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$LoginUserDtoToJson(this);
}
