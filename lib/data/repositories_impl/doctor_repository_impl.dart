import 'package:admin_clinica_front/data/models/doctor/doctor_create_model.dart';

import 'package:admin_clinica_front/data/models/doctor/doctor_credentials_model.dart';

import 'package:admin_clinica_front/data/models/doctor/doctor_dto.dart';

import 'package:admin_clinica_front/data/models/doctor/doctor_update_model.dart';

import 'package:admin_clinica_front/data/models/doctor/doctors_dto.dart';
import 'package:either_dart/either.dart';

import '../../dominio/repositories/idoctor_repository.dart';
import '../datasources/remote/doctor_api.dart';

class DoctorRepository implements IDoctorRepository {
  DoctorApi api;
  DoctorRepository(this.api);

  @override
  Future<Either<String, DoctorCredentialsDto>> createDoctor(DoctorCreateModel doctorCreateModel) async {
    return api.createDoctor(doctorCreateModel);
  }

  @override
  Future<Either<String, List<DoctorsDto>>> getDoctors() async {
    return api.getDoctors();
  }

  @override
  Future<Either<String, DoctorDto>> getDoctorById(int iddoctor) async {
    return api.getDoctorsById(iddoctor);
  }

  @override
  Future<Either<String, List<DoctorsDto>>> getDoctorsByIdUbicacionFromAsistente() async {
    return api.getDoctorsByIdUbicacionFromAsistente();
  }

  @override
  Future<Either<String, int>> updateDoctor(DoctorUpdateModel doctorUpdateModel) async {
    return api.updateDoctor(doctorUpdateModel);
  }

  @override
  Future<Either<String, bool>> activarDoctor(int doctorId) {
    return api.activarDoctor(doctorId);
  }

  @override
  Future<Either<String, bool>> inactivarDoctor(int doctorId) {
    return api.inactivarDoctor(doctorId);
  }

  @override
  Future<Either<String, String>> resetPassword(int doctorId) {
    return api.resetPassword(doctorId);
  }

  @override
  Future<Either<String, List<DoctorsDto>>> getDoctorByUserDoctor() {
    return api.getDoctorByUserDoctor();
  }
}
