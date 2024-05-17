import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_update_event.dart';
part 'doctor_update_state.dart';
part 'doctor_update_bloc.freezed.dart';

class DoctorUpdateBloc extends Bloc<DoctorUpdateEvent, DoctorUpdateState> {
  DoctorUpdateBloc() : super(_Initial()) {
    on<DoctorUpdateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
