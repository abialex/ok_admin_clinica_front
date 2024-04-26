// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'api_model.g.dart';

@JsonSerializable()
class ApiModel {
  final String tipo;
  final String message;
  final String url;
  final dynamic data;
  final dynamic fields_errors;

  ApiModel({
    required this.tipo,
    required this.message,
    required this.url,
    required this.data,
    required this.fields_errors,
  });

  //fromJson
  factory ApiModel.fromJson(Map<String, dynamic> map) =>
      _$ApiModelFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$ApiModelToJson(this);
}
