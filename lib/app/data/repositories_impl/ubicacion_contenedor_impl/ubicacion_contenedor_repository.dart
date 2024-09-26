import 'package:admin_clinica_front/app/data/datasources/remote/ubicacion_api.dart';
import 'package:admin_clinica_front/app/data/models/ubicacion/ubicacion_contenedor_data_model.dart';
import 'package:admin_clinica_front/app/dominio/repositories/idubicacion_contenedor/iubicacion_contenedor_repository.dart';
import 'package:either_dart/either.dart';

class UbicacionContenedorLocalRepository implements IUbicacionContenedorLocalRepository {
  UbicacionApi api;
  UbicacionContenedorLocalRepository(this.api);
// Future<Either<String, AsistenteCredentialsDto>>
  @override
  Future<Either<String, List<UbicacionContenedorDataModel>>> getLocalSunatContenedors() async {
    final result = await api.getUbicacions();
    return result.fold(
        (error) => Left(error),
        (response) => Right(response
            .map((e) => UbicacionContenedorDataModel(
                  nombre: e.nombre,
                  id: e.id,
                ))
            .toList()));
  }
}
