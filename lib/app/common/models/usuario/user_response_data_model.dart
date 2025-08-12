// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response_data_model.freezed.dart';
part 'user_response_data_model.g.dart';

@freezed
class UserResponseDataModel with _$UserResponseDataModel {
  const factory UserResponseDataModel({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'is_new_token') required bool isNewToken,
    @JsonKey(name: 'dias_token') required int diasToken,
    required String nombres,
    required String token,
    required String rol,
    required String username,
    String? tipo,
    bool? isNewPassword,
    required List<int> ubicaciones,
  }) = _UserResponseDataModel;

  factory UserResponseDataModel.fromJson(Map<String, dynamic> json) => _$UserResponseDataModelFromJson(json);
}
