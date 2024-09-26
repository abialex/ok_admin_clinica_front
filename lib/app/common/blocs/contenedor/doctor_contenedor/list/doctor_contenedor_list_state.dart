part of 'doctor_contenedor_list_bloc.dart';

@freezed
class DoctorContenedorListState with _$DoctorContenedorListState {
  const DoctorContenedorListState._();
  factory DoctorContenedorListState.initial() = DoctorContenedorListInitialState;
  factory DoctorContenedorListState.loading() = DoctorContenedorListLoadingState;
  factory DoctorContenedorListState.doctorContenedorLoaded(List<DoctorContenedorDataModel> items) = DoctorContenedorListLoadedState;
  factory DoctorContenedorListState.failure(String error) = DoctorContenedorListErrorState;
}
