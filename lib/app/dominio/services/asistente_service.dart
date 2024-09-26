import 'package:either_dart/either.dart';

import '../../common/models/asistente/asistente_create_model.dart';
import '../../common/models/asistente/asistente_update_model.dart';
import '../../ui/view_models/asistente_view/asistente_view_models.dart';
import '../repositories/iasistente_repository.dart';

class AsistenteService {
  final IAsistenteRepository _asistenteRepository;
  AsistenteService(this._asistenteRepository);

  Future<Either<String, List<AsistentesViewModel>>> getAsistentes() async {
    try {
      final result = await _asistenteRepository.getAsistentes();
      return result.fold(
        (error) => Left(error),
        (right) => Right(
          right
              .map(
                (e) => AsistentesViewModel(
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

  Future<Either<String, AsistenteViewModel>> getAsistentessById(int idasistente) async {
    try {
      final result = await _asistenteRepository.getAsistentessById(idasistente);
      return result.fold(
        (error) => Left(error),
        (right) => Right(
          AsistenteViewModel(
            usuarioId: right.usuario_id,
            username: right.usuario_username,
            id: right.id,
            nombres: right.nombres,
            apellidos: right.apellidos,
            dni: right.dni,
            ubicacionId: right.ubicacion.id,
            celular: right.celular,
            domicilio: right.domicilio,
            fechaNacimiento: right.fechaNacimientoDate,
          ),
        ),
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, AsistenteCredentialsViewModel>> createAsistente(AsistenteCreateViewModel asistenteCreateModel) async {
    try {
      AsistenteCreateModel model = AsistenteCreateModel(
        dni: asistenteCreateModel.dni,
        nombres: asistenteCreateModel.nombres,
        apellidos: asistenteCreateModel.apellidos,
        celular: asistenteCreateModel.celular,
        tipo: asistenteCreateModel.tipo,
        fechaNacimiento: asistenteCreateModel.fechaNacimiento,
        ubicacion_id: asistenteCreateModel.ubicacionId,
      );

      final result = await _asistenteRepository.createAsistente(model);
      return result.fold(
        (error) => Left(error),
        (right) => Right(
          AsistenteCredentialsViewModel(
            username: right.username,
            password: right.password,
          ),
        ),
      );
    } catch (e) {
      return const Left("Error inesperado");
    }
  }

  Future<Either<String, int>> updateAsistente(AsistenteUpdateViewModel asistenteUpdateModel) async {
    try {
      final model = AsistenteUpdateModel(
        id: asistenteUpdateModel.id,
        dni: asistenteUpdateModel.dni,
        nombres: asistenteUpdateModel.nombres,
        apellidos: asistenteUpdateModel.apellidos,
        celular: asistenteUpdateModel.celular,
        fechaNacimiento: asistenteUpdateModel.fechaNacimiento,
        tipo: asistenteUpdateModel.tipo,
        ubicacion_id: asistenteUpdateModel.ubicacionId,
      );
      return await _asistenteRepository.updateAsistente(model);
    } catch (e) {
      return const Left("Error inesperado");
    }
  }
}
