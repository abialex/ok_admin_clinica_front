// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_ocupada_create.freezed.dart';
part 'cita_ocupada_create.g.dart';

@freezed
class CitaOcupadaCreateModel with _$CitaOcupadaCreateModel {
  const CitaOcupadaCreateModel._(); // Constructor privado para usar getters

  const factory CitaOcupadaCreateModel({
    @JsonKey(name: 'doctor_id') required int doctorId,
    @JsonKey(name: 'fechaHoraCita') required String fechaHoraCita,
    String? razonOcupado,
  }) = _CitaOcupadaCreateModel;

  // fromJson
  factory CitaOcupadaCreateModel.fromJson(Map<String, dynamic> json) => _$CitaOcupadaCreateModelFromJson(json);

  // Getter para convertir fechaHoraCita a DateTime
  DateTime get fechaHoraCitaDate => DateTime.parse(fechaHoraCita);
}
