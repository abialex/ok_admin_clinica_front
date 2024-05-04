import 'package:admin_clinica_front/core/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/data/models/doctor/doctor_update_model.dart';
import 'package:either_dart/either.dart';

import '../../data/models/doctor/doctor_create_model.dart';
import '../../ui/view_models/doctor_view/doctor_view_models.dart';
import '../repositories/idoctor_repository.dart';

class DoctorService {
  final IDoctorRepository _doctorRepository;
  DoctorService(this._doctorRepository);

  Future<Either<String, List<DoctorsViewModel>>> getDoctorsByIdUbicacionFromAsistente() async {
    try {
      final result = await _doctorRepository.getDoctorsByIdUbicacionFromAsistente();
      return result.fold(
        (error) => Left(error),
        (right) => Right(
          right
              .map(
                (e) => DoctorsViewModel(
                  usuarioId: e.usuario_id,
                  username: e.username,
                  id: e.id,
                  nombres: e.nombres,
                  apellidos: e.apellidos,
                ),
              )
              .toList(),
        ),
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, List<DoctorsViewModel>>> getDoctors() async {
    try {
      final result = await _doctorRepository.getDoctors();
      return result.fold(
        (error) => Left(error),
        (right) => Right(
          right
              .map(
                (e) => DoctorsViewModel(
                  usuarioId: e.usuario_id,
                  username: e.username,
                  id: e.id,
                  nombres: e.nombres,
                  apellidos: e.apellidos,
                ),
              )
              .toList(),
        ),
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, DoctorViewModel>> getDoctorById(int iddoctor) async {
    try {
      final result = await _doctorRepository.getDoctorById(iddoctor);
      return result.fold(
        (error) => Left(error),
        (right) => Right(
          DoctorViewModel(
            usuarioId: right.usuario_id,
            username: right.usuario_username,
            id: right.id,
            nombres: right.nombres,
            apellidos: right.apellidos,
            dni: right.dni,
            ubicacionesId: right.ubicaciones.map((e) => e.id).toList(),
          ),
        ),
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, DoctorCredentialsViewModel>> createDoctor(DoctorCreateViewModel doctorCreateModel) async {
    try {
      final model = DoctorCreateModel(
        dni: doctorCreateModel.dni,
        nombres: doctorCreateModel.nombres,
        apellidos: doctorCreateModel.apellidos,
        celular: doctorCreateModel.celular,
        fechaNacimiento: doctorCreateModel.fechaNacimiento.toFormatyyyyMMdd(),
        ubicaciones_id: doctorCreateModel.ubicacionesId,
      );
      final result = _doctorRepository.createDoctor(model);
      return result.fold(
        (error) => Left(error),
        (right) => Right(
          DoctorCredentialsViewModel(
            username: right.username,
            password: right.password,
          ),
        ),
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, int>> updateDoctor(DoctorUpdateViewModel doctorUpdateModel) async {
    try {
      final model = DoctorUpdateModel(
          id: doctorUpdateModel.id,
          dni: doctorUpdateModel.dni,
          nombres: doctorUpdateModel.nombres,
          apellidos: doctorUpdateModel.apellidos,
          celular: doctorUpdateModel.celular,
          ubicaciones_id: doctorUpdateModel.ubicacionesId,
          fechaNacimiento: doctorUpdateModel.fechaNacimiento.toFormatyyyyMMdd());
      return await _doctorRepository.updateDoctor(model);
    } catch (e) {
      return const Left("Error inesperado");
    }
  }
}
