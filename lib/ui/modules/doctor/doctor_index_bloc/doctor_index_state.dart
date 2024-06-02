part of 'doctor_index_bloc.dart';

@freezed
class DoctorIndexState with _$DoctorIndexState {
  const DoctorIndexState._();
  factory DoctorIndexState.initial() = InitialState;
  factory DoctorIndexState.loading() = LoadingState;
  factory DoctorIndexState.doctorLoaded(DoctorsViewModel doctor) = DoctorLoadedState;
  factory DoctorIndexState.failure(String error) = FailureState;
  factory DoctorIndexState.success(String success) = SuccessState;
}
