part of 'doctor_list_bloc.dart';

@freezed
class DoctorListState with _$DoctorListState {
  const DoctorListState._();
  factory DoctorListState.initial() = Initial;
  factory DoctorListState.loading() = Loading;
  factory DoctorListState.doctorsLoaded(List<DoctorsViewModel> doctors) = DoctorsLoaded;
  factory DoctorListState.failure(String error) = Failure;
}
