import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';

class CitaPromedioDateTime {
  final DateTime date;
  final double promedio;
  final int cantidad;
  final List<CitaDTO> citas;
  CitaPromedioDateTime({required this.date, required this.promedio, required this.cantidad, required this.citas});
}
