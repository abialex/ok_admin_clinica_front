part of 'navigator_cubit.dart';

@freezed
class NavigatorState with _$NavigatorState {
  const factory NavigatorState({
    @Default(-1) int currentIndex,
    @Default(-1) int oldIndex,
    @Default(-1) int delayIndex,
    @Default([]) List<RutasNav> modulesList, //valid form
  }) = _NavigatorState;
}
