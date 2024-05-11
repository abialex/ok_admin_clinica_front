import 'package:admin_clinica_front/dominio/repositories/iubicacion_repository.dart';
import 'package:admin_clinica_front/ui/view_models/ubicacion_view/ubicacion_view.dart';
import 'package:either_dart/either.dart';

class UbicacionService {
  final IUbicacionRepository _ubicacionRepository;
  UbicacionService(this._ubicacionRepository);
  Future<Either<String, List<UbicacionsViewModel>>> getUbicaciones() async {
    try {
      final result = _ubicacionRepository.getUbicaciones();
      return result.fold(
        (error) => Left(error),
        (right) => Right(
          right
              .map(
                (e) => UbicacionsViewModel(nombre: e.nombre, id: e.id),
              )
              .toList(),
        ),
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }
}
