import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/data/models/doctor/doctor_update_model.dart';
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
                  isActive: e.is_active,
                  fechaNacimiento: DateTime.parse(e.fechaNacimiento),
                  celular: e.celular,
                ),
              )
              .toList(),
        ),
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, List<DoctorsViewModel>>> getDoctorByUserDoctor() async {
    try {
      final result = await _doctorRepository.getDoctorByUserDoctor();
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
                  isActive: e.is_active,
                  fechaNacimiento: DateTime.parse(e.fechaNacimiento),
                  celular: e.celular,
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
                  isActive: e.is_active,
                  fechaNacimiento: DateTime.parse(e.fechaNacimiento),
                  celular: e.celular,
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
            isActive: right.is_active,
            usuarioId: right.usuario_id,
            username: right.usuario_username,
            id: right.id,
            nombres: right.nombres,
            apellidos: right.apellidos,
            dni: right.dni,
            celular: right.celular,
            ubicacionesId: right.ubicaciones.map((e) => e.id).toList(),
            fechaNacimiento: DateTime.parse(right.fechaNacimiento),
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

  Future<Either<String, bool>> doctorAction(DoctorActionEnum tipoAction, int doctorId) async {
    switch (tipoAction) {
      case DoctorActionEnum.activar:
        return _doctorRepository.activarDoctor(doctorId);
      case DoctorActionEnum.inactivar:
        return _doctorRepository.inactivarDoctor(doctorId);

      default:
        return const Left("tipo de acción no definido en la App");
    }
  }

  Future<Either<String, String>> resetPassword(int doctorId) async {
    return _doctorRepository.resetPassword(doctorId);
  }
}

enum DoctorActionEnum {
  activar,
  inactivar,
  // validar,
  // cancelar,
  // eliminar,
}
