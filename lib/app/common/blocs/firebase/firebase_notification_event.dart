part of 'firebase_notification_bloc.dart';

@freezed
class FirebaseNotificationEvent with _$FirebaseNotificationEvent {
  const factory FirebaseNotificationEvent.suscriptionFirstPlane(void Function(RemoteMessage)? onData) = SuscriptionFirstPlaneEvent;
  const factory FirebaseNotificationEvent.suscriptionSecondPlane(void Function(RemoteMessage)? onData) = SuscriptionSecondPlaneEvent;
  const factory FirebaseNotificationEvent.getToken() = GetTokenEvent;
}
