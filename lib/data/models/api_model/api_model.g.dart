// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiModel _$ApiModelFromJson(Map<String, dynamic> json) => ApiModel(
      tipo: json['tipo'] as String,
      message: json['message'] as String,
      url: json['url'] as String,
      data: json['data'],
      field_errors: json['field_errors'],
    );

Map<String, dynamic> _$ApiModelToJson(ApiModel instance) => <String, dynamic>{
      'tipo': instance.tipo,
      'message': instance.message,
      'url': instance.url,
      'data': instance.data,
      'field_errors': instance.field_errors,
    };
