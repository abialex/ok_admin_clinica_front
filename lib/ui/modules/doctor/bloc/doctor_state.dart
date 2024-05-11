part of 'doctor_bloc.dart';

@freezed
class DoctorState with _$DoctorState {
  const DoctorState._();
  factory DoctorState.initial() = Initial;
  factory DoctorState.loading() = Loading;
  factory DoctorState.doctorsLoaded(List<DoctorsViewModel> doctors) = DoctorsLoaded;
  factory DoctorState.failure(String error) = Failure;
}
