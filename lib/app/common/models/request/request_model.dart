// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_model.freezed.dart';
part 'request_model.g.dart';

@freezed
class CitaRequest with _$CitaRequest {
  const CitaRequest._(); // Constructor privado para usar getters

  const factory CitaRequest({
    @JsonKey(name: 'fechaHoraCita') String? fechaHoraCita,
    @JsonKey(name: 'doctor_id') int? doctorId,
    @Default([]) @JsonKey(name: 'ubicaciones_id') List<int> ubicacionesId,
  }) = _CitaRequest;

  // fromJson
  factory CitaRequest.fromJson(Map<String, dynamic> json) => _$CitaRequestFromJson(json);

  // Getter para convertir fechaHoraCita a DateTime
  DateTime? get fechaHoraCitaDate => DateTime.tryParse(fechaHoraCita ?? '');
}
