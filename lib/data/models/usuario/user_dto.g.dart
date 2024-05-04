// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginDTO _$UserLoginDTOFromJson(Map<String, dynamic> json) => UserLoginDTO(
      user_id: json['user_id'] as int,
      username: json['username'] as String,
      nombres: json['nombres'] as String,
      token: json['token'] as String,
      is_new_token: json['is_new_token'] as bool,
      rol: json['rol'] as String,
      dias_token: json['dias_token'] as int,
      tipo: json['tipo'] as String?,
    );

Map<String, dynamic> _$UserLoginDTOToJson(UserLoginDTO instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'is_new_token': instance.is_new_token,
      'dias_token': instance.dias_token,
      'nombres': instance.nombres,
      'token': instance.token,
      'rol': instance.rol,
      'username': instance.username,
      'tipo': instance.tipo,
    };
