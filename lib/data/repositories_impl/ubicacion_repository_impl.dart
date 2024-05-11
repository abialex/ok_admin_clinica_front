import 'package:admin_clinica_front/data/datasources/remote/ubicacion_api.dart';
import 'package:admin_clinica_front/data/models/ubicacion/ubicacion_dto.dart';
import 'package:admin_clinica_front/dominio/repositories/iubicacion_repository.dart';
import 'package:either_dart/either.dart';

class UbicacionRepository implements IUbicacionRepository {
  final UbicacionApi _api;
  UbicacionRepository(this._api);

  @override
  Future<Either<String, List<UbicacionDto>>> getUbicaciones() async {
    return _api.getUbicacions();
  }
}
