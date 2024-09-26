// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'asistente_update_model.g.dart';

@JsonSerializable()
class AsistenteUpdateModel {
  final int id;
  final String dni;
  final String nombres;
  final String apellidos;
  final String celular;
  final int tipo;
  final String fechaNacimiento;
  final int ubicacion_id;

  AsistenteUpdateModel({
    required this.id,
    required this.dni,
    required this.nombres,
    required this.apellidos,
    required this.celular,
    required this.tipo,
    required this.fechaNacimiento,
    required this.ubicacion_id,
  });
  factory AsistenteUpdateModel.fromJson(Map<String, dynamic> map) =>
      _$AsistenteUpdateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$AsistenteUpdateModelToJson(this);
}
