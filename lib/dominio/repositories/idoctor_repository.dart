import 'package:either_dart/either.dart';

import '../../data/models/doctor/doctor_create_model.dart';
import '../../data/models/doctor/doctor_credentials_model.dart';
import '../../data/models/doctor/doctor_dto.dart';
import '../../data/models/doctor/doctor_update_model.dart';
import '../../data/models/doctor/doctors_dto.dart';

abstract class IDoctorRepository {
  Future<Either<String, List<DoctorsDto>>> getDoctorsByIdUbicacionFromAsistente();
  Future<Either<String, List<DoctorsDto>>> getDoctors();
  Future<Either<String, DoctorDto>> getDoctorById(int iddoctor);
  Future<Either<String, DoctorCredentialsDto>> createDoctor(DoctorCreateModel doctorCreateModel);
  Future<Either<String, int>> updateDoctor(DoctorUpdateModel doctorUpdateModel);
}
