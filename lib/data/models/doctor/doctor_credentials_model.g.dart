// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_credentials_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorCredentialsDto _$DoctorCredentialsDtoFromJson(
        Map<String, dynamic> json) =>
    DoctorCredentialsDto(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$DoctorCredentialsDtoToJson(
        DoctorCredentialsDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
