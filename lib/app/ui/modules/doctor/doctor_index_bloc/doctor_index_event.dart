part of 'doctor_index_bloc.dart';

@freezed
class DoctorIndexEvent with _$DoctorIndexEvent {
  const factory DoctorIndexEvent.initial(DoctorsViewModel doctorsViewModel) = InitialEvent;
  const factory DoctorIndexEvent.doctorAction(DoctorsViewModel doctorsViewModel, DoctorActionEnum doctorAction) = NextCitaEvent;
  const factory DoctorIndexEvent.resetPassword(DoctorsViewModel doctorsViewModel) = ResetPasswordEvent;
  const factory DoctorIndexEvent.getDoctor(int doctorId) = GetDoctorEvent;
}
