// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'doctor_credentials_model.g.dart';

@JsonSerializable()
class DoctorCredentialsDto {
  final String username;
  final String password;
  DoctorCredentialsDto({
    required this.username,
    required this.password,
  });
  //fromJson
  factory DoctorCredentialsDto.fromJson(Map<String, dynamic> map) =>
      _$DoctorCredentialsDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$DoctorCredentialsDtoToJson(this);
}
