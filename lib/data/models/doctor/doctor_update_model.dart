// ignore_for_file: non_constant_identifier_names

import 'package:admin_clinica_front/dominio/entities/doctor.dart';
import 'package:admin_clinica_front/infraestructura/serializers/datetime_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_update_model.g.dart';

@JsonSerializable()
class DoctorUpdateModel extends Doctor {
  final List<int>? ubicaciones_id;
  @DateTimeConverter()
  final DateTime fechaNacimiento;
  DoctorUpdateModel({
    required super.id,
    required super.dni,
    required super.nombres,
    required super.apellidos,
    required super.celular,
    required this.fechaNacimiento,
    required this.ubicaciones_id,
  }) : super(fechaNacimiento: fechaNacimiento);

  factory DoctorUpdateModel.fromJson(Map<String, dynamic> map) =>
      _$DoctorUpdateModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$DoctorUpdateModelToJson(this);
}
