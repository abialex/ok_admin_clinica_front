import 'package:admin_clinica_front/app/common/models/notification/notification_data_model.dart';
import 'package:either_dart/either.dart';

abstract class INotificationRepository {
  Future<Either<String, bool>> sendGroupNotifcation(NotificationDataModel request);
}
