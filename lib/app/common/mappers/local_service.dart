import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/common/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/app/common/models/usuario/user_dto.dart';
import 'package:admin_clinica_front/app/ui/view_models/doctor_view/doctor_view_models.dart';
import '../../ui/view_models/usuario_view/usuario_view_models.dart';
import '../../data/repository/storage/ilocal_repository.dart';

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
      tipo: localUsuarioViewModel.tipo,
      ubicaciones: localUsuarioViewModel.ubicaciones,
    );
    return _localRepository.saveUsuario(model);
  }

  Future<UsuarioLoginResponseViewModel?> getUsuario() async {
    final model = await _localRepository.getUsuario();
    if (model == null) {
      return null;
    }
    return UsuarioLoginResponseViewModel(
      userId: model.user_id,
      username: model.username,
      nombres: model.nombres,
      token: model.token,
      isNewToken: model.is_new_token,
      rol: model.rol,
      diasToken: model.dias_token,
      tipo: model.tipo,
      ubicaciones: model.ubicaciones,
    );
  }

  Future<void> saveToken(String token) async {
    return await _localRepository.saveToken(token);
  }

  Future<void> saveDoctorSelected(DoctorsViewModel doctor) async {
    final modelDto = DoctorDto(
      id: doctor.id,
      usuario_id: doctor.usuarioId,
      usuario_username: doctor.username,
      ubicaciones: [],
      dni: "",
      nombres: doctor.nombres,
      apellidos: doctor.apellidos,
      fechaNacimiento: doctor.fechaNacimiento.toFormatyyyyMMdd(),
      celular: doctor.celular,
      is_active: doctor.isActive,
    );
    return await _localRepository.saveDoctorSelected(modelDto);
  }

  Future<DoctorsViewModel?> getIdDoctorSelected() async {
    final dto = await _localRepository.getDoctorSelected();
    if (dto == null) return null;
    return DoctorsViewModel(
      id: dto.id,
      apellidos: dto.apellidos,
      usuarioId: dto.usuario_id,
      username: dto.usuario_username,
      nombres: dto.nombres,
      isActive: true,
      fechaNacimiento: DateTime.parse(dto.fechaNacimiento),
      celular: dto.celular,
    );
  }

  Future<void> clearSession() async {
    return await _localRepository.clearSession();
  }
}
