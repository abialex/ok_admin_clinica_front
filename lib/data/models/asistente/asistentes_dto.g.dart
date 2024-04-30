// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asistentes_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsistentesDto _$AsistentesDtoFromJson(Map<String, dynamic> json) =>
    AsistentesDto(
      id: json['id'] as int,
      usuario_id: json['usuario_id'] as int,
      username: json['username'] as String,
      nombres: json['nombres'] as String,
      apellidos: json['apellidos'] as String,
    );

Map<String, dynamic> _$AsistentesDtoToJson(AsistentesDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'usuario_id': instance.usuario_id,
      'username': instance.username,
    };
