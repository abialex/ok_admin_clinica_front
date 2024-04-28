// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/ubicacion.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ubicacion_dto.g.dart';

@JsonSerializable()
class UbicacionDto extends Ubicacion {
  UbicacionDto({required super.id, required super.nombre});

  //fromJson
  factory UbicacionDto.fromJson(Map<String, dynamic> map) =>
      _$UbicacionDtoFromJson(map);

  //ToJson
  @override
  Map<String, dynamic> toJson() => _$UbicacionDtoToJson(this);
}
