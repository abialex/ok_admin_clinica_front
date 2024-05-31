// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'cita_ocupada_update.g.dart';

@JsonSerializable()
class CitaOcupadaUpdateModel {
  final int id;
  final String fechaHoraCita;
  final String? razonOcupado;
  final int doctor_id;

  CitaOcupadaUpdateModel({
    required this.id,
    required this.doctor_id,
    required this.fechaHoraCita,
    this.razonOcupado,
  });
  //fromJson
  factory CitaOcupadaUpdateModel.fromJson(Map<String, dynamic> map) => _$CitaOcupadaUpdateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitaOcupadaUpdateModelToJson(this);
}
