import 'package:admin_clinica_front/app/common/models/api_model/api_model.dart';
import 'package:admin_clinica_front/app/common/models/notification/notification_data_model.dart';
import 'package:admin_clinica_front/app/common/utils/api_utils.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class NotificationService {
  final _dio = locator.get<Dio>();

  Future<Either<String, bool>> sendGroupNotification(NotificationDataModel request) async {
    final response = await _dio.post<ApiModel>("service_external/firebase/send-group-notification", data: request.toJson());
    return ApiUtils.reponseHandler(response, (data) => true);
  }
}
