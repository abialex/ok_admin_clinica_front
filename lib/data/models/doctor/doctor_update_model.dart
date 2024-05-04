// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/doctor.dart';
import 'package:admin_clinica_front/infraestructura/serializers/datetime_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_update_model.g.dart';

@JsonSerializable()
class DoctorUpdateModel {
  final int id;
  final String dni;
  final String nombres;
  final String apellidos;
  final String celular;
  final String fechaNacimiento;
  final List<int>? ubicaciones_id;

  DoctorUpdateModel({
    required this.id,
    required this.dni,
    required this.nombres,
    required this.apellidos,
    required this.celular,
    required this.fechaNacimiento,
    required this.ubicaciones_id,
  });
  factory DoctorUpdateModel.fromJson(Map<String, dynamic> map) => _$DoctorUpdateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$DoctorUpdateModelToJson(this);
}
