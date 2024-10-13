import 'dart:async';

import 'package:admin_clinica_front/app/common/service/firebase_service.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'i_firebase_repository.dart';

class FirebaseRepository implements IFirebaseRepository {
  FirebaseRepository();

  final service = locator.get<FirebaseService>();

  @override
  Future<String?> getToken() async {
    return service.getToken();
  }

  @override
  StreamSubscription<RemoteMessage> escucharPrimerPlano(void Function(RemoteMessage remoteMessage)? handler) {
    return service.suscriptionFirstPlane(handler);
  }

  @override
  StreamSubscription<RemoteMessage> escucharSegundoPlano(Future<void> Function(RemoteMessage p1) handler) {
    throw UnimplementedError();
  }

  @override
  Future<void> suscriptionGroup(String group) {
    return service.suscriptionGroup(group);
  }
}
