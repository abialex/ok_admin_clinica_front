// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'asistente_create_model.g.dart';

@JsonSerializable()
class AsistenteCreateModel {
  final String dni;
  final String nombres;
  final String apellidos;
  final String celular;
  final int tipo;
  final String fechaNacimiento;
  final int ubicacion_id;

  AsistenteCreateModel({
    required this.dni,
    required this.nombres,
    required this.apellidos,
    required this.celular,
    required this.tipo,
    required this.fechaNacimiento,
    required this.ubicacion_id,
  });

  //fromJson
  factory AsistenteCreateModel.fromJson(Map<String, dynamic> map) =>
      _$AsistenteCreateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$AsistenteCreateModelToJson(this);
}
