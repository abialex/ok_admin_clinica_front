// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_agil_create.freezed.dart';
part 'cita_agil_create.g.dart';

@freezed
class CitaAgilCreateModel with _$CitaAgilCreateModel {
  const CitaAgilCreateModel._(); // Constructor privado para usar getters

  const factory CitaAgilCreateModel({
    @JsonKey(name: 'doctor_id') required int doctorId,
    @JsonKey(name: 'ubicacion_id') required int ubicacionId,
    @JsonKey(name: 'fechaHoraCita') required String fechaHoraCita,
    @JsonKey(name: 'datosPaciente') required String datosPaciente,
    String? celular,
    String? razon,
  }) = _CitaAgilCreateModel;

  // fromJson
  factory CitaAgilCreateModel.fromJson(Map<String, dynamic> json) => _$CitaAgilCreateModelFromJson(json);

  // Getter para convertir fechaHoraCita a DateTime
  DateTime get fechaHoraCitaDate => DateTime.parse(fechaHoraCita);
}
