// ignore_for_file: always_put_required_named_parameters_first, lines_longer_than_80_chars, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ubicacion_contenedor_data_model.freezed.dart';
part 'ubicacion_contenedor_data_model.g.dart';

@freezed
class UbicacionContenedorDataModel with _$UbicacionContenedorDataModel {
  const factory UbicacionContenedorDataModel({
    int? id,
    required String nombre,
  }) = _UbicacionContenedorDataModel;

  factory UbicacionContenedorDataModel.fromJson(Map<String, dynamic> json) => _$UbicacionContenedorDataModelFromJson(json);
}
