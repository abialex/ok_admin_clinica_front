import 'dart:async';

// import 'package:admin_clinica_front/app/config/notification_local.dart';
import 'package:admin_clinica_front/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
  }

  Future<String?> getToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  StreamSubscription<RemoteMessage> suscriptionFirstPlane(void Function(RemoteMessage)? onData) {
    return FirebaseMessaging.onMessage.listen(onData);
  }

  void suscriptionSecondPlane(Future<void> Function(RemoteMessage) handler) {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  StreamSubscription<RemoteMessage> suscriptionOpenApp(void Function(RemoteMessage)? onData) {
    return FirebaseMessaging.onMessageOpenedApp.listen(onData);
  }

  Future<void> suscriptionGroup(String group) async {
    return FirebaseMessaging.instance.subscribeToTopic(group);
  }

  Future<void> unsuscriptionGroup(String group) async {
    return FirebaseMessaging.instance.unsubscribeFromTopic(group);
  }

  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage remoteMessage) async {
    // const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    //   '12345',
    //   'Firebase',
    //   channelDescription: 'Canal usado para avisar las entradas de firebase',
    //   sound: RawResourceAndroidNotificationSound('pepe'), // Usa un archivo en res/raw
    //   importance: Importance.max,
    //   priority: Priority.high,
    // );

    // const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    // await flutterLocalNotificationsPlugin.show(
    //   0,
    //   remoteMessage.data["titulo"] ?? 'N.A',
    //   remoteMessage.data["body"] ?? '',
    //   platformChannelSpecifics,
    //   // payload:
    // );
  }
}
