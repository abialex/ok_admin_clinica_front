import 'package:admin_clinica_front/app/common/models/notification/notification_data_model.dart';
import 'package:admin_clinica_front/app/common/repository/notification/inotification_repository.dart';
import 'package:admin_clinica_front/app/common/service/notification_service.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:either_dart/either.dart';

class NotificationRepository implements INotificationRepository {
  final service = locator.get<NotificationService>();

  @override
  Future<Either<String, bool>> sendGroupNotifcation(NotificationDataModel request) {
    return service.sendGroupNotification(request);
  }
}
