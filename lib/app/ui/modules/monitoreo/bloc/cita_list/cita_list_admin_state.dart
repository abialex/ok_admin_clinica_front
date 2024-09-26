part of 'cita_list_admin_bloc.dart';

@freezed
class CitaListAdminState with _$CitaListAdminState {
  const CitaListAdminState._();
  factory CitaListAdminState.initial() = Initial;
  factory CitaListAdminState.loading() = Loading;
  factory CitaListAdminState.citaLoaded(List<CitaViewModel> citas) = CitasLoaded;
  factory CitaListAdminState.failure(String error) = Failure;
}
