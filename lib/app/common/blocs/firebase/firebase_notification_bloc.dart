import 'package:admin_clinica_front/app/common/repository/firebase/i_firebase_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_notification_event.dart';
part 'firebase_notification_state.dart';
part 'firebase_notification_bloc.freezed.dart';

class FirebaseNotificationBloc extends Bloc<FirebaseNotificationEvent, FirebaseNotificationState> {
  FirebaseNotificationBloc() : super(const FirebaseNotificationState.initial()) {
    on<SuscriptionFirstPlaneEvent>(suscriptionFirstPlane);
    on<GetTokenEvent>(getToken);
    on<SuscriptionGroupEvent>(suscriptionGroup);
    on<UnsuscriptionGroupEvent>(unsuscriptionGroup);
  }

  final repository = locator.get<IFirebaseRepository>();

  Future<void> suscriptionFirstPlane(SuscriptionFirstPlaneEvent event, Emitter<FirebaseNotificationState> emit) async {
    repository.escucharPrimerPlano(event.onData);
  }

  Future<void> getToken(GetTokenEvent event, Emitter<FirebaseNotificationState> emit) async {
    final token = await repository.getToken();
    print('fcm $token');
  }

  Future<void> suscriptionGroup(SuscriptionGroupEvent event, Emitter<FirebaseNotificationState> emit) async {
    await repository.suscriptionGroup(event.group);
  }

  Future<void> unsuscriptionGroup(UnsuscriptionGroupEvent event, Emitter<FirebaseNotificationState> emit) async {
    await repository.unsuscriptionGroup(event.group);
  }
}
