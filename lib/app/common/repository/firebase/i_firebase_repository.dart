import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

abstract class IFirebaseRepository {
  Future<String?> getToken();
  StreamSubscription<RemoteMessage> escucharPrimerPlano(void Function(RemoteMessage remoteMessage)? handler);
  StreamSubscription<RemoteMessage> escucharSegundoPlano(Future<void> Function(RemoteMessage) handler);
  Future<void> suscriptionGroup(String group);
}
