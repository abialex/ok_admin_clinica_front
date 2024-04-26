// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'authenticated_dto.g.dart';

@JsonSerializable()
class AuthenticatedDTO {
  final String mensaje;
  final bool isValid;
  AuthenticatedDTO({
    required this.mensaje,
    required this.isValid,
  });
  //fromJson
  factory AuthenticatedDTO.fromJson(Map<String, dynamic> map) =>
      _$AuthenticatedDTOFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$AuthenticatedDTOToJson(this);
}
