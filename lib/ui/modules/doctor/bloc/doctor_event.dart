part of 'doctor_bloc.dart';

@freezed
class DoctorEvent with _$DoctorEvent {
  const DoctorEvent._();
  factory DoctorEvent.getDoctors() = GetDoctors;
}
