import 'package:admin_clinica_front/dominio/repositories/iservices_repository.dart';
import 'package:admin_clinica_front/ui/view_models/services_view/services_view_models.dart';
import 'package:either_dart/either.dart';

class ServicesService {
  final IServicesRepository _servicesRepository;
  ServicesService(this._servicesRepository);

  Future<Either<String, SunatPersonaViewModel>> getPersonaSunatByDni(String dni) async {
    try {
      final result = _servicesRepository.getPersonaSunatByDni(dni);
      return result.fold(
        (error) => Left(error),
        (right) => Right(SunatPersonaViewModel(
          tipoDocumento: right.tipoDocumento,
          nombres: right.nombres,
          apellidoPaterno: right.apellidoPaterno,
          apellidoMaterno: right.apellidoMaterno,
          numeroDocumento: right.numeroDocumento,
          digitoVerificador: right.digitoVerificador,
        )),
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }
}
