// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/doctor.dart';
import 'package:admin_clinica_front/infraestructura/serializers/datetime_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_create_model.g.dart';

@JsonSerializable()
class DoctorCreateModel extends Doctor {
  final List<int>? ubicaciones_id;
  @DateTimeConverter()
  final DateTime fechaNacimiento;
  DoctorCreateModel({
    required super.dni,
    required super.nombres,
    required super.apellidos,
    required super.celular,
    required this.fechaNacimiento,
    required this.ubicaciones_id,
  }) : super(fechaNacimiento: fechaNacimiento);

  //fromJson
  factory DoctorCreateModel.fromJson(Map<String, dynamic> map) =>
      _$DoctorCreateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$DoctorCreateModelToJson(this);
}
