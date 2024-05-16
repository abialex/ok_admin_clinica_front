import 'package:admin_clinica_front/ui/global_widget/custom_navbar_navigation/design_nav_bar_navigation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigator_state.dart';
part 'navigator_cubit.freezed.dart';

class NavigatorCubit extends Cubit<NavigatorState> {
  NavigatorCubit() : super(const NavigatorState());

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
      modulesList: modulesList ?? [],
    ));
  }
}
