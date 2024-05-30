part of 'doctor_create_bloc.dart';

@freezed
class DoctorCreateEvent with _$DoctorCreateEvent {
  const factory DoctorCreateEvent.started() = _Started;
  factory DoctorCreateEvent.createDoctor(DoctorCreateViewModel doctorCreateViewModel) = CreateDoctor;
}
