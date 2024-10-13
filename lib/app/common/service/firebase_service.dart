import 'dart:async';

import 'package:admin_clinica_front/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {
  static Future<void> init() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<String?> getToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  StreamSubscription<RemoteMessage> suscriptionFirstPlane(void Function(RemoteMessage)? onData) {
    return FirebaseMessaging.onMessage.listen(onData);
  }

  void suscriptionSecondPlane(Future<void> Function(RemoteMessage) handler) {
    return FirebaseMessaging.onBackgroundMessage(handler);
  }

  StreamSubscription<RemoteMessage> suscriptionOpenApp(void Function(RemoteMessage)? onData) {
    return FirebaseMessaging.onMessageOpenedApp.listen(onData);
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("object");
}
