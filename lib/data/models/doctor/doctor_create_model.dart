// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'doctor_create_model.g.dart';

@JsonSerializable() //extends Doctor
class DoctorCreateModel {
  final String dni;
  final String nombres;
  final String apellidos;
  final String celular;
  final String fechaNacimiento;
  final List<int> ubicaciones_id;

  DoctorCreateModel({
    required this.dni,
    required this.nombres,
    required this.apellidos,
    required this.celular,
    required this.fechaNacimiento,
    required this.ubicaciones_id,
  });
  //fromJson
  factory DoctorCreateModel.fromJson(Map<String, dynamic> map) =>
      _$DoctorCreateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$DoctorCreateModelToJson(this);
}
