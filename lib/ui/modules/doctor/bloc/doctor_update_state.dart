part of 'doctor_update_bloc.dart';

@freezed
class DoctorUpdateState with _$DoctorUpdateState {
  const DoctorUpdateState._();
  factory DoctorUpdateState.initial() = Initial;
  factory DoctorUpdateState.loading() = Loading;
  factory DoctorUpdateState.doctorSetup(DoctorViewModel doctorViewModel) = DoctorSetup;
  factory DoctorUpdateState.doctorUpdated(int doctorId) = DoctorUpdated;
  factory DoctorUpdateState.failure(String error) = Failure;
}
