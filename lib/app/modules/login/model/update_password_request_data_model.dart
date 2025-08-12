import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_password_request_data_model.freezed.dart';
part 'update_password_request_data_model.g.dart';

@freezed
class UpdatePasswordRequestDataModel with _$UpdatePasswordRequestDataModel {
  const factory UpdatePasswordRequestDataModel({
    required String password1,
    required String password2,
  }) = _UpdatePasswordRequestDataModel;

  factory UpdatePasswordRequestDataModel.fromJson(Map<String, dynamic> json) => _$UpdatePasswordRequestDataModelFromJson(json);
}
