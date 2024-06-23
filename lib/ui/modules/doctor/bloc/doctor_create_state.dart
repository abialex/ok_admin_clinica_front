part of 'doctor_create_bloc.dart';

@freezed
class DoctorCreateState with _$DoctorCreateState {
  const DoctorCreateState._();
  factory DoctorCreateState.initial() = Initial;
  factory DoctorCreateState.loading() = Loading;
  factory DoctorCreateState.doctorsLoaded(DoctorCredentialsViewModel doctorCredential) = DoctorCreated;
  factory DoctorCreateState.failure(String error) = Failure;
}
