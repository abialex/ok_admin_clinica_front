// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticatedDTO _$AuthenticatedDTOFromJson(Map<String, dynamic> json) =>
    AuthenticatedDTO(
      mensaje: json['mensaje'] as String,
      isValid: json['isValid'] as bool,
    );

Map<String, dynamic> _$AuthenticatedDTOToJson(AuthenticatedDTO instance) =>
    <String, dynamic>{
      'mensaje': instance.mensaje,
      'isValid': instance.isValid,
    };
