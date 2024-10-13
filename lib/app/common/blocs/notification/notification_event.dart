part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.sendGroupNotification(NotificationDataModel request) = SendGroupNotifcationEvent;
}
