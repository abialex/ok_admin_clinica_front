part of 'doctor_index_bloc.dart';

@freezed
class DoctorIndexEvent with _$DoctorIndexEvent {
  const factory DoctorIndexEvent.initial(DoctorDto doctorsViewModel) = InitialEvent;
  const factory DoctorIndexEvent.doctorAction(DoctorDto doctorsViewModel, DoctorActionEnum doctorAction) = NextCitaEvent;
  const factory DoctorIndexEvent.resetPassword(DoctorDto doctorsViewModel) = ResetPasswordEvent;
  const factory DoctorIndexEvent.getDoctor(int doctorId) = GetDoctorEvent;
}
