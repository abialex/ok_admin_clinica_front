part of 'cita_index_bloc.dart';

@freezed
class CitaIndexEvent with _$CitaIndexEvent {
  const factory CitaIndexEvent.initial(CitaDTO citaViewModel) = InitialEvent;
  const factory CitaIndexEvent.nextCita(CitaDTO citaViewModel, TipoAccionEnum tipoAccion) = NextCitaEvent;
  const factory CitaIndexEvent.confirmarCita(CitaDTO citaViewModel) = ConfirmarCitaEvent;
  const factory CitaIndexEvent.iniciarCita(CitaDTO citaViewModel) = IniciarCitaEvent;
  const factory CitaIndexEvent.finalizarCita(CitaDTO citaViewModel) = FinalizarCitaEvent;
  const factory CitaIndexEvent.validarCita(CitaDTO citaViewModel) = ValidarCitaEvent;
  const factory CitaIndexEvent.eliminarCita(CitaDTO citaViewModel) = EliminarCitaEvent;
  const factory CitaIndexEvent.getCita(int citaId) = GetCitaEvent;
}
