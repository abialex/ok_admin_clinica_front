part of 'usuario_bloc.dart';

@freezed
class UsuarioState with _$UsuarioState {
  const factory UsuarioState.initial({
    @Default(false) bool isValid, //valid form
    @Default(false) bool fetching, //solicitando
    @Default(null) UserResponseDataModel? usuario, //solicitando
    @Default(null) DoctorDto? doctorIdSelected, //solicitando
  }) = _Initial;
}
