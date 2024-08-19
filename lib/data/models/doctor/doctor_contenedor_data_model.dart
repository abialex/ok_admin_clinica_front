// ignore_for_file: always_put_required_named_parameters_first, lines_longer_than_80_chars, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_contenedor_data_model.freezed.dart';
part 'doctor_contenedor_data_model.g.dart';

@freezed
class DoctorContenedorDataModel with _$DoctorContenedorDataModel {
  const factory DoctorContenedorDataModel({
    int? id,
    required int usuarioId,
    required String username,
    required String nombres,
    required String apellidos,
    required bool isActive,
    required DateTime fechaNacimiento,
    required String celular,
  }) = _DoctorContenedorDataModel;

  factory DoctorContenedorDataModel.fromJson(Map<String, dynamic> json) => _$DoctorContenedorDataModelFromJson(json);
}
