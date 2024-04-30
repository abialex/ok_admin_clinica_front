// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asistente_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsistenteCreateModel _$AsistenteCreateModelFromJson(
        Map<String, dynamic> json) =>
    AsistenteCreateModel(
      dni: json['dni'] as String,
      nombres: json['nombres'] as String,
      apellidos: json['apellidos'] as String,
      celular: json['celular'] as String,
      tipo: json['tipo'] as int,
      fechaNacimiento: json['fechaNacimiento'] as String,
      ubicacion_id: json['ubicacion_id'] as int,
    );

Map<String, dynamic> _$AsistenteCreateModelToJson(
        AsistenteCreateModel instance) =>
    <String, dynamic>{
      'dni': instance.dni,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'celular': instance.celular,
      'tipo': instance.tipo,
      'fechaNacimiento': instance.fechaNacimiento,
      'ubicacion_id': instance.ubicacion_id,
    };
