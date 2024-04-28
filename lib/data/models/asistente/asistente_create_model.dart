// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/asistente.dart';
import 'package:admin_clinica_front/infraestructura/serializers/datetime_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asistente_create_model.g.dart';

@JsonSerializable()
class AsistenteCreateModel extends Asistente {
  final int ubicacion_id;
  @DateTimeConverter()
  final DateTime fechaNacimiento;
  AsistenteCreateModel({
    required super.dni,
    required super.nombres,
    required super.apellidos,
    required super.celular,
    required super.tipo,
    required this.fechaNacimiento,
    required this.ubicacion_id,
  }) : super(fechaNacimiento: fechaNacimiento);

  //fromJson
  factory AsistenteCreateModel.fromJson(Map<String, dynamic> map) =>
      _$AsistenteCreateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$AsistenteCreateModelToJson(this);
}
