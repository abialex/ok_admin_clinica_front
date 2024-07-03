part of 'doctor_contenedor_list_bloc.dart';

@freezed
class DoctorContenedorListEvent with _$DoctorContenedorListEvent {
  const DoctorContenedorListEvent._();
  factory DoctorContenedorListEvent.getDoctorContenedors(FilterModel filter) = DoctorContenedorGetAPIEvent;
  factory DoctorContenedorListEvent.getLocalContenedors(FilterModel filter) = DoctorContenedorGetLocalEvent;
}
