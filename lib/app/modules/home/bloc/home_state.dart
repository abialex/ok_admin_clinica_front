part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({
    @Default(false) bool isValid, //valid form
    @Default(false) bool fetching, //solicitando
    @Default(null) String? messageError, //solicitando
    @Default(null) UserResponseDataModel? usuario, //solicitando
  }) = _Initial;
}
