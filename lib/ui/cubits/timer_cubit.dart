import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class TimerCubit extends Cubit<double> {
  TimerCubit() : super(0);

  Timer? timer;
  Timer? timerprog;
  void timerStart(void Function() action) {
    timer?.cancel();
    timerprog?.cancel();
    resetTimer();

    timerprog = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      emit(state + 0.13 / 6);
      if (state >= 1) {
        timer.cancel();
        resetTimer();
      }
    });
    timer = Timer(const Duration(milliseconds: 850), action);
  }

  void changeTimer(double mode) {
    emit(mode);
  }

  void resetTimer() {
    emit(0);
  }
}
