// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asistente_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsistenteDto _$AsistenteDtoFromJson(Map<String, dynamic> json) => AsistenteDto(
      id: json['id'] as int,
      usuario_id: json['usuario_id'] as int,
      usuario_username: json['usuario_username'] as String,
      ubicacion:
          UbicacionDto.fromJson(json['ubicacion'] as Map<String, dynamic>),
      dni: json['dni'] as String,
      nombres: json['nombres'] as String,
      apellidos: json['apellidos'] as String,
      celular: json['celular'] as String?,
      domicilio: json['domicilio'] as String?,
      fechaNacimiento: json['fechaNacimiento'] == null
          ? null
          : DateTime.parse(json['fechaNacimiento'] as String),
    );

Map<String, dynamic> _$AsistenteDtoToJson(AsistenteDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'usuario_id': instance.usuario_id,
      'usuario_username': instance.usuario_username,
      'ubicacion': instance.ubicacion,
      'dni': instance.dni,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'celular': instance.celular,
      'domicilio': instance.domicilio,
      'fechaNacimiento': instance.fechaNacimiento?.toIso8601String(),
    };
