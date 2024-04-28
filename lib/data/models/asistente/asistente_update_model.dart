// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/asistente.dart';
import 'package:admin_clinica_front/infraestructura/serializers/datetime_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asistente_update_model.g.dart';

@JsonSerializable()
class AsistenteUpdateModel extends Asistente {
  final int ubicacion_id;
  @DateTimeConverter()
  final DateTime fechaNacimiento;
  AsistenteUpdateModel({
    required super.id,
    required super.dni,
    required super.nombres,
    required super.apellidos,
    required super.celular,
    required super.tipo,
    required this.fechaNacimiento,
    required this.ubicacion_id,
  }) : super(fechaNacimiento: fechaNacimiento);

  factory AsistenteUpdateModel.fromJson(Map<String, dynamic> map) =>
      _$AsistenteUpdateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$AsistenteUpdateModelToJson(this);
}
