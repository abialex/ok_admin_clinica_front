// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asistente_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsistenteUpdateModel _$AsistenteUpdateModelFromJson(
        Map<String, dynamic> json) =>
    AsistenteUpdateModel(
      id: json['id'] as int?,
      dni: json['dni'] as String?,
      nombres: json['nombres'] as String?,
      apellidos: json['apellidos'] as String?,
      celular: json['celular'] as String?,
      tipo: json['tipo'] as int?,
      fechaNacimiento:
          const DateTimeConverter().fromJson(json['fechaNacimiento'] as String),
      ubicacion_id: json['ubicacion_id'] as int,
    );

Map<String, dynamic> _$AsistenteUpdateModelToJson(
        AsistenteUpdateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dni': instance.dni,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'celular': instance.celular,
      'tipo': instance.tipo,
      'ubicacion_id': instance.ubicacion_id,
      'fechaNacimiento':
          const DateTimeConverter().toJson(instance.fechaNacimiento),
    };
