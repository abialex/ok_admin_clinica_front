// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'request_model.g.dart';

@JsonSerializable()
class CitaRequest {
  final String fechaHoraCita;
  final int doctor_id;
  final int ubicacion_id;
  CitaRequest({
    required this.fechaHoraCita,
    required this.doctor_id,
    required this.ubicacion_id,
  });
  //fromJson
  factory CitaRequest.fromJson(Map<String, dynamic> map) =>
      _$CitaRequestFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$CitaRequestToJson(this);
}
