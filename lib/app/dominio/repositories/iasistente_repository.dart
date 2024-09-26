import 'package:either_dart/either.dart';

import '../../common/models/asistente/asistente_create_model.dart';
import '../../common/models/asistente/asistente_credentials_model.dart';
import '../../common/models/asistente/asistente_dto.dart';
import '../../common/models/asistente/asistente_update_model.dart';
import '../../common/models/asistente/asistentes_dto.dart';

abstract class IAsistenteRepository {
  Future<Either<String, List<AsistentesDto>>> getAsistentes();
  Future<Either<String, AsistenteDto>> getAsistentessById(int idasistente);
  Future<Either<String, AsistenteCredentialsDto>> createAsistente(AsistenteCreateModel doctorCreateModel);
  Future<Either<String, int>> updateAsistente(AsistenteUpdateModel doctorUpdateModel);
}
