import 'package:bloc/bloc.dart';

class IndexCubit extends Cubit<int> {
  IndexCubit() : super(0);

  void goto(int mode) {
    emit(mode);
  }

  void resetToIndex() {
    emit(0);
  }
}
