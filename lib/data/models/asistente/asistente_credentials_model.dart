// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'asistente_credentials_model.g.dart';

@JsonSerializable()
class AsistenteCredentialsDto {
  final String username;
  final String password;
  AsistenteCredentialsDto({
    required this.username,
    required this.password,
  });
  //fromJson
  factory AsistenteCredentialsDto.fromJson(Map<String, dynamic> map) =>
      _$AsistenteCredentialsDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$AsistenteCredentialsDtoToJson(this);
}
