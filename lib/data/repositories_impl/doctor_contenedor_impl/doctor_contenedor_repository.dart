import 'package:admin_clinica_front/data/datasources/remote/doctor_api.dart';
import 'package:admin_clinica_front/data/models/doctor/doctor_contenedor_data_model.dart';
import 'package:admin_clinica_front/data/models/filter_model/filter_model.dart';
import 'package:admin_clinica_front/dominio/repositories/idoctor_contenedor/idoctor_contenedor_repository.dart';
import 'package:either_dart/either.dart';

class DoctorContenedorLocalRepository implements IDoctorContenedorLocalRepository {
  DoctorApi api;
  DoctorContenedorLocalRepository(this.api);
// Future<Either<String, AsistenteCredentialsDto>>
  @override
  Future<Either<String, List<DoctorContenedorDataModel>>> getLocalDoctorContenedorByFilter(FilterModel filter) async {
    final result = await api.getDoctorsByIdUbicacion(filter.ubicacionId!);
    return result.fold(
        (error) => Left(error),
        (response) => Right(response
            .map((e) => DoctorContenedorDataModel(
                  usuarioId: e.usuario_id,
                  username: e.username,
                  nombres: e.nombres,
                  apellidos: e.apellidos,
                  isActive: e.is_active,
                  fechaNacimiento: DateTime.parse(e.fechaNacimiento),
                  celular: e.celular,
                ))
            .toList()));
  }
}
