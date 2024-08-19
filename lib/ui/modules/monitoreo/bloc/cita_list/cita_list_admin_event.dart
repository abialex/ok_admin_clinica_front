part of 'cita_list_admin_bloc.dart';

@freezed
class CitaListAdminEvent with _$CitaListAdminEvent {
  const CitaListAdminEvent._();
  factory CitaListAdminEvent.initial() = InitialCitaListAdmin;
  factory CitaListAdminEvent.getCitas(CitaRequestAdminViewModel citaRequestViewModel) = GetCitas;
  factory CitaListAdminEvent.invalidCita(String message) = InvalidCitaEvent;
}
