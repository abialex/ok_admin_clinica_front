import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CitaCardTest extends StatelessWidget {
  final CitaDTO cita;

  const CitaCardTest({Key? key, required this.cita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Doctor: ${cita.doctor}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Ubicación: ${cita.ubicacionId ?? 'N/A'}'),
            Text('Estado: ${cita.estadoString}'),
            Text('Tipo: ${cita.tipoString}'),
            Text('Paciente: ${cita.datosPaciente ?? 'N/A'}'),
            Text('Celular: ${cita.celular}'),
            Text('Razón: ${cita.razon}'),
            Text('Fecha y Hora de Cita: ${DateFormat('yyyy-MM-dd – kk:mm').format(cita.fechaHoraCitaDate)}'),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
