// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cita_agil_update_model.freezed.dart';
part 'cita_agil_update_model.g.dart';

@freezed
class CitaAgilUpdateModel with _$CitaAgilUpdateModel {
  const CitaAgilUpdateModel._(); // Constructor privado para usar getters

  const factory CitaAgilUpdateModel({
    required int id,
    required int estado,
    @JsonKey(name: 'doctor_id') required int doctorId,
    @JsonKey(name: 'ubicacion_id') required int ubicacionId,
    @JsonKey(name: 'fechaHoraCita') required String fechaHoraCita,
    String? celular,
    String? razon,
    @JsonKey(name: 'datosPaciente') required String datosPaciente,
  }) = _CitaAgilUpdateModel;

  // fromJson
  factory CitaAgilUpdateModel.fromJson(Map<String, dynamic> json) => _$CitaAgilUpdateModelFromJson(json);

  // Getter para convertir fechaHoraCita a DateTime
  DateTime get fechaHoraCitaDate => DateTime.parse(fechaHoraCita);
}
