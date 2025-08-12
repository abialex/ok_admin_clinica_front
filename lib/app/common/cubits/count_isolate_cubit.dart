import 'dart:async';
import 'dart:isolate';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountIsolateCubit extends Cubit<int> {
  CountIsolateCubit({required this.intervalAction}) : super(1) {
    startIsolate();
  }
  final int intervalAction;
  Isolate? _isolate;
  Timer? _timer;

  void changeCount(mode) {
    emit(mode);
  }

  void _reset() {
    emit(0);
  }

  void resetExternal() {
    emit(1);
  }

  startIsolate() async {
    try {
      final receivePort = ReceivePort();
      _isolate = await Isolate.spawn(_periodicTask, receivePort.sendPort);
      receivePort.listen((message) {
        if (message is int) {
          if (state >= intervalAction - 1) {
            _reset();
            return;
          }
          changeCount(state + 1);
        }
      });
    } catch (e) {
      print("------------------- $e");
    }
  }

  stopIsolate() {
    _isolate?.kill(priority: Isolate.immediate);
  }

  void _periodicTask(SendPort isolateData) {
    int counter = 0;
    _timer?.cancel();
    _timer = Timer.periodic(1.seconds, (timer) {
      if (counter >= intervalAction) {
        counter = 0;
      }
      isolateData.send(counter);
      counter++;
    });
  }

  @override
  Future<void> close() {
    _isolate?.kill(priority: Isolate.immediate);
    return super.close();
  }
}
