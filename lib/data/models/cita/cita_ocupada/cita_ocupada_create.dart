// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'cita_ocupada_create.g.dart';

@JsonSerializable()
class CitaOcupadaCreateModel {
  final String fechaHoraCita;
  final String? razonOcupado;
  final int doctor_id;

  CitaOcupadaCreateModel({
    required this.doctor_id,
    required this.fechaHoraCita,
    this.razonOcupado,
  });
  //fromJson
  factory CitaOcupadaCreateModel.fromJson(Map<String, dynamic> map) => _$CitaOcupadaCreateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitaOcupadaCreateModelToJson(this);
}
