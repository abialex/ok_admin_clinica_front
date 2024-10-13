import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_data_model.freezed.dart';
part 'notification_data_model.g.dart';

@freezed
class NotificationDataModel with _$NotificationDataModel {
  factory NotificationDataModel({
    String? rol,
    String? title,
    String? body,
    Map<String, dynamic>? data,
  }) = _NotificationDataModel;

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) => _$NotificationDataModelFromJson(json);
}
