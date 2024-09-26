part of 'sunat_cubit.dart';

@freezed
class SunatState with _$SunatState {
  const SunatState._();
  factory SunatState.initial() = Initial;
  factory SunatState.loading() = Loading;
  factory SunatState.sunatPersonaLoaded(SunatPersonaViewModel sunatPersona) = SunatPersonaLoaded;
  factory SunatState.failure(String error) = Failure;
}
