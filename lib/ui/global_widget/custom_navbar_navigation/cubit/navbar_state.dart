part of 'navbar_cubit.dart';

class NavbarState {
  final int currentIndex;
  final int oldIndex;
  final int delayIndex;
  final List<RutasNav> modulesList;

  NavbarState({
    this.currentIndex = -1,
    this.oldIndex = -1,
    this.delayIndex = 1,
    this.modulesList = const [],
  });

  NavbarState copyWith({
    int? currentIndex,
    int? oldIndex,
    int? delayIndex,
    bool? isStart,
    List<RutasNav>? modulesList,
  }) =>
      NavbarState(
        currentIndex: currentIndex ?? this.currentIndex,
        oldIndex: oldIndex ?? this.oldIndex,
        delayIndex: delayIndex ?? this.delayIndex,
        modulesList: modulesList ?? this.modulesList,
      );
}

class NavbarInitial extends NavbarState {}
