import 'package:bloc/bloc.dart';

import '../design_nav_bar_navigation.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(NavbarState());

  void updateIndexCurrent(int index) {
    //moreActions();
    emit(state.copyWith(
      //update  currentIndex && save index Old
      currentIndex: index,
      oldIndex: state.currentIndex,
    ));
  }

  void updateIndexDelay(int index) {
    emit(state.copyWith(
      //update  currentIndex && save index Old
      delayIndex: index,
    ));
  }

  void setupModules(List<RutasNav>? modulesList) {
    //moreActions();
    emit(state.copyWith(
      //update  currentIndex && save index Old
      modulesList: modulesList,
    ));
  }
}
