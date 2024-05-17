part of 'doctor_update_bloc.dart';

@freezed
class DoctorUpdateEvent with _$DoctorUpdateEvent {
  const factory DoctorUpdateEvent.started() = _Started;
}