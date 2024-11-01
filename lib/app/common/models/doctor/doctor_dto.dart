// ignore_for_file: invalid_annotation_target, non_constant_identifier_names

import 'package:admin_clinica_front/app/common/models/ubicacion/ubicacion_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_dto.freezed.dart';
part 'doctor_dto.g.dart';

@freezed
class DoctorDto with _$DoctorDto {
  const DoctorDto._(); // Constructor privado para habilitar getters adicionales

  const factory DoctorDto({
    required int id,
    @JsonKey(name: 'usuario_id') required int usuarioId,
    required String nombres,
    required String apellidos,
    required bool is_active,
    required String fechaNacimiento,
    required String celular,
    String? username, // Campo de DoctorsDto
    String? usuario_username, // Campo de DoctorDto
    String? dni, // Campo de DoctorDto
    List<UbicacionDto>? ubicaciones, // Campo de DoctorDto
    String? domicilio, // Campo de DoctorDto
    String? especialidad, // Campo de DoctorDto
  }) = _DoctorDto;

  factory DoctorDto.fromJson(Map<String, dynamic> json) => _$DoctorDtoFromJson(json);

  /// Getter para convertir `fechaNacimiento` de String a DateTime
  DateTime get fechaNacimientoAsDate => DateTime.parse(fechaNacimiento);
}
