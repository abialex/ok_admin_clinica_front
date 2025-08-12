import 'package:freezed_annotation/freezed_annotation.dart';
part 'persona_sunat_dto.g.dart';

@JsonSerializable()
class PersonaSunatDto {
  final String nombres;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String tipoDocumento;
  final String numeroDocumento;
  final String digitoVerificador;

  PersonaSunatDto({
    required this.nombres,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.tipoDocumento,
    required this.numeroDocumento,
    required this.digitoVerificador,
  });

  //fromJson
  factory PersonaSunatDto.fromJson(Map<String, dynamic> map) => _$PersonaSunatDtoFromJson(map);

  //ToJson
  Map<String, dynamic> toJson() => _$PersonaSunatDtoToJson(this);

  @override
  String toString() {
    return '$nombres $apellidoPaterno $apellidoMaterno';
  }
}
