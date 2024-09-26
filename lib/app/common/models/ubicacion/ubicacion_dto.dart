// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'ubicacion_dto.g.dart';

@JsonSerializable() //extends Ubicacion
class UbicacionDto {
  final int id;
  final String nombre;
  UbicacionDto({
    required this.id,
    required this.nombre,
  });

  //fromJson
  factory UbicacionDto.fromJson(Map<String, dynamic> map) =>
      _$UbicacionDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$UbicacionDtoToJson(this);
}
