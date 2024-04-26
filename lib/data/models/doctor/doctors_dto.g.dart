// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorsDto _$DoctorsDtoFromJson(Map<String, dynamic> json) => DoctorsDto(
      id: json['id'] as int?,
      usuario_id: json['usuario_id'] as int,
      username: json['username'] as String,
      nombres: json['nombres'] as String?,
      apellidos: json['apellidos'] as String?,
    );

Map<String, dynamic> _$DoctorsDtoToJson(DoctorsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'usuario_id': instance.usuario_id,
      'username': instance.username,
    };
