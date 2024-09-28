import 'package:either_dart/either.dart';

import '../../models/doctor/doctor_create_model.dart';
import '../../models/doctor/doctor_credentials_model.dart';
import '../../models/doctor/doctor_dto.dart';
import '../../models/doctor/doctor_update_model.dart';
import '../../models/doctor/doctors_dto.dart';

abstract class IDoctorRepository {
  Future<Either<String, List<DoctorsDto>>> getDoctorsByIdUbicacionFromAsistente();
  Future<Either<String, List<DoctorsDto>>> getDoctors();
  Future<Either<String, DoctorDto>> getDoctorById(int iddoctor);
  Future<Either<String, DoctorCredentialsDto>> createDoctor(DoctorCreateModel doctorCreateModel);
  Future<Either<String, int>> updateDoctor(DoctorUpdateModel doctorUpdateModel);
  Future<Either<String, bool>> activarDoctor(int doctorId);
  Future<Either<String, bool>> inactivarDoctor(int doctorId);
  Future<Either<String, String>> resetPassword(int doctorId);
  Future<Either<String, List<DoctorsDto>>> getDoctorByUserDoctor();
}
