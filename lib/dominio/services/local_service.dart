import 'package:admin_clinica_front/data/models/usuario/user_dto.dart';

import '../../ui/view_models/usuario_view/usuario_view_models.dart';
import '../repositories/ilocal_repository.dart';

class LocalService {
  final ILocalRepository _localRepository;
  LocalService(this._localRepository);

  Future<void> saveUsuario(UsuarioLoginResponseViewModel localUsuarioViewModel) {
    final model = UserLoginDTO(
        user_id: localUsuarioViewModel.userId,
        username: localUsuarioViewModel.username,
        nombres: localUsuarioViewModel.nombres,
        token: localUsuarioViewModel.token,
        is_new_token: localUsuarioViewModel.isNewToken,
        rol: localUsuarioViewModel.rol,
        dias_token: localUsuarioViewModel.diasToken,
        tipo: localUsuarioViewModel.tipo);
    return _localRepository.saveUsuario(model);
  }

  Future<UsuarioLoginResponseViewModel?> getUsuario() async {
    final model = await _localRepository.getUsuario();
    if (model == null) {
      null;
    }
    return UsuarioLoginResponseViewModel(
      userId: model!.user_id,
      username: model.username,
      nombres: model.nombres,
      token: model.token,
      isNewToken: model.is_new_token,
      rol: model.rol,
      diasToken: model.dias_token,
      tipo: model.tipo,
    );
  }

  Future<void> saveToken(String token) async {
    return await _localRepository.saveToken(token);
  }
}
