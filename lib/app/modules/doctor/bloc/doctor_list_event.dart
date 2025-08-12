part of 'doctor_list_bloc.dart';

@freezed
class DoctorListEvent with _$DoctorListEvent {
  factory DoctorListEvent.getDoctors() = GetDoctors;
}
