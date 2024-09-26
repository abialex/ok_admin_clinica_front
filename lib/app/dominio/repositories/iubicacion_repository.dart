import 'package:admin_clinica_front/app/data/models/ubicacion/ubicacion_dto.dart';
import 'package:either_dart/either.dart';

abstract class IUbicacionRepository {
  Future<Either<String, List<UbicacionDto>>> getUbicaciones();
}
